import 'package:flutter/material.dart';

import '../../widgets/custom_appbar.dart';


class EditFoodMenu extends StatefulWidget {
  const EditFoodMenu({Key? key}) : super(key: key);

  @override
  State<EditFoodMenu> createState() => _EditFoodMenuState();
}

class _EditFoodMenuState extends State<EditFoodMenu> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _sunBreakfastController;

  @override
  void initState() {
    super.initState();
    _sunBreakfastController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(head: "Edit Food Menu"),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              const SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                controller: _sunBreakfastController,
                enableSuggestions: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                autocorrect: false,
                decoration: const InputDecoration(
                  labelText: "Breakfast",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.text,
              ),
            ],
          ),
        ),
      ),

    );
  }
}
