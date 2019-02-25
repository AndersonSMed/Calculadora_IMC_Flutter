import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  String _infoText = "Informe seus dados";

  void _resetFields() {
    setState(() {
      weightController.text = "";
      heightController.text = "";
      _infoText = "Informe seus dados";
    });
  }

  void _calculate() {
    setState(() {
      if (weightController.text.isNotEmpty &&
          heightController.text.isNotEmpty) {
        double weight = double.parse(weightController.text);
        double height = double.parse(heightController.text) / 100;
        double imc = weight / (height * height);
        if (imc < 18.6) {
          _infoText = "Abaixo do peso (${imc.toStringAsPrecision(4)})";
        } else if (imc < 24.9) {
          _infoText = "Peso ideal (${imc.toStringAsPrecision(4)})";
        } else if (imc < 29.9) {
          _infoText = "Levemente acima do peso (${imc.toStringAsPrecision(4)})";
        } else if (imc < 34.9) {
          _infoText = "Obesidade grau I (${imc.toStringAsPrecision(4)})";
        } else if (imc < 39.9) {
          _infoText = "Obesidade grau II (${imc.toStringAsPrecision(4)})";
        } else {
          _infoText = "Obesidade grau III (${imc.toStringAsPrecision(4)})";
        }
      } else {
        _resetFields();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              _resetFields();
            },
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.person_outline,
                  color: Colors.green,
                  size: 150.0,
                )
              ],
            ),
            TextField(
              keyboardType: TextInputType.number,
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w500,
                color: Colors.green,
              ),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  labelText: "Peso (kg)",
                  labelStyle: TextStyle(color: Colors.green)),
              controller: weightController,
            ),
            TextField(
              keyboardType: TextInputType.number,
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w500,
                color: Colors.green,
              ),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  labelText: "Altura (cm)",
                  labelStyle: TextStyle(color: Colors.green)),
              controller: heightController,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: Container(
                  height: 60.0,
                  child: RaisedButton(
                    onPressed: () {
                      _calculate();
                    },
                    color: Colors.green,
                    child: Text(
                      "Calcular",
                      style: TextStyle(color: Colors.white, fontSize: 25.0),
                    ),
                  )),
            ),
            Text(
              "$_infoText",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.green, fontSize: 25.0),
            )
          ],
        ),
      ),
    );
  }
}
