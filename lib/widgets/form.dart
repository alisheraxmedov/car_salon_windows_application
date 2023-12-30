import 'package:flutter/material.dart';
import 'package:tttt/widgets/button.dart';

final formKey = GlobalKey<FormState>();
final _formKey = GlobalKey<FormState>();
TextEditingController pasportSeriaController = TextEditingController();
TextEditingController pasportNumberController = TextEditingController();
TextEditingController phoneNumberController = TextEditingController();
TextEditingController cardNumberController = TextEditingController();
TextEditingController cardDateController = TextEditingController();
TextEditingController cardPayController = TextEditingController();

bool checkValidator(String value) {
  RegExp checkValid = RegExp(r'\d');
  return checkValid.hasMatch(value);
}

class FormWidget extends StatelessWidget {
  FormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
//========== Seria uchun field ==========
          TextFormField(
            controller: pasportSeriaController,
            maxLength: 2,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: Colors.black, width: 1.0),
              ),
              labelText: "Passport seriasini kiriting",
            ),
            validator: (seria) => checkValidator(seria!)
                ? "Seria harflardan iborat bo'ladi"
                : null,
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
//========== Seria raqam uchun field ==========
          TextFormField(
            controller: pasportNumberController,
            maxLength: 7,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: Colors.black, width: 1.0),
              ),
              labelText: "Passport seria raqamini kiriting",
            ),
            validator: (seriaNumber) => checkValidator(seriaNumber!)
                ? null
                : "Pasport seria raqam faqat raqamlardan iboat bo'lishi kerak!",
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
//========== Telefon raqam uchun field ==========
          TextFormField(
            controller: phoneNumberController,
            maxLength: 9,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: Colors.black, width: 1.0),
              ),
              labelText: "Telefon raqamingizni kiriting: 913332233",
            ),
            validator: (phoneNumber) => checkValidator(phoneNumber!)
                ? null
                : "Telefon raqamni xato kiritdingiz",
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
        ],
      ),
    );
  }
}

class CardInfoTextField extends StatelessWidget {
  const CardInfoTextField({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
//========== Seria uchun field ==========
          TextFormField(
            controller: cardNumberController,
            maxLength: 16,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: Colors.white, width: 2.0),
              ),
              labelText: "Karta raqamini kiriting",
            ),
            validator: (seria) => checkValidator(seria!)
                ? null
                : "Karta raqamlari faqat raqamlardan iborat bo'ladi",
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
//========== Seria raqam uchun field ==========
          TextFormField(
            controller: cardDateController,
            maxLength: 5,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: Colors.black, width: 1.0),
              ),
              labelText: "Karta yaroqlilik muddatini kiriting",
            ),
            validator: (seriaNumber) => checkValidator(seriaNumber!)
                ? null
                : "Karta yaroqlilik muddati xato kiritildi!",
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
//========== Telefon raqam uchun field ==========
          TextFormField(
            controller: cardPayController,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: const BorderSide(color: Colors.black, width: 1.0),
              ),
              labelText: "To'lov miqdorini kiriting",
            ),
            validator: (phoneNumber) => checkValidator(phoneNumber!)
                ? null
                : "Faqat raqamlarda kiriting!",
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          SizedBox(height: height * 0.05),
//========== Buyurtma berish uchun button ==========
          MyButton(height: height*0.07, width: width*0.1, color: Colors.blue, text: "Buyurtma berish")
        ],
      ),
    );
  }
}
