import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:tttt/component/colors.dart';
import 'package:tttt/screen/buy.dart';
import 'package:tttt/screen/home.dart';
import 'package:tttt/services/prefs.dart';
import 'package:tttt/widgets/private_container.dart';
import 'package:tttt/widgets/text.dart';

class MyBasket extends StatefulWidget {
  static const String routeName = "/basket";
  const MyBasket({super.key});

  @override
  State<MyBasket> createState() => _MyBasketState();
}

class _MyBasketState extends State<MyBasket> {
  @override
  Widget build(BuildContext context) {
    List<String> header = [
      "Tanlanganlar ro'txati",
      "Selected list",
      "Выбранный список",
    ];
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: width * 0.08,
        centerTitle: true,
        title: AnimatedTextKit(
          animatedTexts: [
            for (String txt in header)
              TypewriterAnimatedText(
                txt,
                speed: const Duration(milliseconds: 60),
                textStyle: TextStyle(
                  fontSize: width * 0.04,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber,
                  fontStyle: FontStyle.italic,
                ),
              ),
          ],
          repeatForever: true,
        ),
      ),
      body: ListView.builder(
        itemCount: favourite.length,
        itemBuilder: (context, index) {
          return Dismissible(
            background: Container(
              color: red,
              child: Icon(
                Icons.delete,
                size: 40.0,
                color: white,
              ),
            ),
            key: ValueKey<String>(
              carImage.carName[int.parse(
                favourite[index],
              )],
            ),
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                    carImage.image[int.parse(
                      favourite[index],
                    )],
                  ),
                ),
                trailing: TextWidget(
                  text: carImage.price[int.parse(
                    favourite[index],
                  )],
                  size: width * 0.018,
                  color: black,
                ),
                title: Center(
                  child: TextWidget(
                    text: carImage.carName[int.parse(
                      favourite[index],
                    )],
                    size: width * 0.018,
                    color: black,
                  ),
                ),
                tileColor: scaffoldColor,
                onTap: () {
                  Navigator.pushNamed(context, CarBuyPage.routeName);
                },
              ),
            ),
            onDismissed: (DismissDirection direction) {
              SharedPreferencesClass()
                  .delete(index)
                  .then((value) => setState(() {}));
            },
          );
        },
      ),
    );
  }
}
