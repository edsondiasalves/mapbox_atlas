import 'package:atlas/atlas.dart';
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
    AtlasController _atlasController;

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter MapBox Provider'),
      ),
      drawer: SettingsSideMenu(),
      body: BlocListener<ConfigurationBloc, ConfigurationState>(
        listener: (context, state) {
          if (state is CameraChangedState) {
            _atlasController.moveCamera(state.currentCameraPosition);
          }
        },
        child: BlocBuilder<ConfigurationBloc, ConfigurationState>(
          buildWhen: (previous, current) =>
              current is InitialPositionState || current is MarkerLoadedState,
          builder: (context, state) {
            return Atlas(
              key: UniqueKey(),
              initialCameraPosition: state.initialCameraPosition,
              markers: state.markers,
              onMapCreated: (AtlasController atlasController) {
                _atlasController = atlasController;
              },
            );
          },
        ),
      ),
    );
  }
}
