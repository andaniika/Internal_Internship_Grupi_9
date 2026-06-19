# Task Manager App

A simple Flutter and Dart MVP application for managing tasks locally. This project is designed as an internship final project and uses beginner-friendly code with a clean folder structure.

## Features

- View a list of tasks.
- See the total number of tasks.
- See how many tasks are Done and Active.
- Add a new task with a title and description.
- Edit an existing task.
- Delete a task.
- Mark tasks as Done or Active with a checkbox.
- Open a detail screen for each task.
- Show SnackBar messages for errors and successful actions.

## Folder Structure

```text
lib/
  main.dart
  models/
    task.dart
  screens/
    home_screen.dart
    task_form_screen.dart
    task_detail_screen.dart
```

## Technologies Used

- Flutter
- Dart
- Material Design widgets
- StatefulWidget
- Navigator.push and Navigator.pop
- setState
- SnackBar

## How the App Works

The app stores all tasks in a local `List<Task>` inside the home screen. No database, Firebase, provider, bloc, or external package is used.

The home screen displays task statistics and a `ListView.builder` list of task cards. Each card has a checkbox to change the task status between Active and Done. Tapping a task opens the detail screen.

The add/edit screen uses `TextEditingController` for the title and description fields. If either field is empty, a SnackBar message is shown. When the form is valid, the created or edited `Task` is returned to the previous screen with `Navigator.pop`.

The detail screen displays the selected task title, description, and status. The Edit button opens the form screen with the existing task data. The Delete button returns a delete action to the home screen, where the task is removed from the list.

## Short Technical Reflection

This project demonstrates the core Flutter concepts needed for a beginner task manager application. It uses local state with `StatefulWidget` and `setState`, simple navigation between screens, form input with controllers, validation, and clean separation between the model and screens. Keeping the data in a local list makes the project easy to understand and suitable for an MVP internship submission.

## Suggested Git Commit Messages

```text
Initial Flutter task manager project setup
Add Task model
Create home screen with task list and summary
Add task form screen with validation
Add task detail screen with edit and delete actions
Update README with project documentation
```
