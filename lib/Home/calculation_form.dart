import 'package:flutter/material.dart';
import 'package:tax_tds/Home/calculation_result.dart';

class CalculationForm extends StatefulWidget {
  const CalculationForm({super.key});

  @override
  State<CalculationForm> createState() => _CalculationFormState();
}

class _CalculationFormState extends State<CalculationForm> {
  TextStyle customTextFieldStyle = const TextStyle(
    color: Colors.black,
    fontSize: 18,
    fontWeight: FontWeight.normal,
  );

  var _totalAmountController = TextEditingController(text: "");
  var _serviceCharge = TextEditingController(text: "");

  @override
  void dispose() {
    _totalAmountController.dispose();
    _serviceCharge.dispose();
    super.dispose();
  }

  // defining boolValue
  bool isValidAmount = false;
  void _showCalculationResult() {
    double _totalAmount = 0;
    double _serviceChargeAmount = 0;
    try {
      _totalAmount = double.parse(_totalAmountController.text);
      _serviceChargeAmount = double.parse(_serviceCharge.text);
      isValidAmount = true;
    } catch (e) {
      isValidAmount = true;
    }

    if (_totalAmountController.text.trim().isEmpty ||
        _serviceCharge.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Invalid Input"),
          content: const Text("Fill Both Field"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: const Text("okay"))
          ],
        ),
      );
    } else {
      if (isValidAmount) {
        showModalBottomSheet(
            // isScrollControlled: true,
            // useSafeArea: true,
            context: context,
            builder: (ctx) => CalculationResult(
                  totalAmount: _totalAmount,
                  serviceCharge: _serviceChargeAmount,
                ));
      } else {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text("Invalid Input"),
            content: const Text("Make sure you have input valid data"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(ctx);
                  },
                  child: const Text("okay"))
            ],
          ),
        );
      }
    }
  }

  // clear data variable
  void _clearTextField() {
    setState(() {
      _totalAmountController = TextEditingController(text: "");
      _serviceCharge = TextEditingController(text: "");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Gautam Transport",
        ),
        actions: [
          IconButton(
              onPressed: _clearTextField, icon: const Icon(Icons.delete_sweep)),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            'assets/images/logo.png',
            width: 200,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
            child: Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: _totalAmountController,
                  keyboardType: TextInputType.number,
                  maxLength: 18,
                  decoration: InputDecoration(
                    label: Text(
                      "Enter Total Amount",
                      style: customTextFieldStyle,
                    ),
                  ),
                ),
                const SizedBox(height: 1),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: _serviceCharge,
                  maxLength: 18,
                  decoration: InputDecoration(
                    label: Text(
                      'Service Charge',
                      style: customTextFieldStyle,
                    ),
                  ),
                ),
                const SizedBox(height: 32.0),
                ElevatedButton(
                  onPressed: _showCalculationResult,
                  child: const Text('Calculate'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
