import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay/pay.dart';

import '../../model/data/constant.dart';
import '../blocs/Auth/bloc/auth_bloc.dart';
import 'component/memberButton.dart';

const _paymentItems = [
  PaymentItem(
    label: 'Total',
    amount: '99.99',
    status: PaymentItemStatus.final_price,
  )
];

class Subscription extends StatefulWidget {
  const Subscription({super.key});

  @override
  State<Subscription> createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  void onApplePayResult(paymentResult) {
    // Send the resulting Apple Pay token to your server / PSP
  }

  void onGooglePayResult(paymentResult) {
    // Send the resulting Google Pay token to your server / PSP
  }
  @override
  void initState() {
    BlocProvider.of<AuthBloc>(context).add(LoadUserDetail());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                  'https://images.pexels.com/photos/1229356/pexels-photo-1229356.jpeg?cs=srgb&dl=pexels-anush-gorak-1229356.jpg&fm=jpg'),
              SizedBox(
                height: 350,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: points.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      ),
                      title: Text(points[index]),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (state is GetUserDetails)
                    if (state.isMember == false)
                      ApplePayButton(
                        paymentConfiguration:
                            PaymentConfiguration.fromJsonString(applepay),
                        paymentItems: _paymentItems,
                        style: ApplePayButtonStyle.black,
                        type: ApplePayButtonType.buy,
                        margin: const EdgeInsets.only(top: 15.0),
                        onPaymentResult: (s) {},
                        loadingIndicator: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                  if (state is GetUserDetails)
                    if (state.isMember == false)
                      GooglePayButton(
                        paymentConfiguration:
                            PaymentConfiguration.fromJsonString(gpay),
                        paymentItems: _paymentItems,
                        type: GooglePayButtonType.pay,
                        margin: const EdgeInsets.only(top: 15.0),
                        onPaymentResult: (s) {
                          print('My result' + s.toString());
                          showSubscriptionDialog(context, state);
                        },
                        loadingIndicator: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              if (state is GetUserDetails)
                if (state.isMember == false)
                  ElevatedButton(
                    onPressed: () {
                      showSubscriptionDialog(context, state);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,

                      elevation: 3, // Elevation of the button
                      padding: EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10), // Button padding
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(20), // Button border radius
                      ),
                    ),
                    child: Text(
                      'Click Me to become Member',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
            ],
          ),
        );
      },
    );
  }
}
