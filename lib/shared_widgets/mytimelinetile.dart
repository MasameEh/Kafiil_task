import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../size_config.dart';
import '../themes.dart';

class MyTimelineTile extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isTurn;
  final bool isDone;
  final int number; // Add a number parameter
  final Color borderColor; // Add a border color parameter
  final String label;

  const MyTimelineTile({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.number,
    this.borderColor = primaryColor,
    required this.label,
    required this.isTurn,
    required this.isDone, // Default border color is primaryColor
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SizedBox(width: SizeConfig.screenWidth * 0.47,
      child: TimelineTile(
        axis: TimelineAxis.horizontal,
        alignment: TimelineAlign.manual,
        lineXY: 0.04,
        isFirst: isFirst,
        isLast: isLast,
        startChild:
              Text(label, style:
              TextStyle(
                color: isTurn || isDone ? primaryColor : Colors.grey[350],
                fontSize: 10,
                fontWeight: FontWeight.w600
              ),),
        endChild: Container(),
        beforeLineStyle: isTurn ? const LineStyle(
          color: primaryColor,
          thickness: 1.8,
        ) : LineStyle(
          color: Colors.grey[200]!,
          thickness: 1.8,

        ),
        indicatorStyle: IndicatorStyle(
           height: 20,
          width: 40,
          indicator: isTurn
              ? Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: primaryColor,
                          width: 1.5,
                        ),
                      ),
                    ),
                    Text(
                      number.toString(),
                      style: const TextStyle(
                          color: primaryColor, // Text color
                          fontWeight: FontWeight.w400,
                          fontSize: 12
                      ),
                    )
                  ],
                )
              : isDone
                  ? Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            color: primaryColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const Icon(Icons.done),
                      ],
                    )
                  : Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        shape: BoxShape.circle,
                      ),
                    ),
        ),
        afterLineStyle: isDone ?
            const LineStyle(
              color: primaryColor,
              thickness: 1.8,

            )
            : LineStyle(
                color: Colors.grey[200]!,
                thickness: 1.8,
        ),
      ),
    );
  }
}
