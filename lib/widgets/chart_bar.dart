import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  var spendingAmount;
 var spendingPCOfTotal;
  ChartBar(this.label, this.spendingAmount, this.spendingPCOfTotal);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FittedBox(child: Text('\$${spendingAmount}')),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey, width: 1.0),
                    color: Color.fromRGBO(220, 220, 220, 1)),
                
              ),
              FractionallySizedBox(
                  heightFactor: spendingPCOfTotal,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                                          borderRadius: BorderRadius.circular(10),

                    ),
                  ))
            ],
          ),
        ),
        Text(label)
      ],
    );
  }
}
