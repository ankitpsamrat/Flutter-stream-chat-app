import 'package:flutter/material.dart';

const users = [
  userGordon,
  userSalvatore,
  userSacha,
  userDeven,
  userSahil,
  userReuben,
  userNash,
];

const userGordon = DemoUser(
  id: 'gordon',
  name: 'Ankit Samrat',
  image:
      'https://pbs.twimg.com/profile_images/1262058845192335360/Ys_-zu6W_400x400.jpg',
);

const userSalvatore = DemoUser(
  id: 'salvatore',
  name: 'Abhay Samrat',
  image:
      'https://pbs.twimg.com/profile_images/1252869649349238787/cKVPSIyG_400x400.jpg',
);

const userSacha = DemoUser(
  id: 'sacha',
  name: 'Uday Samrat',
  image:
      'https://pbs.twimg.com/profile_images/1199684106193375232/IxA9XLuN_400x400.jpg',
);

const userDeven = DemoUser(
  id: 'deven',
  name: 'Amar Samrat',
  image:
      'https://pbs.twimg.com/profile_images/1036078628189208576/77mpwW3I_400x400.jpg',
);

const userSahil = DemoUser(
  id: 'sahil',
  name: 'Viru Samrat',
  image:
      'https://pbs.twimg.com/profile_images/1036078628189208576/77mpwW3I_400x400.jpg',
);

const userReuben = DemoUser(
  id: 'reuben',
  name: 'Tony Samrat',
  image:
      'https://pbs.twimg.com/profile_images/1370571324578480130/UxBBI30i_400x400.jpg',
);

const userNash = DemoUser(
  id: 'nash',
  name: 'Thor Samrat',
  image:
      'https://pbs.twimg.com/profile_images/1036078628189208576/77mpwW3I_400x400.jpg',
);

@immutable
class DemoUser {
  final String id;
  final String name;
  final String image;

  const DemoUser({
    required this.id,
    required this.name,
    required this.image,
  });
}
