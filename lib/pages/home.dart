import 'package:flutter/material.dart';
import 'package:skate_guide_cali_mk4/services/weather.dart';
import 'package:url_launcher/url_launcher.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map weatherData = {};

  @override
  Widget build(BuildContext context) {
    weatherData = weatherData.isNotEmpty ? weatherData
        : ModalRoute.of(context)?.settings.arguments as Map;

    //print(weatherData);

    return Scaffold(
      backgroundColor: Colors.red,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 100.0, 0, 0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                TextButton.icon(
                  onPressed: () async {
                    dynamic result =
                    await Navigator.pushNamed(context, '/location');
                    setState(() {
                      weatherData = {
                        'weather': result['weather'],
                        'location': result['location'],
                        'cityPicture': result['cityPicture'],
                        'address': result['address'],
                        'parksize': result['parksize'],
                        'lights': result['lights'],
                        'padrequirement': result['padrequirement'],
                        'times': result['times'],

                      };

                    });
                  },
                  style: TextButton.styleFrom(
                    primary: Colors.black,
                  ),
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[300],
                  ),
                  label: Text(
                    'Edit Skatepark',
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.grey[300],
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Flex(
                  direction: Axis.horizontal,
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        weatherData['location'],
                        style: const TextStyle(
                          fontSize: 30.0,
                          letterSpacing: 2,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Flexible(
                  child: Text(
                    'address: ' + weatherData['address'],
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Flexible(
                  child: Text(
                    'weather in the area: ' + weatherData['weather'],
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Flexible(
                  child: Text(
                    'park size: ' + weatherData['parksize'],
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Flexible(
                  child: Text(
                    'lights: ' + weatherData['lights'],
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Flexible(
                  child: Text(
                    'pad requirement: ' + weatherData['padrequirement'],
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Text(
                    'times:\n' + weatherData['times'],
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),


                const SizedBox(height: 20.0),
                ListTile(
                  title: Text('Get Directions'),
                  onTap: () async {
                    WorldWeather(
                      address: weatherData['address'],
                    ).openMap();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}