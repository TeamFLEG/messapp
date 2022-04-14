import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  const DashboardCard({Key? key,
    required this.cardIcon,
    required this.cardName,
    required this.cardColor,

  }) : super(key: key);

  final IconData cardIcon;
  final String cardName;
  final Color cardColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 110,
        height: 130,
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(15),
        ),

        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Stack(
              children: [
                Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.circular(7.5),
                      ),
                      child: Icon(
                        cardIcon,
                        color: const Color(0xFF1F688B),
                        size: 40,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              cardName,
            ),

            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Color(0xFF1F688B),
                    size: 24,
                  ),
                ],
              ),
            ),
          ],
        ),
    );
  }
}