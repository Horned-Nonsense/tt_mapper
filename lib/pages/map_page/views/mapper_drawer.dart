import 'package:flutter/material.dart';
import 'package:tt_mapper/config/router/mapper_router.dart';

import '../../../models/mapper_user.dart';

class MapperDrawer extends StatelessWidget {
  final MapperUser? user;
  final VoidCallback? onTap;

  const MapperDrawer({
    super.key,
    this.user,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(height: 64),
          ListTile(
            title: const Text('Profile'),
            onTap: () {
              router.pushProfile(
                user ?? const MapperUser.empty(),
              );
            },
          ),
          ListTile(
            title: const Text('Sign Out'),
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}
