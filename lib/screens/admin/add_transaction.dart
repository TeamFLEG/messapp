import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:messapp/widgets/custom_appbar.dart';
import 'package:messapp/widgets/snack_bar_message.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({Key? key}) : super(key: key);

  @override
  _AddTransactionState createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _textController1;
  late TextEditingController _textController2;
  late TextEditingController _textController3;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String dateinput = '';

  @override
  void initState() {
    super.initState();
    _textController1 = TextEditingController();
    _textController2 = TextEditingController();
    _textController3 = TextEditingController();
    dateinput = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: const CustomAppBar(head: "Add Transaction"),
      backgroundColor: const Color(0xFFF7F7F8),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Manual Transaction Entry",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 30.0,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Complete the details to continue",
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: _textController1,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Amount",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: const Color.fromRGBO(239, 239, 239, 1.0),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Amount is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: _textController2,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: "Full Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: const Color.fromRGBO(239, 239, 239, 1.0),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: TextField(
                    controller:
                        _textController3, //editing controller of this TextField
                    decoration: const InputDecoration(
                        icon: Icon(Icons.calendar_today), //icon of text field
                        labelText: "Payment Date" //label text of field
                        ),
                    readOnly:
                        true, //set it true, so that user will not able to edit text
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2101));

                      if (pickedDate != null) {
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);

                        setState(() {
                          _textController3.text =
                              formattedDate; //set output date to TextField value.
                        });
                      } else {
                        SnackBarMessage.snackBarMessage(
                            content: 'Date is not selected', context: context);
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        createTransaction(
                          amount: double.parse(_textController1.text),
                          fullName: _textController2.text,
                          messID: FirebaseAuth.instance.currentUser!.uid,
                          transactionTS: Timestamp.now(),
                          paymentDate: _textController3.text,
                        );
                      }
                    },
                    child: const Text("Complete Process"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future createTransaction({
    required String messID,
    required double amount,
    required String fullName,
    required Timestamp transactionTS,
    String paymentDate = '',
  }) async {
    // Referencing to the document
    final loggedInUser = FirebaseAuth.instance.currentUser!;
    final transactionDoc = FirebaseFirestore.instance
        .collection('transactions')
        .doc(transactionTS.toString());
    Map<String, dynamic> transaction = {
      'messID': loggedInUser.uid,
      'amount': amount,
      'transactionTS': transactionTS,
      'fullName': fullName,
      'paymentDate': paymentDate,
    };
    transactionDoc.set(transaction).then((value) {
      SnackBarMessage.snackBarMessage(
          content: 'Transaction added successfully', context: context);
    }).onError(
      (error, stackTrace) {
        SnackBarMessage.snackBarMessage(
            content: 'Error occurred! Please try again.', context: context);
      },
    );
  }
}
