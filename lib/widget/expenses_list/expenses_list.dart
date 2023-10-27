import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widget/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemoveExpense});

  @override
  Widget build(BuildContext context) {
    // ListView.builder()  provides scrollable view
    // itemCount takes length of list fot itterating
    // itemBuild provides condex and position of itterating list by second parameter name index
    return ListView.builder(
      itemCount: expenses.length,
      // listView with no disamble widget
      // itemBuilder: (ctx, index) => ExpenseItem(expenses[index]),

      // listView with  disamble widget
      itemBuilder: (ctx, index) => Dismissible(
        background: Container(
          // setting color using home theme
          color: Theme.of(context).colorScheme.errorContainer.withOpacity(0.7),
          margin: EdgeInsets.symmetric(
              horizontal: Theme.of(context).cardTheme.margin!.horizontal),
        ),
        key: ValueKey(expenses[index]),
        onDismissed: (direction) => onRemoveExpense(expenses[index]),
        child: ExpenseItem(expenses[index]),
      ),
    );
  }
}
