import 'package:flutter/material.dart';
import 'package:weather_app_flutter/Service/services.dart';
import 'package:weather_app_flutter/Model/weather_model.dart';

class WeatherHome extends StatefulWidget {
  
  const WeatherHome({Key? key});

  @override
  _WeatherHomeState createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {

  late weatherData weatherInfo;
  myWeather(){
    WeatherServices().fetchWeather().then((value){
      setState(() {
        weatherInfo = value;
      });
    });
  }

  @override
  void initState(){
    myWeather();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
   return Scaffold(
    backgroundColor: Color.fromARGB(255, 71, 6, 145),
    body: Padding(padding: EdgeInsets.all(15),
    child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: WeatherDetail(weather: weatherInfo))
      ],
    ),),
   );
  }
  
}


class WeatherDetail extends StatelessWidget {
  final weatherData weather;
  const WeatherDetail({super.key, required this.weather});
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // curretn tempreture
       
        // weather description
      ],
    );
  }
}