import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HabitTitle extends StatelessWidget {
  //declaring
  final String habitName;
  final bool habitCompleted;
  final Function(bool?)? onchanged;
  final Function(BuildContext)? settingTapped;
  final Function(BuildContext)? deleteTaped;

  const HabitTitle({
    super.key,
    required this.habitName,
    required this.habitCompleted,
    required this.onchanged,
    required this.deleteTaped,
    required this.settingTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            //setting option
            SlidableAction(
              onPressed: settingTapped,
              backgroundColor: Colors.grey.shade800,
              icon: Icons.settings,
              borderRadius: BorderRadius.circular(13),
            ),

            //for delete option
            SlidableAction(
              onPressed: deleteTaped,
              backgroundColor: Color.fromARGB(255, 238, 13, 170),
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(13),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(14.0)),
          child: Row(
            children: [
              //checkbox
              Checkbox(value: habitCompleted, onChanged: onchanged),

              //habit_name
              Text(habitName),
            ],
          ),
        ),
      ),
    );
  }
}
