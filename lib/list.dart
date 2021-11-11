import 'dart:async';
import 'package:designweight/widget/weightlist.dart';
import 'package:flutter/material.dart';
import 'Models/weight.dart';
import 'weight_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<WeightModel> _weightModel = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weight Tracker'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _weightModel.length,
        itemBuilder: (context, indice) {
          bool isFirstWeight = indice == 0;
          WeightModel weightModel1 = _weightModel[indice];
          double? difference = isFirstWeight ? 0.0 : weightModel1.weight;
          return WeightListItem(
            weightModel: weightModel1,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: _addNewValue,
        child: Icon(Icons.add),
      ),
    );
  }

  Future _addNewValue() async {
    WeightModel? addValue =
        await Navigator.of(context).push(MaterialPageRoute<WeightModel>(
      builder: (BuildContext context) {
        return WeightScreen();
      },
    ));
    if (addValue != null) {
      setState(() {
        _weightModel.add(addValue);
      });
    }
  }
}
