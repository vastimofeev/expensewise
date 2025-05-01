class Expense {
  // Уникальный идентификатор, например "e1"
  final String id;

  // Название расхода, например "Кофе"
  final String title;

  // Сумма, например 120.0
  final double amount;

  // Дата, когда произошёл расход
  final DateTime date;

  // Категория, например "Еда" или "Транспорт"
  final String category;

  // Конструктор (функция для создания объекта)
  Expense({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  });
}
