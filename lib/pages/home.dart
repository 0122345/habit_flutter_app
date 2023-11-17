import 'package:flutter/material.dart';
import 'package:habitapp/components/habit_title.dart';
import 'package:habitapp/components/month_summary.dart';
import 'package:habitapp/components/my_fab.dart';
import 'package:habitapp/components/my_alert_box.dart';
import 'package:habitapp/data/habit_database.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HabitDatabase db = HabitDatabase();
  final _myBox = Hive.box("Habit_Database");

  @override
  void initState() {
    //if it is intitial time
    //then create default data
    if (_myBox.get("Current_habit_List") == null) {
      db.createDefaultData();
    }
    // that's not for the first time
    else {
      db.loadData();
    }

    //updating
    db.updateDatabase();

    super.initState();
  }

  // checkbox was tapped
  void checkBoxTapped(bool? value, int index) {
    setState(() {
      db.todaysHabitList[index][1] = value;
    });
     db.updateDatabase();
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
          hintText: 'Enter a habit name',
          onBika: saveNewHabit,
          onSiba: cancelDialogBox,
        );
      },
    );
  }

  void saveNewHabit() {
    //add new habit to todays habit list
    setState(() {
      db.todaysHabitList.add([_newHabitNameController.text, false]);
    });
    //remove content in textfield
    _newHabitNameController.clear();
    //pop out the textfield
    Navigator.of(context).pop();

     db.updateDatabase();

  }

  void cancelDialogBox() {
    _newHabitNameController.clear();
    Navigator.of(context).pop();
  }

  //open habit settings to edit
  void openHabitSettings(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return MyAlertBox(
          controller: _newHabitNameController,
          hintText: db.todaysHabitList[index][0],
          onBika: () => saveExistingHabit(index),
          onSiba: cancelDialogBox,
        );
      },
    );
  }

  //save existing habit.
  void saveExistingHabit(int index) {
    setState(() {
      db.todaysHabitList[index][0] = _newHabitNameController.text;
    });
    _newHabitNameController.clear();
    Navigator.of(context).pop();
    // or
    //Navigator.pop(context);
     db.updateDatabase();
  }

  //delete habit
  void deleteHabit(int index) {
    setState(() {
      db.todaysHabitList.removeAt(index);
    });
     db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 2, 29, 184),
      floatingActionButton: MyFloatingActionButton(onpressed: creatingNewHabit),
      body: ListView(
        children: [
          //monthl summary heat map
          MonthlySummary(
            datasets:  db.heatMapDataSet,
             startDate:  _myBox.get("START_DATE"),
             ),

          //list of habit

          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: db.todaysHabitList.length,
            itemBuilder: (context, index) {
          return HabitTitle(
            habitName: db.todaysHabitList[index][0],
            habitCompleted: db.todaysHabitList[index][1],
            onchanged: (value) => checkBoxTapped(value, index),
            settingTapped: (context) => openHabitSettings(index),
            deleteTaped: (context) => deleteHabit(index),
          );
        },
      ),
        ],
      )
    );
  }
}
