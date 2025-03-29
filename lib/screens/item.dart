import 'package:flutter/material.dart';
import 'package:to_do_list_app/models/task.dart';

class Item extends StatefulWidget {
  const Item({super.key});

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.orange,
                ),
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(20),
                child: Row(
                  children: [
                    SizedBox(
                      width: 40,
                      child: Checkbox(
                        value: data[index].isDone,
                        onChanged: (bool? value) {
                          setState(() {
                            data[index].isDone = value ?? false;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "${data[index].name} (${data[index].isDone ? "Done" : "Not Done"})",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          decoration:
                              data[index].isDone
                                  ? TextDecoration.lineThrough
                                  : null,
                        ),
                        overflow: TextOverflow.clip,
                      ),
                    ),
                    SizedBox(
                      width: 40,
                      child: IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Confirm Deletion"),
                                content: Text(
                                  "Are you sure you want to delete this task?",
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Cancel"),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        data.removeAt(index);
                                      });
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            "Delete Task Complete!",
                                          ),
                                        ),
                                      );
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Delete"),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        icon: Icon(Icons.delete, size: 40, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter a task name";
                }
                return null;
              },
              onSaved: (value) {
                _name = value!;
              },
              decoration: InputDecoration(
                label: Text("Add new task", style: TextStyle(fontSize: 20)),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: SizedBox(
            width: 100,
            height: 100,
            child: IconButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();

                  setState(() {
                    data.add(Task(name: _name, isDone: false));
                  });

                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text("Add Task Complete!")));

                  _formKey.currentState!.reset();
                }
              },
              icon: Icon(Icons.add, size: 40, color: Colors.blue),
            ),
          ),
        ),
      ],
    );
  }
}
