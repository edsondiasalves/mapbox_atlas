import 'package:atlas/atlas.dart' as atlas;
import 'package:flutter_test/flutter_test.dart';
import 'package:mapbox_atlas/src/mapbox_atlas_controller.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:mockito/mockito.dart';

class MockMapBoxController extends Mock implements MapboxMapController {}

main() {
  group('MapBoxAtlasController', () {
    MapboxMapController mapBoxMapController;
    MapboxAtlasController mapBoxAtlasController;

    setUp(() {
      mapBoxMapController = MockMapBoxController();
      mapBoxAtlasController = MapboxAtlasController(
        controller: mapBoxMapController,
      );
    });

    test('throws error when GoogleMapController is null', () {
      try {
        MapboxAtlasController(controller: null);
      } catch (ex) {
        expect(ex, isAssertionError);
      }
    });

    test('calls GoogleMapController moveCamera method', () async {
      final cameraPosition = atlas.CameraPosition(
        target: atlas.LatLng(latitude: 1.0, longitude: 2.0),
        zoom: 3.0,
      );

      await mapBoxAtlasController.moveCamera(cameraPosition);
      verify(mapBoxMapController.moveCamera(any)).called(1);
    });
  });
}
