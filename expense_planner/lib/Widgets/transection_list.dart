import 'package:expense_planner/Models/transections.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransectionList extends StatelessWidget {
  final List<Transection> transections;
  TransectionList(this.transections);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                      width: 1,
                    ),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "\$" +
                        transections[index]
                            .amount!
                            .toStringAsFixed(2)
                            .toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      transections[index].title!,
                      style: Theme.of(context).textTheme.title,
                    ),
                    Text(
                      DateFormat.yMMMd().format(transections[index].date!),
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    )
                  ],
                )
              ],
            ),
          );
        },
        itemCount: transections.length,
      ),
    );
  }
}
