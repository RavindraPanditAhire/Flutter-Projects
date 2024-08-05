import "dart:convert";
import "dart:developer";
import "package:flutter/material.dart";
import "package:http/http.dart" as http;



class WeatherServices{
  fetchWeather()async{
    var url="https://api.openweathermap.org/data/2.5/weather?lat=18.5204&lon=73.8567&appid=fb12c55031cca1f1c4a06c7a3ba51fd7";
    final response=await http.get(Uri.parse(url));
    try{
      if(response.statusCode==200){
        var weatherData=json.decode(response.body);
        var temperature=weatherData['main']['temp']-273.15;
        var weatherDescription=weatherData['weather'][0]['description'];
        return Map.from({"temperature":temperature,"weatherDescription":weatherDescription});
      }else{
        print("Failed to load weather data");
        return null;
      }
    }catch(e){
      print("Error: ${e.toString()}");
      return null;
    }
  }
}