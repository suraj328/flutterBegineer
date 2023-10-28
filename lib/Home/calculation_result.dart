import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CalculationResult extends StatelessWidget {
  double totalAmount;
  double serviceCharge;
  CalculationResult(
      {super.key, required this.totalAmount, required this.serviceCharge});

  TextStyle headingTextStyle = const TextStyle(
    color: Colors.blue,
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.overline,
  );

  TextStyle bodyTextStyle = const TextStyle(
    color: Colors.black,
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
  );

  @override
  Widget build(BuildContext context) {
    double taxAmount = totalAmount * (13 / 100);
    double tdsAmount = (totalAmount * 1.5) / 100;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Entered Amount:\n${totalAmount.toStringAsFixed(2)}",
                style: bodyTextStyle,
              ),
              Text(
                "Service Charge Amount:\n${serviceCharge.toStringAsFixed(2)}",
                style: bodyTextStyle,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tax",
                    style: headingTextStyle,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Deducted Tax Amount:\n${taxAmount.toStringAsFixed(2)}",
                    style: bodyTextStyle,
                  ),
                  Text(
                    "Amount after deducting tax:\n${(totalAmount - taxAmount).toStringAsFixed(2)}",
                    style: bodyTextStyle,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tds",
                    style: headingTextStyle,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Deducted Tds Amount:\n$tdsAmount",
                    style: bodyTextStyle,
                  ),
                  Text(
                    "Amount after deducting tds:\n${(totalAmount - tdsAmount).toStringAsFixed(2)}",
                    style: bodyTextStyle,
                  ),
                ],
              ),
              Text(
                "Actual Amount:\n${(totalAmount - taxAmount - tdsAmount - serviceCharge).toStringAsFixed(2)}",
                style: bodyTextStyle,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    label: const Text("Back"),
                    icon: const Icon(Icons.arrow_back),
                  )
                ],
              )
            ]),
      ),
    );
  }
}
