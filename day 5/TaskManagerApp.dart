// ======================= main.dart =======================

import 'package:flutter/material.dart';

void main() {
  runApp(const TaskManagerApp());
}

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Task Manager",
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const HomeScreen(),
    );
  }
}

// ======================= MODEL =======================

class Task {
  String title;
  String description;
  bool isDone;

  Task({
    required this.title,
    required this.description,
    this.isDone = false,
  });
}

// ======================= HOME SCREEN =======================

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> tasks = [];

  void addTask(Task task) {
    setState(() {
      tasks.add(task);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Task Added")),
    );
  }

  void updateTask(int index, Task task) {
    setState(() {
      tasks[index] = task;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Task Updated")),
    );
  }

  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Task Deleted")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        centerTitle: true,
        elevation: 5,
        title: const Text(
          "Task Manager",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      body: tasks.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.task_alt,
                    size: 100,
                    color: Colors.indigo,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "No Tasks Yet",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 6,
                  margin: const EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListTile(
                    leading: Checkbox(
                      value: tasks[index].isDone,
                      onChanged: (value) {
                        setState(() {
                          tasks[index].isDone = value!;
                        });
                      },
                    ),

                    title: Text(
                      tasks[index].title,
                      style: TextStyle(
                        decoration: tasks[index].isDone
                            ? TextDecoration.lineThrough
                            : null,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    subtitle: Text(tasks[index].description),

                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailScreen(
                            task: tasks[index],
                          ),
                        ),
                      );
                    },

                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.orange,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => AddEditTaskScreen(
                                  task: tasks[index],
                                  onSave: (newTask) {
                                    updateTask(index, newTask);
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            deleteTask(index);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AddEditTaskScreen(
                onSave: addTask,
              ),
            ),
          );
        },
      ),
    );
  }
}

// ======================= ADD / EDIT SCREEN =======================

class AddEditTaskScreen extends StatefulWidget {
  final Function(Task) onSave;
  final Task? task;

  const AddEditTaskScreen({
    super.key,
    required this.onSave,
    this.task,
  });

  @override
  State<AddEditTaskScreen> createState() => _AddEditTaskScreenState();
}

class _AddEditTaskScreenState extends State<AddEditTaskScreen> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.task != null) {
      titleController.text = widget.task!.title;
      descriptionController.text = widget.task!.description;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.task == null ? "Add Task" : "Edit Task",
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: "Title",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: descriptionController,
              maxLines: 4,
              decoration: InputDecoration(
                labelText: "Description",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 55,

              child: ElevatedButton(
                onPressed: () {
                  if (titleController.text.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Title cannot be empty"),
                      ),
                    );
                    return;
                  }

                  widget.onSave(
                    Task(
                      title: titleController.text,
                      description: descriptionController.text,
                    ),
                  );

                  Navigator.pop(context);
                },

                child: const Text(
                  "Save Task",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ======================= DETAIL SCREEN =======================

class DetailScreen extends StatelessWidget {
  final Task task;

  const DetailScreen({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task Details"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),

          child: Padding(
            padding: const EdgeInsets.all(25),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 25),

                const Text(
                  "Description",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  task.description,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),

                const SizedBox(height: 30),

                Row(
                  children: [
                    const Text(
                      "Status: ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      task.isDone ? "Completed ✅" : "Pending ⏳",
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
