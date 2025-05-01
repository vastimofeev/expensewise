import '../models/expense.dart';

// Это список — как будто пользователь уже ввёл эти траты
final List<Expense> dummyExpenses = [
  Expense(
    id: 'e1',
    title: 'Кофе',
    amount: 120.0,
    date: DateTime.now().subtract(Duration(hours: 2)),
    category: 'Еда',
  ),
  Expense(
    id: 'e2',
    title: 'Такси',
    amount: 350.0,
    date: DateTime.now().subtract(Duration(days: 1)),
    category: 'Транспорт',
  ),
];
