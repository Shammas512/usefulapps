import 'dart:isolate';

import 'package:flutter/material.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  final TextEditingController taskscontroller = TextEditingController();
  final List<Map<String, dynamic>> tasks = [];
  void addtasks(String task) {
    if (task.isNotEmpty) {
      setState(() {
        tasks.add({
          "title": task,
          "isDone": false,
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF24A19C),
      appBar: AppBar(
        title: const Text("Todo App"),
        backgroundColor: const Color(0XFF24A19C),
      ),
      // 24A19C ABE4AO
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                    color: const Color(0XFF9DC183),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextField(
  controller: taskscontroller,
  textAlign: TextAlign.center,
  decoration: InputDecoration(
    hintText: "Add Todo",
    border: InputBorder.none,
  ),
),

                ),
                SizedBox(
                  width: 20,
                ),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      addtasks(taskscontroller.text);
                      taskscontroller.clear();
                    });
                  },
                  child: Icon(Icons.add),
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 4,
                      color: const Color(0xff9DC183),
                      child: SizedBox(
                        height: 100,
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(22),
                          leading: Checkbox(
                              value: tasks[index]["isDone"],
                              onChanged: (bool? value) {
                                setState(() {
                                  tasks[index]["isDone"] = value;
                                });
                              }),
                          title: Text(tasks[index]["title"],style: TextStyle( fontWeight: FontWeight.w500, decoration: tasks[index]["isDone"]?TextDecoration.lineThrough:TextDecoration.none ) )
                         , 
                          trailing: IconButton(
                              onPressed: () {
                                setState(() {});
                                tasks.removeAt(index);
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              )),
                        ),
                      ),
                    );
                  }),
            ),
            
          ],
        ),
      ),
    );
  }
}
