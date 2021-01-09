import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class FakePlatformMapBox {
  FakePlatformMapBox(int id, Map<dynamic, dynamic> params) {
    cameraPosition = CameraPosition.fromMap(params['initialCameraPosition']);
    channel = MethodChannel(
      'plugins.flutter.io/mapbox_gl',
      const StandardMethodCodec(),
    );
    channel.setMockMethodCallHandler(onMethodCall);
  }

  MethodChannel channel;

  CameraPosition cameraPosition;

  Future<dynamic> onMethodCall(MethodCall call) {
    switch (call.method) {
      case 'camera#move':
        return Future<void>.sync(() {});
      default:
        return Future<void>.sync(() {});
    }
  }
}

class FakePlatformViewsController {
  FakePlatformMapBox lastCreatedView;

  Future<dynamic> fakePlatformViewsMethodHandler(MethodCall call) {
    switch (call.method) {
      case 'create':
        final Map<dynamic, dynamic> args = call.arguments;
        final Map<dynamic, dynamic> params = _decodeParams(args['params']);
        lastCreatedView = FakePlatformMapBox(
          args['id'],
          params,
        );
        return Future<int>.sync(() => 1);
      default:
        return Future<void>.sync(() {});
    }
  }

  void reset() {
    lastCreatedView = null;
  }
}

Map<dynamic, dynamic> _decodeParams(Uint8List paramsMessage) {
  final ByteBuffer buffer = paramsMessage.buffer;
  final ByteData messageBytes = buffer.asByteData(
    paramsMessage.offsetInBytes,
    paramsMessage.lengthInBytes,
  );
  return const StandardMessageCodec().decodeMessage(messageBytes);
}
