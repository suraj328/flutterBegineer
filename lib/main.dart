import 'package:expense_tracker/expense_tracker.dart';
import 'package:flutter/material.dart';

// example of theming
// by configuring theme you can apply multiple widget like elevated button with same choosen color
// copyWith() use object to applt

// for light mode
var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);

// for dark mode
var kDarkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 9, 99, 125),
);

void main() {
  runApp(MaterialApp(
    // dark theme
    darkTheme: ThemeData.dark().copyWith(
      useMaterial3: true,
      colorScheme: kDarkColorScheme,
      appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kDarkColorScheme.onPrimaryContainer,
          foregroundColor: kDarkColorScheme.primaryContainer),
      cardTheme: const CardTheme().copyWith(
        color: kDarkColorScheme.secondaryContainer,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer),
      ),
      textTheme: ThemeData().textTheme.copyWith(
            // title large will style text title like appBar title
            titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: kDarkColorScheme.onSecondaryContainer,
                fontSize: 16),
          ),
      bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: kDarkColorScheme.onSecondaryContainer),
    ),
    //default or light theme
    theme: ThemeData().copyWith(
      useMaterial3: true,
      colorScheme: kColorScheme,
      appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer),
      cardTheme: const CardTheme().copyWith(
        color: kColorScheme.secondaryContainer,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer),
      ),
      textTheme: ThemeData().textTheme.copyWith(
            // title large will style text title like appBar title
            titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: kColorScheme.onSecondaryContainer,
                fontSize: 16),
          ),
    ),
    // scaffoldBackgroundColor: const Color.fromARGB(219, 235, 249, 255),
    title: "Expenses Tracker",
    home: const Expenses(),
    // we can forcefully send theme mode to light or dark
    // default its in system
    themeMode: ThemeMode.system,
  ));
}
