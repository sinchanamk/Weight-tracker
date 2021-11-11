import 'package:designweight/Models/weight.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeightListItem extends StatelessWidget {
  final WeightModel? weightModel;
  DateTime _time = DateTime.now();

  WeightListItem({Key? key, required this.weightModel}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(8.0),
        child: Card(
            elevation: 10,
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          'Average',
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                        Text('100')
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(children: [
                        Text(
                          'Weight',
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          weightModel!.weight.toString(),
                          textAlign: TextAlign.center,
                        ),
                      ]),
                    ),
                  ),
                  Expanded(
                    child: Column(children: [
                      Text(
                        'Time',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        _time.toString(),
                        textAlign: TextAlign.right,
                      ),
                    ]),
                  )
                ]))));
  }
}
