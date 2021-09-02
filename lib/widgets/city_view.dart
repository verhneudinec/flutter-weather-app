import 'package:flutter/material.dart';
import 'package:flutter_weather_app/model/weather_forecast.dart';
import 'package:flutter_weather_app/utilities/forecast_util.dart';

class CityView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  const CityView({Key key, this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String city = snapshot.data.city.name;
    final String country = snapshot.data.city.country;

    final int forecastDt = snapshot.data.list[0].dt * 1000;
    final DateTime formattedDate =
        DateTime.fromMillisecondsSinceEpoch(forecastDt);

    return Container(
      child: Column(
        children: [
          Text(
            "$city $country",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28.0,
              color: Colors.black87,
            ),
          ),
          Text(
            '${Util.getFormatedDate(formattedDate)}',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
