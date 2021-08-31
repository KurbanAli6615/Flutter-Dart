import 'package:expense_planner/Models/transections.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransectionList extends StatelessWidget {
  final List<Transection> transections;
  final Function? deleteTx;
  TransectionList(this.transections, this.deleteTx);
  @override
  Widget build(BuildContext context) {
    return transections.isEmpty
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
          );
  }
}
