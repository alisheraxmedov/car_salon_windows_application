// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:tttt/screen/basket.dart';
import 'package:tttt/screen/buy.dart';
import 'package:tttt/screen/home.dart';
import 'package:tttt/services/prefs.dart';
import 'package:tttt/widgets/animated_text.dart';

List<String> favourite = [];

class UchtaButtonliContainer extends StatefulWidget {
  int index;
  double width;
  double height;
  UchtaButtonliContainer({
    super.key,
    required this.width,
    required this.height,
    required this.index,
  });

  @override
  State<UchtaButtonliContainer> createState() => _UchtaButtonliContainerState();
}

class _UchtaButtonliContainerState extends State<UchtaButtonliContainer> {
  @override
  void initState() {
    super.initState();
    SharedPreferencesClass().loadList();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            child: Container(
              alignment: Alignment.center,
              height: widget.height * 0.07,
              width: widget.width * .12,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(
                  Radius.circular(widget.width * 0.015),
                ),
              ),
              child: AnimatedText(text: "Full Info"),
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, "Cancel"),
                      child: const Text("Cancel"),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, "OK"),
                      child: const Text("OK"),
                    ),
                  ],
                  title: AnimatedText(
                    text: carImage.carName[widget.index],
                  ),
                  content: SizedBox(
                    width: widget.width * 0.5,
                    child: Text(
                      carImage.information[widget.index],
                    ),
                  ),
                ),
              );
            },
          ),
          GestureDetector(
            child: Container(
              alignment: Alignment.center,
              height: widget.height * 0.07,
              width: widget.width * .12,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(
                  Radius.circular(widget.width * 0.015),
                ),
              ),
              child: AnimatedText(text: "Buy Now"),
            ),
            onTap: () {
              Navigator.pushNamed(context, CarBuyPage.routeName);
            },
          ),
          GestureDetector(
            child: Container(
              alignment: Alignment.center,
              height: widget.height * 0.07,
              width: widget.width * .12,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(
                  Radius.circular(widget.width * 0.015),
                ),
              ),
              child: AnimatedText(text: "Basket"),
            ),
            onTap: () {
              SharedPreferencesClass().carToBasket(widget.index.toString());
              // carToBasket(widget.index.toString());
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  actions: [
                    TextButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, MyBasket.routeName).then(
                        (value) => Navigator.pop(context),
                      ),
                      child: const Text("Show basket"),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, "OK"),
                      child: const Text("OK"),
                    ),
                  ],
                  content: SizedBox(
                    width: widget.width * 0.5,
                    height: widget.width * 0.03,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Tanlangan mashina savatga qo'shildi",
                        style: TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.italic,
                          fontSize: widget.width * 0.018,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  // Future<void> loadList() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   setState(() {
  //     favourite = pref.getStringList("_") ?? [];
  //   });
  // }

  // Future<void> carToBasket(String value) async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   if (value.isNotEmpty) {
  //     setState(() {
  //       favourite.add(value);
  //     });
  //   }
  //   pref.setStringList("_", favourite);
  // }

  // Future<void> delete(int index) async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   setState(() {
  //     favourite.removeAt(index);
  //   });
  //   pref.setStringList("_", favourite);
  // }
}
