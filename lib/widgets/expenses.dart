import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  // When you're in a class that extends state, Flutter automatically adds a context property
  // to your class behind the scenes so to say. It's provided by this state parent class.
  final List<ExpenseModel> _registerExpenses = [
    ExpenseModel(
      amount: 19.99,
      date: DateTime.now(),
      title: 'Flutter Course',
      category: Category.work,
    ),
    ExpenseModel(
      amount: 12.69,
      date: DateTime.now(),
      title: 'Cinema',
      category: Category.leisure,
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        context: context, builder: (ctx) => const NewExpense());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter ExpenseTracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text('The chart..'),
          Expanded(child: ExpensesList(expenses: _registerExpenses)),
        ],
      ),
    );
  }
}
