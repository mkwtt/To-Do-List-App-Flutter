# To-Do List App

This is a simple To-Do List app developed using **Flutter 3.29.2**. The app allows users to add, mark as done, and delete tasks.

## Features

- **Add tasks**: Users can add new tasks using a text input field.
- **Mark tasks as done**: Users can check or uncheck tasks to mark them as completed.
- **Delete tasks**: Users can remove tasks from the list with confirmation.
- **Task Management**: Users can manage their tasks with a simple, intuitive interface.

## Getting Started

This project is built using Flutter 3.29.2. To get started, you'll need to have Flutter installed on your machine.

### Prerequisites

1. Install [Flutter SDK](https://flutter.dev/docs/get-started/install) on your machine.
2. Make sure you have an IDE such as **VS Code** or **Android Studio** set up for Flutter development.
3. Set up a device or emulator to run the application.

### Running the Project

1. Clone the repository:

   ```bash
   git clone https://github.com/mkwtt/To-Do-List-App-Flutter.git
   ```

2. Navigate into the project directory:

   ```bash
   cd to-do-list-app
   ```

3. Run the application:

   ```bash
   flutter run
   ```

The app should launch on your emulator or connected device.

## File Structure

- `lib/` - Contains all the Flutter application code.
  - `models/task.dart` - Defines the `Task` class that holds task data (name and status).
  - `screens/item.dart` - Contains the UI logic for displaying and interacting with the tasks.
  - `main.dart` - The entry point of the application, setting up the Material app and routing.

## Dependencies

This project uses the following dependencies:

- `flutter`: The Flutter SDK itself.
- `material.dart`: Used for UI components.

## Contribution

Feel free to fork this repository, make changes, and create pull requests. We welcome contributions!

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Flutter documentation for providing excellent resources.
- Open-source contributors for their helpful guides and tutorials.
