// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import '/screens/home_screen.dart';
import '/screens/sign_in_screen.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

class SplashScreen extends StatefulWidget {
  static Route get route => MaterialPageRoute(
        builder: (context) => const SplashScreen(),
      );
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final StreamSubscription<firebase.User?> listener;

  @override
  void initState() {
    super.initState();
    _handleAuthenticatedState();
  }

  Future<void> _handleAuthenticatedState() async {
    final auth = firebase.FirebaseAuth.instance;
    if (!mounted) {
      return;
    }
    listener = auth.authStateChanges().listen(
      (user) async {
        if (user != null) {
          // get Stream user token
          final callable =
              FirebaseFunctions.instance.httpsCallable('getStreamUserToken');
          final results = await Future.wait(
            [
              callable(),
              // delay to show loading indicator
              Future.delayed(
                const Duration(
                  milliseconds: 700,
                ),
              ),
            ],
          );
          // connect Stream user
          final client = StreamChatCore.of(context).client;
          await client.connectUser(
            User(id: user.uid),
            results[0]!.data,
          );
          // authenticated
          Navigator.of(context).pushReplacement(HomeScreen.route);
        } else {
          // delay to show loading indicator
          await Future.delayed(
            Duration(
              milliseconds: 700,
            ),
          );
          // not authenticated
          Navigator.of(context).pushReplacement(SignInScreen.route);
        }
      },
    );
  }

  @override
  void dispose() {
    listener.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
