import 'package:flutter/material.dart';


class NewTransaction extends StatefulWidget {
final Function addText;

    NewTransaction(this.addText);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
    final titleController = TextEditingController();

    final amountController = TextEditingController();  

    @override
  Widget build(BuildContext context) {
    void pressAction(){
      final title = titleController.text;
      final amount = double.parse(amountController.text);
      if( title.isEmpty || amount<=0){
      return;
      }
       widget.addText(
         title,amount);
         Navigator.of(context).pop();
    }
    return  Card(
              elevation: 5,
              child: 
            
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
              
                children: <Widget>[
                  
                  TextField(decoration: InputDecoration(labelText: 'Enter Title'),
                  controller: titleController,
                  ),
                  TextField(decoration: InputDecoration(labelText: 'Enter Amount'),

                  keyboardType: TextInputType.number,
                  onSubmitted: (value) => pressAction(),
                 controller: amountController),
                  FlatButton(textColor: Colors.purple,
                  child: Text('Add Transaction'),
                  onPressed: () => pressAction(), ),
                ],
              ),
            ),);
  }
}