import 'package:expenses_app/models/transaction.dart';
import 'package:expenses_app/widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  List<Transaction> recentTrasanctions;
  Chart(this.recentTrasanctions);

  List<Map<String, Object>> get groupedTransactionsValue {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalTrasanctions = 0.0;
      for (var i = 0; i < recentTrasanctions.length; i++) {
        if (recentTrasanctions[i].dateTime.day == weekDay.day &&
            recentTrasanctions[i].dateTime.month == weekDay.month &&
            recentTrasanctions[i].dateTime.year == weekDay.year) {
          totalTrasanctions += recentTrasanctions[i].amount;
        }
      }
      // print('Day $DateFormat.E().format(weekDay)');
      // print('Amount $totalTrasanctions');
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 2),
        'amount': totalTrasanctions.toStringAsFixed(0)
      };
    }).reversed.toList();
  }

  double get maxSpending {
    return groupedTransactionsValue.fold(0.0, (sum, element) {
      return sum +
          (element['amount'] == null
              ? 0.0
              : (double.parse(element['amount'].toString())));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 6,
        margin: EdgeInsets.all(20),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: groupedTransactionsValue.map((tr) {
            return ChartBar(
                tr['day'].toString(),
                tr['amount'].toString(),
                (double.parse(tr['amount'].toString()) / (maxSpending)));
          }).toList()),
        ));
  }
}
