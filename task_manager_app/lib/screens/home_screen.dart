import 'package:flutter/material.dart';

import '../models/task.dart';
import 'task_detail_screen.dart';
import 'task_form_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Task> tasks = [
    Task(
      title: 'Finish Flutter project',
      description: 'Complete the internship final project task manager app.',
    ),
    Task(
      title: 'Review Dart basics',
      description: 'Practice classes, lists, navigation, and setState.',
      isDone: true,
    ),
  ];

  int get doneTasksCount {
    return tasks.where((task) => task.isDone).length;
  }

  int get activeTasksCount {
    return tasks.where((task) => !task.isDone).length;
  }

  Future<void> _addTask() async {
    final Task? newTask = await Navigator.push<Task>(
      context,
      MaterialPageRoute(
        builder: (context) => const TaskFormScreen(),
      ),
    );

    if (newTask != null) {
      setState(() {
        tasks.add(newTask);
      });

      _showMessage('Task added successfully');
    }
  }

  Future<void> _openTaskDetail(int index) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TaskDetailScreen(task: tasks[index]),
      ),
    );

    if (result == 'delete') {
      setState(() {
        tasks.removeAt(index);
      });

      _showMessage('Task deleted successfully');
    } else if (result is Task) {
      setState(() {
        tasks[index] = result;
      });

      _showMessage('Task updated successfully');
    }
  }

  void _toggleTaskStatus(int index, bool? value) {
    setState(() {
      tasks[index].isDone = value ?? false;
    });

    final String message = tasks[index].isDone
        ? 'Task marked as done'
        : 'Task marked as active';
    _showMessage(message);
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Manager App'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSummarySection(),
              const SizedBox(height: 16),
              Expanded(
                child: tasks.isEmpty ? _buildEmptyState() : _buildTaskList(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTask,
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildSummarySection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Task Summary',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text('Total tasks: ${tasks.length}'),
          Text('Done tasks: $doneTasksCount'),
          Text('Active tasks: $activeTasksCount'),
        ],
      ),
    );
  }

  Widget _buildTaskList() {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final Task task = tasks[index];

        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: Checkbox(
              value: task.isDone,
              onChanged: (value) => _toggleTaskStatus(index, value),
            ),
            title: Text(
              task.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                decoration: task.isDone
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
            subtitle: Text(
              task.isDone ? 'Done' : 'Active',
              style: TextStyle(
                color: task.isDone ? Colors.green : Colors.orange,
              ),
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _openTaskDetail(index),
          ),
        );
      },
    );
  }

  Widget _buildEmptyState() {
    return const Center(
      child: Text(
        'No tasks yet. Tap + to add your first task.',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
