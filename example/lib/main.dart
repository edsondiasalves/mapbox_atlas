import 'package:atlas/atlas.dart';
import 'package:example/utils/constants.dart';
import 'package:example/widgets/settings_side_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mapbox_atlas/mapbox_atlas.dart';

import 'bloc/configuration_bloc.dart';

void main() {
  AtlasProvider.instance = MapBoxAtlas();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (BuildContext context) => ConfigurationBloc(),
        child: MapBoxAtlasSample(key: UniqueKey()),
      ),
    );
  }
}

class MapBoxAtlasSample extends StatelessWidget {
  const MapBoxAtlasSample({@required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConfigurationBloc, ConfigurationState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Flutter MapBox Provider'),
          ),
          drawer: SettingsSideMenu(),
          body: BlocBuilder<ConfigurationBloc, ConfigurationState>(
            builder: (context, state) {
              return Atlas(
                key: UniqueKey(),
                initialCameraPosition: CameraPosition(
                  target: getCityCoordinates(state.city),
                  zoom: 13,
                ),
              );
            },
          ),
        );
      },
    );
  }

  LatLng getCityCoordinates(City city) {
    switch (city) {
      case City.Lisbon:
        return LisbonCoordinates;
        break;
      case City.SaoPaulo:
        return SaoPauloCoordinates;
        break;
      case City.Tokyo:
        return TokyoCoordinates;
        break;
      default:
        return LisbonCoordinates;
        break;
    }
  }
}
