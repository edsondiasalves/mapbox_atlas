import 'package:atlas/atlas.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart' as Mapbox;

import 'utils.dart';

class MapboxAtlasController implements AtlasController {
  final Mapbox.MapboxMapController _controller;

  MapboxAtlasController({@required Mapbox.MapboxMapController controller})
      : assert(controller != null),
        _controller = controller;

  @override
  void changeUserLocationIcon(String asset) {}

  @override
  Future<CameraPosition> getCameraPosition() {
    throw UnimplementedError();
  }

  @override
  Future<LatLng> getLatLng(ScreenCoordinates screenCoordinates) {
    throw UnimplementedError();
  }

  @override
  Future<ScreenCoordinates> getScreenCoordinate(LatLng latLng) {
    throw UnimplementedError();
  }

  @override
  Future<LatLngBounds> getVisibleArea() {
    throw UnimplementedError();
  }

  @override
  Future<void> moveCamera(CameraPosition cameraPosition) {
    _controller.moveCamera(
      Mapbox.CameraUpdate.newCameraPosition(
        cameraPosition.toMapBoxCameraPosition(),
      ),
    );
    return null;
  }

  @override
  Future<void> updateBounds(LatLngBounds bounds, double padding) {
    throw UnimplementedError();
  }

  @override
  Future<void> updateBoundsWithPaddingToAllSides(
    LatLngBounds bounds,
    double north,
    double east,
    double south,
    double west,
  ) {
    throw UnimplementedError();
  }
}
