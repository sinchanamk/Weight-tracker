import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'Models/weight.dart';

class WeightScreen extends StatefulWidget {
  final double? weight;

  const WeightScreen({Key? key, this.weight}) : super(key: key);

  @override
  WeightScreenState createState() => WeightScreenState();
}

class WeightScreenState extends State<WeightScreen> {
  TextEditingController _timeController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double width = 0.0;
  double height = 0.0;
  double _weight = 70;
  DateTime _time = DateTime.now();
  @override
  void didChangeDependencies() {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    super.didChangeDependencies();
  }

  void _weightScreen(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return NumberPickerDialog.decimal(
            initialDoubleValue: _weight,
            title: Text("Enter your weight"),
            minValue: 1,maxValue: 330,
          );
        }).then((value) {
      if (value != null) {
        setState(() => _weight = value);
      }
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(
            'Weight Screen',
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: height * .2),
              Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Time',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: '$_time',
                      prefixIcon: Icon(Icons.lock_clock),
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder()),
                  controller: _timeController,
                  // onTap: () => _showWeightPicker(context),
                ),
              ),
              Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Weight or kg',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: '$_weight',
                      prefixIcon: Icon(Icons.fit_screen),
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder()),
                  controller: _weightController,
                  onTap: () => _weightScreen(context),
                ),
              ),
              FlatButton(
                  shape: RoundedRectangleBorder(),
                  color: Colors.black,
                  onPressed: () {
                    Navigator.of(context)
                        .pop(WeightModel(weight: _weight, time: _time));
                  },
                  child: Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  )),
            ],
          ),
        ),
      );
}
