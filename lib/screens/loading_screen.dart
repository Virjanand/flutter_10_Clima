import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = new Location();
    await location.getCurrentLocation();
    print("latitude: " + location.latitude.toString());
    print("longitude: " + location.longitude.toString());
  }

  Future<void> getData() async {
    var response = await get(
        "https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22");
    if (response.statusCode == 200) {
      String data = response.body;
      var longitute = jsonDecode(data)['coord']['lon'];
      var latitude = jsonDecode(data)['coord']['lat'];
      var weatherDescription = jsonDecode(data)['weather'][0]['description'];

      var temperature = jsonDecode(data)['main']['temp'];
      var conditionNumber = jsonDecode(data)['weather'][0]['id'];
      var city = jsonDecode(data)['name'];

      print(temperature);
      print(conditionNumber);
      print(city);
    } else {
      print(response);
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }
}
