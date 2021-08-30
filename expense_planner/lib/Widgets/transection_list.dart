import 'package:expense_planner/Models/transections.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransectionList extends StatelessWidget {
  final List<Transection> transections;
  final Function? deleteTx;
  TransectionList(this.transections, this.deleteTx);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 665,
      child: transections.isEmpty
          ? Column(
              children: [
                Text(
                  "No Transections Added Yet",
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    "assets/Images/waiting.png",
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: FittedBox(
                            child: Text("\$${transections[index].amount}")),
                      ),
                    ),
                    title: Text(
                      transections[index].title.toString(),
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transections[index].date!),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red[900],
                      ),
                      onPressed: () {
                        deleteTx!(transections[index].id);
                      },
                    ),
                  ),
                );
              },
              itemCount: transections.length,
            ),
    );
  }
}

// return Card(
//                   child: Row(
//                     children: [
//                       Container(
//                         margin:
//                             EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                             color: Theme.of(context).primaryColor,
//                             width: 1,
//                           ),
//                         ),
//                         padding: EdgeInsets.all(10),
//                         child: Text(
//                           "\$" +
//                               transections[index]
//                                   .amount!
//                                   .toStringAsFixed(2)
//                                   .toString(),
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20,
//                             color: Theme.of(context).primaryColor,
//                           ),
//                         ),
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Text(
//                             transections[index].title!,
//                             style: Theme.of(context).textTheme.title,
//                           ),
//                           Text(
//                             DateFormat.yMMMd()
//                                 .format(transections[index].date!),
//                             style: TextStyle(color: Colors.grey, fontSize: 12),
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 );