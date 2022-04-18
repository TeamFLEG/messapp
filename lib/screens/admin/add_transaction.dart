// import 'package:flutter/material.dart';
// import 'package:messapp/widgets/custom_appbar.dart';

// class AddTransaction extends StatefulWidget {
//   const AddTransaction({Key? key}) : super(key: key);

//   @override
//   _AddTransactionState createState() => _AddTransactionState();
// }

// class _AddTransactionState extends State<AddTransaction> {
//   // TextEditingController textController1;
//   // TextEditingController textController2;
//   // TextEditingController textController3;
//   final scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   void initState() {
//     super.initState();
//     // textController1 = TextEditingController();
//     // textController2 = TextEditingController();
//     // textController3 = TextEditingController();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: scaffoldKey,
//       appBar: const CustomAppBar(head: "Add Transaction"),
//       backgroundColor: const Color(0xFFF7F7F8),
//       body: SafeArea(
//         child: Column(
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             Row(
//               mainAxisSize: MainAxisSize.max,
//               children: [
//                 Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: 100,
//                   decoration: const BoxDecoration(
//                     color: Colors.white,
//                   ),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Expanded(
//                         child: TextFormField(
//                           // controller: textController1,
//                           obscureText: false,
//                           decoration: const InputDecoration(
//                             labelText: '         ₹Amount',
//                             labelStyle: TextStyle(
//                               fontFamily: 'DM Sans',
//                               color: Color(0xFF82878C),
//                               fontSize: 42,
//                             ),
//                             hintStyle: TextStyle(
//                               fontFamily: 'DM Sans',
//                               color: Color(0xFF8B97A2),
//                               fontSize: 42,
//                             ),
//                             enabledBorder: UnderlineInputBorder(
//                               borderSide: BorderSide(
//                                 color: Color(0x00000000),
//                                 width: 1,
//                               ),
//                               borderRadius:  BorderRadius.only(
//                                 topLeft: Radius.circular(4.0),
//                                 topRight: Radius.circular(4.0),
//                               ),
//                             ),
//                             focusedBorder: UnderlineInputBorder(
//                               borderSide: BorderSide(
//                                 color: Color(0x00000000),
//                                 width: 1,
//                               ),
//                               borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(4.0),
//                                 topRight: Radius.circular(4.0),
//                               ),
//                             ),
//                           ),
//                           style: const TextStyle(
//                             fontFamily: 'DM Sans',
//                             color: Color(0xFF4B39EF),
//                             fontSize: 42,
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             Row(
//               mainAxisSize: MainAxisSize.max,
//               children: [
//                 Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: 70,
//                   decoration: const BoxDecoration(
//                     color: Colors.white,
//                   ),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Expanded(
//                         child: Padding(
//                           padding:
//                               const EdgeInsetsDirectional.fromSTEB(24, 16, 24, 8),
//                           child: TextFormField(
//                             // controller: textController2,
//                             obscureText: false,
//                             decoration: InputDecoration(
//                               labelText: 'Name',
//                               labelStyle: FlutterFlowTheme.of(context)
//                                   .bodyText2
//                                   .override(
//                                     fontFamily: 'Lexend Deca',
//                                     color: Color(0xFF8B97A2),
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.normal,
//                                   ),
//                               hintStyle: FlutterFlowTheme.of(context)
//                                   .bodyText2
//                                   .override(
//                                     fontFamily: 'Lexend Deca',
//                                     color: Color(0xFF8B97A2),
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.normal,
//                                   ),
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                   color: Color(0xFFDCE0E4),
//                                   width: 2,
//                                 ),
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                   color: Color(0xFFDCE0E4),
//                                   width: 2,
//                                 ),
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                             ),
//                             style:
//                                 FlutterFlowTheme.of(context).bodyText2.override(
//                                       fontFamily: 'Lexend Deca',
//                                       color: Color(0xFF0F181F),
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.normal,
//                                     ),
//                             textAlign: TextAlign.start,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             Row(
//               mainAxisSize: MainAxisSize.max,
//               children: [
//                 Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: 80,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                   ),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Expanded(
//                         child: Padding(
//                           padding:
//                               EdgeInsetsDirectional.fromSTEB(24, 0, 24, 24),
//                           child: TextFormField(
//                             controller: textController3,
//                             obscureText: false,
//                             decoration: InputDecoration(
//                               labelText: 'Date',
//                               labelStyle: FlutterFlowTheme.of(context)
//                                   .bodyText2
//                                   .override(
//                                     fontFamily: 'Lexend Deca',
//                                     color: Color(0xFF8B97A2),
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.normal,
//                                   ),
//                               hintStyle: FlutterFlowTheme.of(context)
//                                   .bodyText2
//                                   .override(
//                                     fontFamily: 'Lexend Deca',
//                                     color: Color(0xFF8B97A2),
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.normal,
//                                   ),
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                   color: Color(0xFFDCE0E4),
//                                   width: 2,
//                                 ),
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                   color: Color(0xFFDCE0E4),
//                                   width: 2,
//                                 ),
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                             ),
//                             style:
//                                 FlutterFlowTheme.of(context).bodyText2.override(
//                                       fontFamily: 'Lexend Deca',
//                                       color: Color(0xFF0F181F),
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.normal,
//                                     ),
//                             textAlign: TextAlign.start,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Padding(
//                   padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
//                   child: FFButtonWidget(
//                     onPressed: () {
//                       print('Button pressed ...');
//                     },
//                     text: 'Create Transaction',
//                     options: FFButtonOptions(
//                       width: 230,
//                       height: 50,
//                       color: FlutterFlowTheme.of(context).primaryColor,
//                       textStyle:
//                           FlutterFlowTheme.of(context).subtitle2.override(
//                                 fontFamily: 'Lexend Deca',
//                                 color: Colors.white,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                       elevation: 2,
//                       borderSide: BorderSide(
//                         color: Colors.transparent,
//                         width: 1,
//                       ),
//                       borderRadius: 8,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
