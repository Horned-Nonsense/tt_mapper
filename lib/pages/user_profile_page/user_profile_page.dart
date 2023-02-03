import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tt_mapper/models/mapper_user.dart';

class UserProfilePage extends StatefulWidget implements AutoRouteWrapper {
  final MapperUser currentUser;

  const UserProfilePage({
    super.key,
    required this.currentUser,
  });

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return this;
  }
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Profile',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          ),
          backgroundColor: Colors.deepPurpleAccent,
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 28),
            _buildUserAvatar(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 32,
                ),
                child: _buildUserInfo(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfo() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Text(
            widget.currentUser.fullName,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 28),
          Text(
            widget.currentUser.emailAddress,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserAvatar() {
    return CircleAvatar(
      radius: 76,
      backgroundColor: const Color(0xaa205660),
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: CircleAvatar(
          radius: 72,
          backgroundImage: NetworkImage(widget.currentUser.avatarUrl ?? ''),
        ),
      ),
    );
  }
}
