import 'package:atlas/atlas.dart';
import 'package:flutter/material.dart';

import '../mapbox_atlas.dart';

void main() {
  AtlasProvider.instance = MapBoxAtlas();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HERE SDK for Flutter - Hello Map!',
      home: Atlas(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            latitude: 38.74412794727255,
            longitude: -9.148597681706798,
          ),
        ),
      ),
    );
  }
}
