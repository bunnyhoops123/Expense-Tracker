import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widget/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

//Output the list of expenses

class ExpensesList extends StatelessWidget {
  const ExpensesList({required this.expenses, super.key});

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    /*Column not ideal for large number of items.
    ListView.builder used instead --> Scrollable list and creates widgets on the go ,
     i.e. when about to be visible/ visible */
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => ExpenseItem(expenses[
          index]), //index is the index of the itmen in the list which is being currently displayed
    );
  }
}
