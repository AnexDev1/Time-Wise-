import 'package:flutter/material.dart';
import 'package:time_wise/widgets/task_list.dart';
import 'package:time_wise/screens/add_task_screen.dart';
import 'package:provider/provider.dart';

import '../models/task_data.dart';

class TaskScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState!.openDrawer(); // Open the drawer
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // GlobalKey for the Scaffold widget

      backgroundColor: Colors.lightBlueAccent,

      // FloatingActionButton for adding tasks
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: const AddTaskScreen(),
              ),
            ),
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 60.0,
              right: 30.0,
              bottom: 30.0,
              left: 30.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: _openDrawer, // Call the method to open the drawer
                  child: const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30.0,
                    child: Icon(
                      Icons.list,
                      size: 35.0,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  'TimeWise',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '${Provider.of<TaskData>(context).taskCount} Tasks',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: const TaskList(),
            ),
          )
        ],
      ),

      drawer: Drawer(
        // Drawer widget for the navigation drawer
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 15.0),
              // height: 150.0,
              child: const DrawerHeader(
                decoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(30.0))),
                child: Center(
                  child: Text(
                    'App Menu',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding:
                  const EdgeInsets.only(left: 7.0, right: 5.0, bottom: 7.0),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
                child: ListTile(
                  title: const Text(
                    'Home',
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: const Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  onTap: () {
                    // Perform any action when Item 1 is clicked
                  },
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 7.0, right: 5.0, bottom: 5.0),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
                child: ListTile(
                  title: const Text(
                    'Settings',
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: const Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  onTap: () {
                    // Perform any action when Item 1 is clicked
                  },
                ),
              ),
            ),
            // Add more ListTiles for additional items in the drawer
          ],
        ),
      ),
    );
  }
}
