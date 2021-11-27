import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freelance_world_flutter/models/freelancer.dart';

class ProfileFreelancer extends StatelessWidget {
  final Freelancer freelancer;
  const ProfileFreelancer({required this.freelancer});

  final double coverHeight = 280;
  final double profileHeight = 144;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: EdgeInsets.zero,
      children: [
        buildTop(),
        buildContent(),
      ],
    ));
  }

  Widget buildTop() {
    final top = coverHeight - profileHeight / 2;
    final bottom = profileHeight / 2;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: bottom),
          child: buildCoverImage(),
        ),
        Positioned(
          top: top,
          child: buildProfileImage(),
        ),
      ],
    );
  }

  Widget buildCoverImage() => Container(
        color: Colors.grey,
        child: Image.network(
            'https://media.istockphoto.com/photos/programming-code-abstract-technology-background-of-software-developer-picture-id1224500457?b=1&k=20&m=1224500457&s=170667a&w=0&h=OOPEMFamnZo63_2t_W40mYSfU1WrFAHHZRBgNN-GSgI=',
            width: double.infinity,
            height: coverHeight,
            fit: BoxFit.cover),
      );

  Widget buildProfileImage() => CircleAvatar(
        radius: profileHeight / 2,
        backgroundColor: Colors.grey.shade800,
        backgroundImage: const NetworkImage(
            'https://media.istockphoto.com/photos/headshot-portrait-of-smiling-ethnic-businessman-in-office-picture-id1300512215?b=1&k=20&m=1300512215&s=170667a&w=0&h=LsZL_-vvAHB2A2sNLHu9Vpoib_3aLLkRamveVW3AGeQ='),
      );

  Widget buildContent() => Column(
        children: [
          const SizedBox(height: 8),
          Text(
            utf8.decode(freelancer.firstname.toString().runes.toList()),
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            utf8.decode(freelancer.lastname.toString().runes.toList()),
            style: const TextStyle(fontSize: 20, color: Colors.black),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildSocialIcon(FontAwesomeIcons.slack),
              const SizedBox(height: 12),
              buildSocialIcon(FontAwesomeIcons.github),
              const SizedBox(height: 12),
              buildSocialIcon(FontAwesomeIcons.twitter),
              const SizedBox(height: 12),
              buildSocialIcon(FontAwesomeIcons.linkedin),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 16),
          buildAbout(),
          const SizedBox(height: 32),
        ],
      );

  Widget buildAbout() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              utf8.decode(freelancer.profession.toString().runes.toList()),
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              utf8.decode(freelancer.description.toString().runes.toList()),
              style: const TextStyle(fontSize: 18, height: 1.4),
            ),
          ],
        ),
      );

  Widget buildSocialIcon(IconData icon) => CircleAvatar(
        radius: 25,
        child: Center(
          child: Icon(
            icon,
            size: 32,
          ),
        ),
      );
}
