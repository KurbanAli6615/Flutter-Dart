import 'dart:core';
import 'package:expense_planner/Models/transections.dart';
import 'package:expense_planner/Widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transection>? recentTansections;

  Chart({this.recentTansections});

  List<Map<String, Object>> get groupedTransectionValues {
    return List.generate(
      7,
      (index) {
        final weekDay = DateTime.now().subtract(
          Duration(days: index),
        );
        double totalSum = 0.0;
        for (var i = 0; i < recentTansections!.length; i++) {
          if (recentTansections![i].date!.day == weekDay.day &&
              recentTansections![i].date!.month == weekDay.month &&
              recentTansections![i].date!.year == weekDay.year) {
            totalSum += recentTansections![i].amount!;
          }
        }
        return {
          'day': DateFormat.E().format(weekDay).substring(0, 1),
          'amount': totalSum
        };
      },
    ).reversed.toList();
  }

  double get totalSpending {
    return groupedTransectionValues.fold(0.0, (sum, item) {
      return sum + double.parse("${item['amount']}");
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransectionValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransectionValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                label: data['day'].toString(),
                spendingAmount: double.parse("${data['amount']}"),
                spendingPctOfTotal: totalSpending == 0.0
                    ? 0.0
                    : double.parse("${data['amount']}") / totalSpending,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
