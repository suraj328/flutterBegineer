import 'package:expense_tracker/widget/chart/chart.dart';
import 'package:expense_tracker/widget/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widget/new_expenses.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: "Burger Crunchy",
        amount: 14.59,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: "Developer",
        amount: 44.02,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: "Avatar",
        amount: 12.26,
        date: DateTime.now(),
        category: Category.lesiure),
  ];

  //this function is for creating overlapping widget
  void _openAddExpenseOverlay() {
    // since context are directly asssign with help pf belonging class
    // modal class contain come with widget meta data
    showModalBottomSheet(
        // take all entire space when its true
        // else take only wiget space size or set size
        isScrollControlled: true,
        // do not take space in device features like camera
        useSafeArea: true,
        context: context,
        builder: (ctx) => NewExpenses(
              onAddExpense: _addExpenses,
            ));
  }

  // add expenses
  void _addExpenses(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  // remove expenses
  void _removeExpenses(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    // scanfoldMessenger acts like dialog class which dialog on bottom of screen
    // which through message along with time set duration
    // action conatains label and event
    // event used to implememt some logic
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      content: const Text('Expense deleted'),
      action: SnackBarAction(
        label: 'undo',
        onPressed: () {
          setState(() {
            _registeredExpenses.insert(expenseIndex, expense);
          });
        },
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    // finding screen size for responsive
    // finding screen width
    final width = MediaQuery.of(context).size.width;
    // finding screen height
    // final height = MediaQuery.of(context).size.height;

    Widget mainContent =
        const Center(child: Text("No Expenses found.Start adding some"));
    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
          expenses: _registeredExpenses, onRemoveExpense: _removeExpenses);
    }
    return Scaffold(
      appBar: AppBar(
          title: const Text("Flutter Expense Tracker"),
          // working with differ devices its automatically true or false
          // centerTitle: false,
          actions: [
            IconButton(
              onPressed: _openAddExpenseOverlay,
              icon: const Icon(Icons.add),
            )
          ]),
      body: width < 600
          ? Column(
              children: [
                Chart(expenses: _registeredExpenses),
                Expanded(
                  // expanseseList widget without snackbar
                  // child: ExpensesList(
                  //     expenses: _registeredExpenses,
                  //     onRemoveExpense: _removeExpenses),
                  // ----------------------------------

                  //expanses list with conditonal rendering
                  child: mainContent,
                )
              ],
            )
          : Row(
              children: [
                Expanded(child: Chart(expenses: _registeredExpenses)),
                Expanded(
                  // expanseseList widget without snackbar
                  // child: ExpensesList(
                  //     expenses: _registeredExpenses,
                  //     onRemoveExpense: _removeExpenses),
                  // ----------------------------------

                  //expanses list with conditonal rendering
                  child: mainContent,
                )
              ],
            ),
    );
  }
}
