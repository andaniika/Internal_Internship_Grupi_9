# Day 3 - Task Tracker App

## Overview

This project is developed as part of **Internal Internship Day 3**.
The goal of this application is to build a simple **Task Tracker** using Flutter, where users can add, manage, and track the status of their tasks dynamically.

The app demonstrates core Flutter concepts such as state management, model classes, user input handling, and dynamic UI updates.

---

## Features

* Add new tasks using a text input field
* Mark tasks as **Completed / Active** using a checkbox
* Delete tasks from the list
* Display total number of tasks
* Display number of completed tasks
* Show SnackBar messages for user actions
* Real-time UI updates using `setState()`

---

## Technologies Used

* Flutter
* Dart
* StatefulWidget
* setState()
* Material Design (Material 3)

---

## Project Structure

This is a single-file project for simplicity:

```text
lib/
└── main.dart
```

---

## Core Functionalities

### 1. Add Task

Users can enter a task title and add it to the list.

### 2. Mark as Done

Each task has a checkbox to mark it as completed or active.

### 3. Delete Task

Tasks can be removed using the delete icon.

### 4. Task Counter

The app dynamically shows:

* Total tasks
* Completed tasks

---

## Concepts Applied

### Model Class

A simple `Task` class is used to structure data:

* title
* isDone (status)

### State Management

The app uses `setState()` to update UI instantly when:

* adding tasks
* deleting tasks
* updating task status

### User Interaction

* TextField for input
* Buttons for actions
* Checkbox for status
* SnackBar for feedback

---

## UI Highlights

* Clean Material 3 design
* Cards for each task
* Responsive layout using Column and Expanded
* Visual feedback for completed tasks (line-through text)

---

## Example Flow

1. User enters task in TextField
2. Presses "Add Task" button
3. Task appears in list
4. User can:

   * Mark it as completed
   * Delete it
5. Counters update automatically

---

## GitHub Commit

```bash
day3 tracker state
```

---

## Learning Outcomes

After completing this project, the developer understands:

* How to manage state in Flutter using `setState()`
* How to use model classes for structured data
* How to build dynamic lists
* How to handle user input
* How to provide user feedback using SnackBar

---

## Future Improvements (Bonus Ideas)

* Add local storage (SharedPreferences or SQLite)
* Add edit functionality
* Add task categories
* Improve UI with animations
* Add filters (All / Completed / Active)
