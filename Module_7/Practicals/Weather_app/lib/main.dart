import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController _cityController = TextEditingController();
  String _cityName = '';
  String _temperature = '';
  String _description = '';
  bool _isLoading = false;
  String _errorMessage = '';

  // Fetch weather data
  Future<void> _fetchWeather(String city) async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=051ec846439972bc642c249cff791ff9&units=metric';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        setState(() {
          _cityName = data['name'];
          _temperature =
              (data['main']['temp'] - 273.15).toStringAsFixed(1) + '°C'; 
          _description = data['weather'][0]['description'];
        });
      } else {
        setState(() {
          _errorMessage = 'City not found or invalid API request.';
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Error fetching weather data: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _cityController,
              decoration: InputDecoration(
                labelText: 'Enter City',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (_cityController.text.isNotEmpty) {
                  _fetchWeather(_cityController.text);
                }
              },
              child: Text('Get Weather'),
            ),
            SizedBox(height: 20),
            if (_isLoading)
              Center(child: CircularProgressIndicator()),
            if (_errorMessage.isNotEmpty)
              Center(child: Text(_errorMessage, style: TextStyle(color: Colors.red))),
            if (!_isLoading && _cityName.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('City: $_cityName', style: TextStyle(fontSize: 24)),
                  Text('Temperature: $_temperature', style: TextStyle(fontSize: 18)),
                  Text('Description: $_description', style: TextStyle(fontSize: 18)),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
