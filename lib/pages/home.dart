import 'package:flutter/material.dart';
import 'package:habitapp/components/habit_title.dart';
import 'package:habitapp/components/my_fab.dart';
import 'package:habitapp/components/my_alert_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //data structure for today habit list contains
  List todaysHabitList = [
    // [habitName, completed or Not]
    ["Morning prayer", false],
    ["Read Book", false],
    ["coding hours", false],
  ];

  // checkbox was tapped
  void checkBoxTapped(bool? value, int index) {
    setState(() {
      todaysHabitList[index][1] = value;
    });
  }

  //create new habit
  final _newHabitNameController = TextEditingController();

  //creating ability for the user to input his own data;
  void creatingNewHabit() {
    //show alret box
    showDialog(
      context: context,
      builder: (context) {
        return MyAlertBox(
          controller: _newHabitNameController,
          onBika: saveNewHabit,
          onSiba: cancelNewHabit,
        );
      },
    );
  }

  void saveNewHabit() {
    //add new habit to todays habit list
     setState(() {
       todaysHabitList.add([_newHabitNameController.text, false]);
     });
    //remove content in textfield
    _newHabitNameController.clear();
    //pop out the textfield
    Navigator.of(context).pop();
  }

  void cancelDialogBox() {
    _newHabitNameController.clear();
    Navigator.of(context).pop();
  }

  //open habit settings to edit
  void openHabitsettings(int index) {
    showDialog(
      context: context,
       builder: (context)) {
      return MyAlertBox(
        controller: _newHabitNameController,
         onBika: () => saveExistingHabit(index),
         onSiba: cancelDialogBox,
         ),
    }
  }
 
 //save existing habit.
  void saveExistingHabit(int index) {
     setState(() {
       todaysHabitList[index][0] = _newHabitNameController.text;
     });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: MyFloatingActionButton(onpressed: creatingNewHabit),
      body: ListView.builder(
        itemCount: todaysHabitList.length,
        itemBuilder: (context, index) {
          return HabitTitle(
            habitName: todaysHabitList[index][0],
            habitCompleted: todaysHabitList[index][1],
            onchanged: (value) => checkBoxTapped(value, index),
            settingTapped: (context) => openHabitSettings(index),
          );
        },
      ),
    );
  }
}
