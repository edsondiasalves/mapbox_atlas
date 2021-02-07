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
                  Container(
                    child: Text('Initial Position'),
                  ),
                  ..._buildCityList(
                    context: context,
                    initialPosition: state.initialPosition,
                    onChangeCity: onChangeInitialPosition,
                  ),
                  Container(
                    child: Text('Move Camera'),
                  ),
                  ..._buildCityList(
                    context: context,
                    initialPosition: state.currentPosition,
                    onChangeCity: onChangeCameraPosition,
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
          cities.add(RadioListTile<City>(
            title: Text(city.toString().split('.')[1]),
            dense: true,
            value: city,
            groupValue: initialPosition,
            onChanged: (City city) => onChangeCity(context, city),
          ))
        });
    return cities;
  }

  final Function(BuildContext, City) onChangeInitialPosition = (
    BuildContext context,
    City value,
  ) {
    BlocProvider.of<ConfigurationBloc>(context).add(
      ChangeInitialPositionStarted(city: value),
    );
  };

  final Function(BuildContext, City) onChangeCameraPosition = (
    BuildContext context,
    City value,
  ) {
    BlocProvider.of<ConfigurationBloc>(context).add(
      ChangeCameraPositionStarted(city: value),
    );
  };
}
