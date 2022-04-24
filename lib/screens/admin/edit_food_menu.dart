import 'package:flutter/material.dart';
import './update_menu.dart';
import '../../widgets/custom_appbar.dart';

class EditFoodMenu extends StatefulWidget {
  const EditFoodMenu({Key? key}) : super(key: key);

  @override
  State<EditFoodMenu> createState() => _EditFoodMenuState();
}

class _EditFoodMenuState extends State<EditFoodMenu> {
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // late TextEditingController _sunBreakfastController;

  // @override
  // void initState() {
  //   super.initState();
  //   _sunBreakfastController = TextEditingController();
  // }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(head: "Edit Food Menu"),
      body: UpdateMenu(),
    );
  }
}
