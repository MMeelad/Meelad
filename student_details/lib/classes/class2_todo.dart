// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class todo extends StatefulWidget {
  const todo({Key? key}) : super(key: key);

  @override
  _todoState createState() => _todoState();
}

class _todoState extends State<todo> {
  List<String> tasks = [
    'Clean Dishes',
    'Clean your room',
    'Study',
    'Get groceries',
    'Code',
  ];

  TextEditingController textFieldController = TextEditingController();

  List<bool> isTaskDone = [];

  @override
  void initState() {
    isTaskDone = List<bool>.filled(50, false);
    super.initState();
  }

  void addTask(String task) {
    setState(() {
      tasks.add(task);
    });
    textFieldController.clear();
  }

  void removeTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return Dismissible(
            key: Key(tasks[index]),
            onDismissed: (direction) {
              removeTask(index);
              Scaffold.of(context).showSnackBar(
                  new SnackBar(content: new Text('Task "$task"  Deleted.')));
            },
            background: Container(
              alignment: AlignmentDirectional.center,
              child: Icon(Icons.delete),
              color: Colors.red,
            ),
            child: CheckboxListTile(
              title: Text(
                tasks[index],
                style: TextStyle(
                    decoration:
                        isTaskDone[index] ? TextDecoration.lineThrough : null),
              ),
              onChanged: (value) {
                setState(() {
                  isTaskDone[index] = value!;
                });
              },
              value: isTaskDone[index],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return Container(
                  height: 400,
                  width: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextField(
                          controller: textFieldController,
                          decoration: InputDecoration(
                            hintText: 'Task TODO',
                            hintStyle: TextStyle(fontSize: 20),
                          ),
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            setState(() {});
                          }),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 5, 15, 0),
                            child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    addTask(textFieldController.text);
                                    Navigator.pop(context);
                                  });
                                },
                                child: Text('Add Task')),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
