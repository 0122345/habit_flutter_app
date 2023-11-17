import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:habitapp/datetime/date_time.dart';

class MonthlySummary extends StatelessWidget {
  final Map<DateTime, int>? datasets;
  final String startDate;

  const MonthlySummary({
    super.key,
    required this.datasets,
    required this.startDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 25, bottom: 25),
      child: HeatMap(
        startDate: createDateTimeObject(startDate),
        endDate: DateTime.now().add(Duration(days: 0)),
        datasets: datasets,
        colorMode: ColorMode.color,
        defaultColor: const Color.fromARGB(255, 234, 234, 235),
        textColor: Colors.white,
        showColorTip: false,
        showText: true,
        scrollable: true,
        size: 31,
        colorsets: const {
          1: Color.fromARGB(19, 26, 4, 26),
          2: Color.fromARGB(40, 54, 8, 48),
          3: Color.fromARGB(104, 78, 24, 78),
          4: Color.fromARGB(80, 90, 41, 100),
          5: Color.fromARGB(99, 129, 2, 179),
          6: Color.fromARGB(120, 138, 2, 179),
          7: Color.fromARGB(148, 128, 17, 138),
          8: Color.fromARGB(180, 164, 2, 179),
          9: Color.fromARGB(220, 179, 2, 179),
          10: Color.fromARGB(255, 173, 2, 179),
        },
        onClick: (value) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(value.toString())));
        },
      ),
    );
  }
}
