import 'package:flutter/material.dart';
import 'package:tttt/component/colors.dart';
import 'package:tttt/component/componenet.dart';
import 'package:tttt/screen/basket.dart';
import 'package:tttt/widgets/animated_text.dart';
import 'package:tttt/widgets/card.dart';
import 'package:tttt/widgets/header.dart';
import 'package:tttt/widgets/private_container.dart';
import 'package:tttt/widgets/text.dart';

CarImage carImage = CarImage();

class CarHomePage extends StatefulWidget {
  static const routeName = "/";
  const CarHomePage({super.key});

  @override
  State<CarHomePage> createState() => _CarHomePageState();
}

class _CarHomePageState extends State<CarHomePage> {
  @override
  Widget build(BuildContext context) {
//======================== screen refresh ========================
    Future<void> refresh() async {
      await Future.delayed(const Duration(milliseconds: 100));
      setState(() {});
    }

    setState(() {});
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return RefreshIndicator(
      onRefresh: refresh,
      child: Scaffold(
        backgroundColor: scaffoldColor,
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, MyBasket.routeName);
              },
              icon: Badge(
                label: Text(favourite.length.toString()),
                child: const Icon(
                  Icons.shopping_cart_outlined,
                  size: 30.0,
                ),
              ),
            ),
            const Text("      "),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(height * .1),
            child: Header(width: width),
          ),
        ),
        body: ListView.builder(
          itemCount: carImage.image.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.01,
                vertical: width * 0.01,
              ),
              child: Container(
                height: height * .4,
                width: width,
                decoration: BoxDecoration(color: white),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(width * 0.01),
                      child: Expanded(
                        flex: 1,
                        child: CardWidget(
                          image: carImage.image[index],
                          height: height * .4,
                          width: width * .3,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.all(width * .01),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: height * .0098,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        AnimatedText(
                                          text: carImage.carName[index],
                                        ),
                                      ],
                                    ),
                                    //================================
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: width * 0.45,
                                          child: TextWidget(
                                            text: carImage.information[index],
                                            size: width * 0.0117,
                                            color: black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    //================================
                                    Chip(
                                      label: TextWidget(
                                        text: "Narxi ${carImage.price[index]}",
                                        size: width * 0.01,
                                        color: black,
                                      ),
                                      backgroundColor: green,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //=========================== Uchta buttondan iborat Container ===========================
                            UchtaButtonliContainer(
                              width: width,
                              height: height,
                              index: index,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
