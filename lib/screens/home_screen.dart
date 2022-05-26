import 'package:chat_app/pages/call_page.dart';
import 'package:chat_app/pages/contact_page.dart';
import 'package:chat_app/pages/message_page.dart';
import 'package:chat_app/pages/notification_page.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  final pages = const [
    MessagesPage(),
    NotificationsPage(),
    CallsPage(),
    ContactsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[0],
      bottomNavigationBar: _BottomNavigationBar(),
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          _NavigationBarItem(),
          _NavigationBarItem(),
          _NavigationBarItem(),
          _NavigationBarItem(),
        ],
      ),
    );
  }
}

class _NavigationBarItem extends StatelessWidget {
  const _NavigationBarItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('item');
  }
}
