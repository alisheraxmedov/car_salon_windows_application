import 'package:flutter/material.dart';
import 'package:tttt/widgets/form.dart';

class CarBuyPage extends StatefulWidget {
  static const routeName = "/buy";
  const CarBuyPage({super.key});

  @override
  State<CarBuyPage> createState() => _CarBuyPageState();
}

class _CarBuyPageState extends State<CarBuyPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: height * 0.6,
                width: width * 0.8,
                // color: Colors.blue,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 50.0),
                          FormWidget(),
                        ],
                      ),
                    ),
                    SizedBox(width: width * 0.1),
                    const Expanded(
                      child: Column(
                        children: [
                          SizedBox(height: 50.0),
                          CardInfoTextField()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
