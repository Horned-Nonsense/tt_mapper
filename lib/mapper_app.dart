import 'package:flutter/material.dart';

import 'pages/login_page/login_page.dart';
import 'pages/map_page/map_page.dart';

class MapperApp extends StatelessWidget {
  const MapperApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: MapPage(),
    );
  }
}
