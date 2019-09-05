import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionInput extends StatefulWidget {
  final Function onNewTransaction;

  TransactionInput(this.onNewTransaction);

  @override
  _TransactionInputState createState() => _TransactionInputState();
}

class _TransactionInputState extends State<TransactionInput> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
  }

  void _openDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 365)),
      lastDate: DateTime.now(),
    ).then((date) {
      if (date == null) return;
      setState(() {
        _selectedDate = date;
      });
    });
  }

  void _onSubmit() {
    if (_amountController.text.isEmpty) return;

    final title = _titleController.text;
    final amount = double.parse(_amountController.text);

    if (title.isEmpty || amount <= 0) return;

    widget.onNewTransaction(title, amount, _selectedDate);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Container(
          padding: EdgeInsets.only(
            left: 10,
            top: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Title'),
                controller: _titleController,
                onSubmitted: (_) => _onSubmit(),
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Amount'),
                controller: _amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _onSubmit(),
              ),
              Container(
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                          'Date: ${DateFormat.yMd().format(_selectedDate)}'),
                    ),
                    FlatButton(
                      textColor: Theme.of(context).primaryColor,
                      child: const Text(
                        'Choose Date',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: _openDatePicker,
                    )
                  ],
                ),
              ),
              RaisedButton(
                child: const Text('Add transaction'),
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).buttonColor,
                onPressed: _onSubmit,
              )
            ],
          ),
        ),
      ),
    );
  }
}
