# Smart Asset & Student Manager

A simple and responsive Flutter application for managing students or products. Users can add new records, validate input data, display records in a dynamic list, and remove entries when needed.

## Features

*  Add new students/products
*  Input validation using `Form` and `TextFormField`
*  Email format validation with RegExp
*  Dynamic list using `ListView.builder`
*  Delete records
*  Success notifications with `SnackBar`
*  Responsive layout for mobile and desktop
*  Clean UI with Material Design

## Screens

### Form Section

Users can enter:

* Full Name
* Email Address

After validation, the record is added to the list.

### List Section

Displays all registered records with:

* Person icon
* Name
* Email address
* Delete button

## Technologies Used

* Flutter
* Dart
* Material Design

## Project Structure

```text
main.dart
│
├── SmartAssetApp
│
├── MainItemScreen (StatefulWidget)
│   ├── _addItem()
│   ├── _buildFormCard()
│   ├── _buildItemList()
│   └── dispose()
│
└── List<Map<String, String>>
```

## Main Components

### Form Validation

The application validates:

* Empty name field
* Empty email field
* Correct email format using RegExp

### Dynamic List

Records are stored inside:

```dart
List<Map<String, String>> _itemList
```

and displayed with:

```dart
ListView.builder()
```

### Responsive Design

* **Mobile:** Form and list are displayed vertically.
* **Desktop:** Form and list are displayed side-by-side.

Implemented using:

```dart
MediaQuery.of(context).size.width > 600
```

## Getting Started

### Prerequisites

* Flutter SDK
* Dart SDK
* Android Studio or VS Code

### Installation

Clone the repository:

```bash
git clone https://github.com/yourusername/smart-asset-manager.git
```

Navigate to the project directory:

```bash
cd smart-asset-manager
```

Install dependencies:

```bash
flutter pub get
```

Run the application:

```bash
flutter run
```

## Example Initial Data

```dart
[
  {
    'emri': 'Studenti i Parë',
    'email': 'student1@uni-pr.edu'
  },
  {
    'emri': 'Studenti i Dytë',
    'email': 'student2@uni-pr.edu'
  }
]
```

## Future Improvements

*  Edit existing records
*  Search functionality
*  Save data locally using SharedPreferences or SQLite
*  Dark mode support
*  Product management with price and quantity fields
*  Firebase integration
*  CRUD operations with database support

## Author

Developed with Flutter and Dart.
