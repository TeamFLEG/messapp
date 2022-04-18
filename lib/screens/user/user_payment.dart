import 'package:flutter/material.dart';
import 'package:messapp/widgets/profile_pic.dart';
import '../../theme/palette.dart';
import '../../widgets/custom_appbar.dart';

class UserPayment extends StatefulWidget {
  const UserPayment({Key? key}) : super(key: key);

  @override
  _UserPaymentState createState() => _UserPaymentState();
}

class _UserPaymentState extends State<UserPayment> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: const CustomAppBar(head: "Payments"),
      backgroundColor: const Color(0xFFF1F4F8),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 3,
                      color: Color(0x32000000),
                      offset: Offset(0, 1),
                    )
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24, 24, 24, 16),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Your Bill',
                                style: TextStyle(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF8B97A2),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              Text(
                                '₹425.24',
                                style: TextStyle(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF090F13),
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                child: Text(
                                  'Due Aug 1, 2022',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF242424),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    print("Button clicked");
                                  },
                                  child: const Text("Pay"),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      height: 4,
                      thickness: 1,
                      indent: 20,
                      endIndent: 20,
                      color: Color(0xFFDBE2E7),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24, 16, 24, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: const [
                          Text(
                            'Remaining Payments',
                            style: TextStyle(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF8B97A2),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24, 4, 24, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: const [
                          Text(
                            '₹1,502',
                            style: TextStyle(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF090F13),
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                            child: Text(
                              '/ ₹3,000',
                              style: TextStyle(
                                fontFamily: 'Lexend Deca',
                                color: Palette.myMaroon,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 20),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFDBE2E7),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    2, 2, 2, 2),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  height: 16,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFB12341),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(24, 16, 24, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: const [
                    Text(
                      'Past Payment',
                      style: TextStyle(
                        fontFamily: 'Lexend Deca',
                        color: Color(0xFF8B97A2),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              const PaymentCard(),
              const PaymentCard(),
              const PaymentCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentCard extends StatelessWidget {
  const PaymentCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              blurRadius: 3,
              color: Color(0x28000000),
              offset: Offset(0, 1),
            )
          ],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: const Color(0xFFDBE2E7),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  ProfilePic(picRadius: 20.0),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Mastercard Ending in 4021',
                            style: TextStyle(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF8B97A2),
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(
                            'Jun 1, 2022',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF8B97A2),
                              fontSize: 10,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              '₹425.24',
                              style: TextStyle(
                                fontFamily: 'Lexend Deca',
                                color: Color(0xFF090F13),
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
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
