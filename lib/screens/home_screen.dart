import 'package:flutter/material.dart';
import '../data/dummy_expenses.dart';
import '../models/expense.dart';
import '../widgets/expense_item.dart';
import '../widgets/new_expense.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Expense> _expenses = [...dummyExpenses];

  void _addExpense(String title, double amount, String category, DateTime date) {
    final newExpense = Expense(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: date,
      category: category,
    );

    setState(() {
      _expenses.add(newExpense);
    });
  }

  void _openAddExpenseModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => NewExpense(onAdd: _addExpense),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ExpenseWise'),
      ),
      body: ListView.builder(
        itemCount: _expenses.length,
        itemBuilder: (ctx, index) => ExpenseItem(expense: _expenses[index]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openAddExpenseModal,
        child: const Icon(Icons.add),
      ),
    );
  }
}
