import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const apiKey = '38b6103ebf83f8c87d6a010bbb4151a3';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
    getData();
  }

  void getLocationData() async {
    Location location = new Location();
    await location.getCurrentLocation();
    print("latitude: " + location.latitude.toString());
    print("longitude: " + location.longitude.toString());
  }

  void getData() async {
    http.Response response = await http.get(
        "https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=$apiKey");
    if (response.statusCode == 200) {
      String data = response.body;

      var decodedData = jsonDecode(data);

      double temperature = decodedData['main']['temp'];
      int conditionNumber = decodedData['weather'][0]['id'];
      String cityName = decodedData['name'];

      print(temperature);
      print(conditionNumber);
      print(cityName);
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
