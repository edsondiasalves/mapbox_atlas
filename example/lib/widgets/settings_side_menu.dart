import 'package:example/bloc/configuration_bloc.dart';
import 'package:example/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsSideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 180,
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text('MapBox Settings'),
            onTap: () => {},
          ),
          BlocBuilder<ConfigurationBloc, ConfigurationState>(
            builder: (context, state) {
              return Column(
                children: [
                  _groupTitle(
                    text: 'Initial Position',
                    padding: EdgeInsets.only(bottom: 10),
                  ),
                  ..._buildCityList(
                    context: context,
                    initialPosition: state.initialCity,
                    onChangeCity: onChangeInitialPosition,
                  ),
                  _groupTitle(
                    text: 'Move Camera',
                    padding: EdgeInsets.only(bottom: 10, top: 10),
                  ),
                  ..._buildCityList(
                    context: context,
                    initialPosition: state.currentCity,
                    onChangeCity: onChangeCameraPosition,
                  ),
                  _groupTitle(
                    text: 'Markers',
                    padding: EdgeInsets.only(bottom: 10, top: 10),
                  ),
                  ..._buildMarkerPlaceList(
                    context: context,
                    placePosition: state.currentMarkersPlace,
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }

  List<Widget> _buildCityList({
    BuildContext context,
    City initialPosition,
    Function(BuildContext, City) onChangeCity,
  }) {
    List<Widget> cities = [];
    City.values.forEach((city) => {
          cities.add(Container(
            height: 35,
            child: Row(
              children: [
                Radio(
                  value: city,
                  groupValue: initialPosition,
                  onChanged: (City city) => onChangeCity(context, city),
                ),
                Text(city.toString().split('.')[1]),
              ],
            ),
          ))
        });
    return cities;
  }

  List<Widget> _buildMarkerPlaceList({
    BuildContext context,
    MarkerPlace placePosition,
  }) {
    List<Widget> places = [];
    MarkerPlace.values.forEach((place) => {
          places.add(Container(
            height: 35,
            child: Row(
              children: [
                Radio(
                  value: place,
                  groupValue: placePosition,
                  onChanged: (MarkerPlace place) {
                    BlocProvider.of<ConfigurationBloc>(context).add(
                      AddMarkersStarted(placePosition: place),
                    );
                  },
                ),
                Text(place.toString().split('.')[1]),
              ],
            ),
          ))
        });
    return places;
  }

  Container _groupTitle({String text, EdgeInsets padding}) {
    return Container(
      child: Text(text, style: TextStyle(fontWeight: FontWeight.bold)),
      padding: padding,
    );
  }

  final Function(BuildContext, City) onChangeInitialPosition = (
    BuildContext context,
    City value,
  ) {
    BlocProvider.of<ConfigurationBloc>(context).add(
      ChangeInitialPositionStarted(initialCity: value),
    );
  };

  final Function(BuildContext, City) onChangeCameraPosition = (
    BuildContext context,
    City value,
  ) {
    BlocProvider.of<ConfigurationBloc>(context).add(
      ChangeCameraPositionStarted(currentCity: value),
    );
  };
}
