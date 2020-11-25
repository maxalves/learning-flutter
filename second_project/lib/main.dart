import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:second_project/widgets/new_transaction.dart';
import 'package:second_project/widgets/transaction_list.dart';
import 'package:uuid/uuid.dart';

import 'models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('br', null);
    Intl.defaultLocale = 'pt_BR';
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: Uuid(),
      title: 'Compras Online',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: Uuid(),
      title: 'Bar do Zé',
      amount: 9.99,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String txTitle, double amount) {
    final newTx = Transaction(
        id: Uuid(), title: txTitle, amount: amount, date: DateTime.now());

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(_addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          ),
        ],
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text('CHART!'),
              elevation: 5,
            ),
          ),
          TransactionList(_userTransactions),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
