import 'package:atlas/atlas.dart' as Atlas;
import 'package:flutter/material.dart';
import 'package:mapbox_atlas/src/mapbox_atlas_controller.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

import 'utils.dart';

class MapBoxProvider extends StatefulWidget {
  final Atlas.CameraPosition initialCameraPosition;
  final Atlas.ArgumentCallback<Atlas.AtlasController> onMapCreated;

  MapBoxProvider({this.initialCameraPosition, this.onMapCreated});

  @override
  _MapBoxProviderState createState() => _MapBoxProviderState();
}

class _MapBoxProviderState extends State<MapBoxProvider> {
  Atlas.CameraPosition get initialCameraPosition =>
      widget.initialCameraPosition;

  Atlas.ArgumentCallback<Atlas.AtlasController> get onMapCreated =>
      widget.onMapCreated;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MapboxMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: initialCameraPosition.toMapBoxCameraPosition(),
      ),
    );
  }

  void _onMapCreated(MapboxMapController controller) {
    onMapCreated?.call(
      MapboxAtlasController(controller: controller),
    );
  }
}
