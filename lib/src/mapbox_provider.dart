import 'package:atlas/atlas.dart' as atlas;
import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class MapBoxProvider extends StatefulWidget {
  final atlas.CameraPosition initialCameraPosition;

  MapBoxProvider({this.initialCameraPosition});

  @override
  _MapBoxProviderState createState() => _MapBoxProviderState();
}

class _MapBoxProviderState extends State<MapBoxProvider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MapboxMap(
        onMapCreated: (_) {},
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.initialCameraPosition.target.latitude,
            widget.initialCameraPosition.target.longitude,
          ),
          zoom: 13,
        ),
        onStyleLoadedCallback: () {},
      ),
    );
  }
}
