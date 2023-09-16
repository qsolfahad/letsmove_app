import 'package:flutter/material.dart';
import 'package:flutter_openmoney/flutter_openmoney.dart';
import 'package:fluttertoast/fluttertoast.dart';


class CashHandler extends StatefulWidget {
  const CashHandler({Key? key}) : super(key: key);

  @override
  State<CashHandler> createState() => _CashHandlerState();
}

class _CashHandlerState extends State<CashHandler> {
  late final FlutterOpenmoney flutterOpenmoney;

  @override
  void initState() {
    super.initState();

    flutterOpenmoney = FlutterOpenmoney();
    flutterOpenmoney.on(
      FlutterOpenmoney.eventPaymentSuccess,
      _handlePaymentSuccess,
    );
    flutterOpenmoney.on(
      FlutterOpenmoney.eventPaymentError,
      _handlePaymentError,
    );
  }

  void _initPayment() async {
    /// get from openmoney dashboard
    const accessKey = 'xxxxxxxx-xxxx-xxxx-xxxx-cfd6fc92bd19';

    /// Generated using openmoney create token api in server
    /// refer https://docs.bankopen.com/reference/generate-token
    const paymentToken = 'sb_pt_BUFJpEalhWmO6cm';
    final options = PaymentOptions(accessKey, paymentToken);

    try {
      flutterOpenmoney.initPayment(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
      msg: 'SUCCESS: ${response.paymentId}',
      toastLength: Toast.LENGTH_LONG,
    );
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
      msg: 'ERROR: ${response.code} - ${response.message}',
      toastLength: Toast.LENGTH_LONG,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('FlutterOpenmoney Plugin example app'),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: _initPayment,
                child: const Text('initPayment'),
              )
            ],
          ),
        ),
      ),
    );
  }
}