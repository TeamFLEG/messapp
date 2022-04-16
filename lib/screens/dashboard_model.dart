import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  const DashboardCard({
    Key? key,
    required this.cardIcon,
    required this.cardName,
    required this.cardColor,
    this.cardAction
  }) : super(key: key);

  final IconData cardIcon;
  final String cardName;
  final Color cardColor;
  final Function? cardAction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
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
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF535353),
              fontWeight: FontWeight.bold,
            ),
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
    ),
      onTap: () => cardAction!(),
    );
  }
}
