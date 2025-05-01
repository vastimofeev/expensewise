import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewExpense extends StatefulWidget {
  final void Function(String title, double amount, String category, DateTime date) onAdd;

  const NewExpense({super.key, required this.onAdd});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _selectedCategory = 'Еда';

  void _submit() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.tryParse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount == null || enteredAmount <= 0) return;

    widget.onAdd(enteredTitle, enteredAmount, _selectedCategory, _selectedDate);
    Navigator.of(context).pop(); // закрыть bottom sheet
  }

  void _pickDate() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1);
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: firstDate,
      lastDate: now,
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(labelText: 'Название'),
          ),
          TextField(
            controller: _amountController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Сумма'),
          ),
          Row(
            children: [
              DropdownButton<String>(
                value: _selectedCategory,
                items: const [
                  DropdownMenuItem(value: 'Еда', child: Text('Еда')),
                  DropdownMenuItem(value: 'Транспорт', child: Text('Транспорт')),
                  DropdownMenuItem(value: 'Развлечения', child: Text('Развлечения')),
                ],
                onChanged: (value) {
                  if (value != null) {
                    setState(() => _selectedCategory = value);
                  }
                },
              ),
              const Spacer(),
              Text(DateFormat.yMMMd().format(_selectedDate)),
              TextButton(
                onPressed: _pickDate,
                child: const Text('Выбрать дату'),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: _submit,
            child: const Text('Добавить'),
          )
        ],
      ),
    );
  }
}
