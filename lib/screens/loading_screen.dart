import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
