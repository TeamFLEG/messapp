import 'package:flutter/material.dart';
import 'package:messapp/widgets/primary_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:messapp/widgets/snack_bar_message.dart';

import '../../main.dart';

// ignore: must_be_immutable
class UpdateMenu extends StatefulWidget {
  const UpdateMenu({Key? key}) : super(key: key);

  @override
  State<UpdateMenu> createState() => _UpdateMenuState();
}

class _UpdateMenuState extends State<UpdateMenu> {
  CollectionReference meal = FirebaseFirestore.instance.collection('meal');
  final TextEditingController foodItem_ = TextEditingController();

  Future<void> updateUser(day, period, foodItem) {
    return meal.doc('$day').update({'$period': '$foodItem'}).then((value) {
      SnackBarMessage.snackBarMessage(
          content: "User added successfully", context: context);
    }).catchError((error) {
      SnackBarMessage.snackBarMessage(
          content: "Error: $error", context: context);
    });
  }

  String day_ = '1.Sunday';
  String period_ = 'breakfast';
  String selectedValue = 'breakfast';

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = const [
      DropdownMenuItem(child: Text("Breakfast"), value: "breakfast"),
      DropdownMenuItem(child: Text("Lunch"), value: "lunch"),
      DropdownMenuItem(child: Text("Dinner"), value: "dinner"),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get dropdownDays {
    List<DropdownMenuItem<String>> menuItems = const [
      DropdownMenuItem(child: Text("1.Sunday"), value: "1.Sunday"),
      DropdownMenuItem(child: Text("2.Monday"), value: "2.Monday"),
      DropdownMenuItem(child: Text("3.Tuesday"), value: "3.Tuesday"),
      DropdownMenuItem(child: Text("4.Wednesday"), value: "4.Wednesday"),
      DropdownMenuItem(child: Text("5.Thursday"), value: "5.Thursday"),
      DropdownMenuItem(child: Text("6.Friday"), value: "6.Friday"),
      DropdownMenuItem(child: Text("7.Saturday"), value: "7.Saturday"),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        DropdownButton<String>(
          enableFeedback: true,
          value: day_,
          items: dropdownDays,
          onChanged: (String? newValue) {
            setState(() {
              day_ = newValue!;
            });
          },
        ),
        DropdownButton<String>(
          enableFeedback: true,
          value: period_,
          items: dropdownItems,
          onChanged: (String? newValue) {
            setState(() {
              period_ = newValue!;
            });
          },
        ),
        TextFormField(
          controller: foodItem_,
          enableSuggestions: true,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          autocorrect: false,
          decoration: const InputDecoration(
            labelText: "Edit",
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.text,
        ),
        const SizedBox(
          height: 20,
        ),
        PrimaryButton(
          btnName: "Update",
          action: () {
            updateUser(
              day_,
              period_,
              foodItem_.text,
            );

            navigatorKey.currentState!.popAndPushNamed('/mess-menu');
          },
        ),
      ],
    );
  }
}
