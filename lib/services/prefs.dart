// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tttt/widgets/private_container.dart'; 

class YourWidget extends StatefulWidget {
  const YourWidget({super.key});

  @override
  _YourWidgetState createState() => _YourWidgetState();
}

class _YourWidgetState extends State<YourWidget> {
  List<String> favourite = [];

  @override
  void initState() {
    super.initState();
    SharedPreferencesClass().loadList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your App'),
      ),
      body: yourBodyWidget(), 
    );
  }

  Widget yourBodyWidget() {
    return Container();
  }
}

class SharedPreferencesClass {
  Future<void> loadList() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    setState(() {
      favourite = pref.getStringList("_") ?? [];
    });
  }

  Future<void> carToBasket(String value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (value.isNotEmpty) {
      setState(() {
        favourite.add(value);
      });
    }
    pref.setStringList("_", favourite);
  }

  Future<void> delete(int index) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      favourite.removeAt(index);
    });
    pref.setStringList("_", favourite);
  }


  void setState(VoidCallback callback) {
    callback();
  }
}
