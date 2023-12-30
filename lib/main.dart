import 'package:flutter/material.dart';
import 'package:tttt/routes/routes.dart';

void main(){
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
    )
  );
}