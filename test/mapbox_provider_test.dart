import 'package:atlas/atlas.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mapbox_gl/mapbox_gl.dart' as MapBox;

import '../lib/mapbox_atlas.dart';
import 'fake_maps_controller.dart';

main() {
  final FakePlatformViewsController fakePlatformViewsController =
      FakePlatformViewsController();

  setUpAll(() {
    SystemChannels.platform_views.setMockMethodCallHandler(
      fakePlatformViewsController.fakePlatformViewsMethodHandler,
    );
  });

  group('MapBox Atlas Provider', () {
    MapBoxAtlas mapBoxAtlas;
    CameraPosition initialCameraPosition;

    setUp(() {
      mapBoxAtlas = MapBoxAtlas();
      AtlasProvider.instance = mapBoxAtlas;
      initialCameraPosition = CameraPosition(
        target: LatLng(
          latitude: 41.8781,
          longitude: -87.6298,
        ),
        zoom: 12,
      );
      fakePlatformViewsController.reset();
    });

    testWidgets('should return correct initial camera position', (
      WidgetTester tester,
    ) async {
      final expectedPosition = MapBox.LatLng(
        initialCameraPosition.target.latitude,
        initialCameraPosition.target.longitude,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Atlas(initialCameraPosition: initialCameraPosition),
        ),
      );
      await tester.pumpAndSettle();

      final FakePlatformMapBox platformMapBox =
          fakePlatformViewsController.lastCreatedView;

      expect(expectedPosition, platformMapBox.cameraPosition.target);
      expect(12.0, platformMapBox.cameraPosition.zoom);
    });
  });
}
