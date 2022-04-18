import 'package:flutter/material.dart';
import 'package:messapp/theme/palette.dart';
import 'package:messapp/widgets/custom_appbar.dart';
import 'package:messapp/widgets/primary_button.dart';
import 'package:messapp/screens/admin/add_transaction.dart';

class AdminStatement extends StatefulWidget {
  const AdminStatement({Key? key}) : super(key: key);

  @override
  State<AdminStatement> createState() => _AdminStatementState();
}

class _AdminStatementState extends State<AdminStatement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: const CustomAppBar(head: "Your Statement"),
      body: SingleChildScrollView(
        primary: false,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 24, 16, 16),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: const [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 4, 0, 0),
                                  child: Text(
                                    'No. of working days',
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 0),
                                  child: Text(
                                    '30',
                                    style: TextStyle(
                                      fontFamily: 'Open Sans',
                                      color: Palette.myMaroon,
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 2,
                            height: 100,
                            decoration: const BoxDecoration(
                              color: Colors.grey,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: const [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 4, 0, 0),
                                  child: Text(
                                    'Expense',
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 0),
                                  child: Text(
                                    '₹7,456',
                                    style: TextStyle(
                                      fontFamily: 'Open Sans',
                                      color: Palette.myMaroon,
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 12),
                      child: PrimaryButton(
                          btnName: "Add Transaction",
                          action: () {
                            Navigator.pushNamed(context, '/add-transaction');
                          }),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 12),
                      child: PrimaryButton(
                          btnName: "Show all Transactions",
                          action: () {
                            print("button pressed....");
                          }),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 12),
                      child: PrimaryButton(
                          btnName: "Generate Bill",
                          action: () {
                            print("button pressed....");
                          }),
                    ),
                    const Divider(
                      height: 24,
                      thickness: 2,
                      color: Colors.grey,
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: const [
                          Text(
                            'Member Dues',
                          ),
                        ],
                      ),
                    ),
                    ListView(
                      padding: EdgeInsets.zero,
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: const [
                        PayCard(name: "Revanth", amt: "1500"),
                        PayCard(name: "Rohith", amt: "1500"),
                        PayCard(name: "Sharun", amt: "1500"),
                        PayCard(name: "Sreehari", amt: "1500"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PayCard extends StatelessWidget {
  const PayCard({
    Key? key,
    required this.name,
    required this.amt,
  }) : super(key: key);

  final String name;
  final String amt;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          shape: BoxShape.rectangle,
          border: Border.all(
            color: const Color(0xFFEFEFEF),
            width: 1,
          ),
        ),
        child: Align(
          alignment: const AlignmentDirectional(0, 0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                  child: Icon(
                    Icons.subtitles_rounded,
                    color: Palette.myMaroon,
                    size: 24,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                    child: Text(
                      name,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Align(
                    alignment: const AlignmentDirectional(0, 0),
                    child: Text(
                      amt,
                      style: const TextStyle(
                        fontFamily: 'Open Sans',
                      ),
                    ),
                  ),
                ),
                const Expanded(
                  child: Align(
                    alignment: AlignmentDirectional(0.9, 0),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFF95A1AC),
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
