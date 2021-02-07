import 'package:atlas/atlas.dart' as Atlas;
import 'package:mapbox_gl/mapbox_gl.dart' as MapBox;

extension AtlasToMapBoxLatLng on Atlas.LatLng {
  MapBox.LatLng toMapBoxLatLng() {
    return MapBox.LatLng(this.latitude, this.longitude);
  }
}

extension AtlasToMapBoxCameraPosition on Atlas.CameraPosition {
  MapBox.CameraPosition toMapBoxCameraPosition() {
    return MapBox.CameraPosition(
      target: this.target.toMapBoxLatLng(),
      zoom: this.zoom,
    );
  }
}
