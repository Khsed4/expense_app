import 'package:expenses_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction_list;
  TransactionList(this.transaction_list);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              margin: EdgeInsets.symmetric(vertical: 8,
              horizontal: 5),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  child: Padding(
                    padding: EdgeInsets.all(6),
                    child: FittedBox(
                      child: Text('\$${transaction_list[index].amount}'),
                    ),
                  ),
                ),
                title: Text(
                  transaction_list[index].title,
                  style: Theme.of(context).textTheme.headline6,
                ),
                subtitle:
                    Text(DateFormat.yMMMM().format(transaction_list[index].dateTime)),
              ),
            );
          },
          itemCount: transaction_list.length),
    );
  }
}
