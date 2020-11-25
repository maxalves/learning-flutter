import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTransaction;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTransaction);

  void _submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    addTransaction(enteredTitle, enteredAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              autofocus: true,
              autocorrect: true,
              decoration: InputDecoration(labelText: 'Descrição'),
              controller: titleController,
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Valor'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
            ),
            FlatButton(
              child: Text('Adicionar Transação'),
              textColor: Colors.purple,
              onPressed: _submitData,
            )
          ],
        ),
      ),
    );
  }
}
