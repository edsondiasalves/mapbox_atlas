import 'package:atlas/atlas.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mapbox_atlas/src/mapbox_provider.dart';

class MapBoxAtlas extends Provider {
  @override
  Widget build({
    CameraPosition initialCameraPosition,
    Set<Marker> markers,
    Set<Circle> circles,
    Set<Polygon> polygons,
    Set<Polyline> polylines,
    onTap,
    onPoiTap,
    onLongPress,
    onMapCreated,
    onCameraPositionChanged,
    onLocationChanged,
    onPan,
    bool showMyLocation,
    bool showMyLocationButton,
    bool followMyLocation,
    MapType mapType,
    bool showTraffic,
    MapLanguage mapLanguage,
  }) {
    return MapBoxProvider(
      initialCameraPosition: initialCameraPosition,
    );
  }
}
