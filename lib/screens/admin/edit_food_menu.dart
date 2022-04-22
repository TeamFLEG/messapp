import 'package:flutter/material.dart';

import '../../widgets/custom_appbar.dart';


class EditFoodMenu extends StatefulWidget {
  const EditFoodMenu({Key? key}) : super(key: key);

  @override
  State<EditFoodMenu> createState() => _EditFoodMenuState();
}

class _EditFoodMenuState extends State<EditFoodMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(head: "Edit Food Menu"),
      body: Column(
        children: [

        ]
      ),

    );
  }
}
