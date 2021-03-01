import 'dart:async';

import 'package:atlas/atlas.dart' as Atlas;
import 'package:flutter/material.dart';
import 'package:mapbox_atlas/src/mapbox_atlas_controller.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

import 'utils.dart';

class MapBoxProvider extends StatefulWidget {
  final Atlas.CameraPosition initialCameraPosition;
  final Atlas.ArgumentCallback<Atlas.AtlasController> onMapCreated;
  final Set<Atlas.Marker> markers;

  MapBoxProvider({
    this.initialCameraPosition,
    this.onMapCreated,
    this.markers,
  });

  @override
  _MapBoxProviderState createState() => _MapBoxProviderState();
}

class _MapBoxProviderState extends State<MapBoxProvider> {
  Atlas.CameraPosition get initialCameraPosition =>
      widget.initialCameraPosition;

  Atlas.ArgumentCallback<Atlas.AtlasController> get onMapCreated =>
      widget.onMapCreated;

  Set<Atlas.Marker> get markers => widget.markers;

  @override
  Widget build(BuildContext context) {
    return MapboxMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: initialCameraPosition.toMapBoxCameraPosition(),
    );
  }

  Future<void> _onMapCreated(MapboxMapController mapBoxController) async {
    onMapCreated?.call(
      MapboxAtlasController(controller: mapBoxController),
    );

    Timer(Duration(seconds: 1), () => addMarkers(mapBoxController));
  }

  Future<void> addMarkers(
    MapboxMapController mapBoxController,
  ) async {
    for (final atlasMarker in markers) {
      final symbol = SymbolOptions(
        geometry: LatLng(
          atlasMarker.position.latitude,
          atlasMarker.position.longitude,
        ),
        iconImage: atlasMarker.icon.assetName,
        iconSize: atlasMarker.icon.width / 800,
      );

      mapBoxController.addSymbol(symbol);
    }
  }
}
