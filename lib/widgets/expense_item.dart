import 'package:flutter/material.dart';
import '../models/expense.dart';
import 'package:intl/intl.dart'; // нужен для форматирования даты

class ExpenseItem extends StatelessWidget {
  final Expense expense;

  const ExpenseItem({super.key, required this.expense});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      elevation: 3,
      child: ListTile(
        title: Text(expense.title),
        subtitle: Text(DateFormat.yMMMd().format(expense.date)),
        trailing: Text('${expense.amount.toStringAsFixed(0)}₽'),
      ),
    );
  }
}
