import 'package:flutter/material.dart';
import '../../models/expense.dart';

class ExpensesView extends StatefulWidget {
  const ExpensesView({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  State<ExpensesView> createState() {
    return _ExpensesViewState();
  }
}

class _ExpensesViewState extends State<ExpensesView> {
  @override
  Widget build(BuildContext context) {
    return widget.expenses.isEmpty
        ? const Center(
            child: Text(
              'No expenses found. Start adding some!',
              style: TextStyle(fontSize: 16),
            ),
          )
        : ListView.builder(
            itemCount: widget.expenses.length,
            itemBuilder: (context, index) => Dismissible(
              key: ValueKey(widget.expenses[index].id),
              background: Container(
                color: Theme.of(context).colorScheme.error,
                margin: const EdgeInsets.symmetric(horizontal: 16),
              ),
              onDismissed: (direction) {
                widget.onRemoveExpense(widget.expenses[index]);
              },
              child: ExpenseItem(expense: widget.expenses[index]),
            ),
          );
  }
}

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense});

  final Expense expense;

  IconData get expenseIcon {
    switch (expense.category) {
      case Category.food:
        return Icons.free_breakfast;
      case Category.travel:
        return Icons.travel_explore;
      case Category.leisure:
        return Icons.holiday_village;
      case Category.work:
        return Icons.work;
    }
  }

  String get expenseDate {
    return "11/54/25";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    expense.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("${expense.amount.toStringAsFixed(2)} \$"),
                ],
              ),
              const Spacer(),
              Row(children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(expenseIcon),
                ),
                Text(expenseDate)
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
