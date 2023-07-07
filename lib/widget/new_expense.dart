import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  var _enteredTtile = '';

  var _enteredAmount = '';

  void _saveTitleInput(String inputvalue) {
    _enteredTtile = inputvalue;
  }

  void _saveAmountInput(String inputvalue) {
    _enteredAmount = inputvalue;
  }

  void _presentDatePicker() {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(children: [
        TextField(
          onChanged: _saveTitleInput,
          maxLength: 50,
          keyboardType:
              TextInputType.text, //Select which type of keyboard opens
          decoration: const InputDecoration(label: Text('Enter Expense')),
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                onChanged: _saveAmountInput,
                maxLength: 6,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    label: Text('Enter Amount'), prefixText: '\$'),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text('Selected Date'),
                  IconButton(
                      onPressed: _presentDatePicker,
                      icon: const Icon(Icons.calendar_month))
                ],
              ),
            )
          ],
        ),
        Row(
          children: [
            ElevatedButton.icon(
              onPressed: () {
                print(
                  '$_enteredTtile is $_enteredAmount',
                );
              },
              icon: const Icon(Icons.cancel),
              label: const Text('Cancel'),
            ),
            const Spacer(),
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context); //removes overlay
                },
                icon: const Icon(Icons.add),
                label: const Text('Add Expense'))
          ],
        )
      ]),
    );
  }
}
