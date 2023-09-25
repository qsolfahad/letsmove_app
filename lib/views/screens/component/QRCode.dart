import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:qr_flutter/qr_flutter.dart';

Widget qrCard(context, data) {
  return Center(
    child: SizedBox(
      height: 360,
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Conditional.single(
            context: context,
            conditionBuilder: (BuildContext context) => data != "",
            widgetBuilder: (BuildContext context) => _shareQR(data),
            fallbackBuilder: (BuildContext context) => _fallback(),
          ),
        ),
      ),
    ),
  );
}

Widget _shareQR(data) {
  return Container(
    child: Column(
      children: [
        QrImage(
          data: data,
          version: QrVersions.auto,
          size: 200.0,
        ),
      ],
    ),
  );
}

Widget _fallback() {
  return Container(
    child: Column(
      children: [
        IconButton(
          icon: Image.asset('images/qrcode.png'),
          iconSize: 190,
          onPressed: () {},
        ),
        const Text(
          "Enter the details below to\n generate a Qr code",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black38,
          ),
        )
      ],
    ),
  );
}
