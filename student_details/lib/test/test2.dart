import 'package:flutter/material.dart';

class test2 extends StatefulWidget {
  const test2({Key? key}) : super(key: key);

  @override
  _test2State createState() => _test2State();
}

class _test2State extends State<test2> {
  List<String> tasks = [];
  List<bool> isTaskDone = [];
  TextEditingController textcontroller = TextEditingController();

  removeTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  addTask(String task) {
    setState(() {
      tasks.add(task);
    });
    textcontroller.clear();
  }

  @override
  void initState() {
    isTaskDone = List<bool>.filled(50, false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('TODO'),
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
                      SnackBar(content: Text('task $task delete')));
                },
                child: CheckboxListTile(
                  title: Text(
                    tasks[index],
                    style: TextStyle(
                        decoration: isTaskDone[index]
                            ? TextDecoration.lineThrough
                            : null),
                  ),
                  onChanged: (value) {
                    setState(() {
                      isTaskDone[index] = value!;
                    });
                  },
                  value: isTaskDone[index],
                ),
              );
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return Container(
                    
                  );
                });
          },
        ));
  }
}
