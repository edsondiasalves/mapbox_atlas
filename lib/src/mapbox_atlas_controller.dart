import 'package:atlas/atlas.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart' as MapBox;

import 'utils.dart';

class MapboxAtlasController implements AtlasController {
  final MapBox.MapboxMapController _controller;

  MapboxAtlasController({@required MapBox.MapboxMapController controller})
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
      MapBox.CameraUpdate.newCameraPosition(
        cameraPosition.toMapBoxCameraPosition(),
      ),
    );
    return null;
  }

  @override
  Future<void> updateBounds(LatLngBounds bounds, double padding) async {
    await Future.delayed(Duration(seconds: 1));

    final boundingBoxPosition = MapBox.CameraUpdate.newLatLngBounds(
      bounds.toMapBoxLatLngBounds(),
      left: padding,
      top: padding,
      right: padding,
      bottom: padding,
    );

    return _controller.moveCamera(boundingBoxPosition);
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
