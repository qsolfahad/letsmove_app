import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letsmove_app/model/data/constant.dart';
import 'package:pay/pay.dart';

import '../../routes/routes_name.dart';
import '../blocs/Auth/bloc/auth_bloc.dart';
import '../blocs/members/bloc/member_bloc.dart';

class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({super.key});

  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  List<bool> selected = List.generate(plans.length, (index) => false);
  var selectedPlan = [];
  @override
  void initState() {
    selected[0] = true;
    selectedPlan.add(plans[0]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: SafeArea(
                    child: Stack(
                      children: <Widget>[
                        ClipRect(
                          child: BackdropFilter(
                              filter:
                                  ImageFilter.blur(sigmaX: 50.0, sigmaY: 40.0),
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200
                                          .withOpacity(0.5)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: IconButton(
                                            icon: const Icon(Icons.arrow_back),
                                            onPressed: () =>
                                                Navigator.of(context).pop(),
                                          ),
                                        ),
                                        const Center(
                                          child: Text(
                                            'Change your life for less \n than a coffee per week',
                                            style: TextStyle(
                                                color: Colors.black38,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                1.7,
                                            child: ListView.builder(
                                                itemCount: plans.length,
                                                itemBuilder: (context, index) {
                                                  return GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        selectedPlan.clear();
                                                        selected =
                                                            List.generate(
                                                                plans.length,
                                                                (index) =>
                                                                    false);
                                                        selected[index] =
                                                            !selected[index];
                                                        selectedPlan
                                                            .add(plans[index]);
                                                      });
                                                    },
                                                    child: Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              bottom: 20),
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      decoration: BoxDecoration(
                                                        border: (selected[
                                                                index])
                                                            ? Border.all(
                                                                color: Colors
                                                                    .black, // Border color
                                                                width:
                                                                    8.0, // Border width
                                                              )
                                                            : const Border(),
                                                        gradient:
                                                            const LinearGradient(
                                                          begin:
                                                              Alignment.topLeft,
                                                          end: Alignment
                                                              .bottomRight,
                                                          colors: [
                                                            Colors.blue,
                                                            Colors.black
                                                          ],
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15.0),
                                                      ),
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(16),
                                                        child: Column(
                                                          children: [
                                                            if (index == 0)
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: const [
                                                                  Icon(
                                                                    Icons.star,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                  Center(
                                                                    child: Text(
                                                                      'Most Popular',
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            16.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            const SizedBox(
                                                              height: 20,
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  plans[index][
                                                                          'title']
                                                                      .toString(),
                                                                  style:
                                                                      const TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        16.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                                const Spacer(),
                                                                Text(
                                                                  plans[index][
                                                                          'price']
                                                                      .toString(),
                                                                  style:
                                                                      const TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        16.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  '${plans[index]['weekPrice']} per week',
                                                                  style:
                                                                      const TextStyle(
                                                                    color: Colors
                                                                        .grey,
                                                                    fontSize:
                                                                        14.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                                const Spacer(),
                                                                Text(
                                                                  'Save ${plans[index]['save']}',
                                                                  style:
                                                                      const TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        16.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                })),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                if (state is GetUserDetails)
                                                  if (state.isMember == false)
                                                    ApplePayButton(
                                                      paymentConfiguration:
                                                          PaymentConfiguration
                                                              .fromJsonString(
                                                                  applepay),
                                                      paymentItems:
                                                          paymentItems,
                                                      style: ApplePayButtonStyle
                                                          .black,
                                                      type: ApplePayButtonType
                                                          .buy,
                                                      margin:
                                                          const EdgeInsets.only(
                                                              top: 15.0),
                                                      onPaymentResult: (s) {
                                                        var text = selectedPlan[
                                                                0]['title'] +
                                                            ' Subscription: ' +
                                                            selectedPlan[0]
                                                                ['price'];
                                                        BlocProvider.of<
                                                                    AuthBloc>(
                                                                context)
                                                            .add(UpdateMember(
                                                                state.id!,
                                                                text,
                                                                false));
                                                        Future.delayed(
                                                            const Duration(
                                                                seconds: 3),
                                                            () {
                                                          Navigator
                                                              .pushNamedAndRemoveUntil(
                                                                  context,
                                                                  pending,
                                                                  (route) =>
                                                                      false);
                                                        });
                                                      },
                                                      loadingIndicator:
                                                          const Center(
                                                        child:
                                                            CircularProgressIndicator(),
                                                      ),
                                                    ),
                                                if (state is GetUserDetails)
                                                  if (state.isMember == false)
                                                    GooglePayButton(
                                                      paymentConfiguration:
                                                          PaymentConfiguration
                                                              .fromJsonString(
                                                                  gpay),
                                                      paymentItems:
                                                          paymentItems,
                                                      type: GooglePayButtonType
                                                          .pay,
                                                      margin:
                                                          const EdgeInsets.only(
                                                              top: 15.0),
                                                      onPaymentResult: (s) {
                                                        var text = selectedPlan[
                                                                0]['title'] +
                                                            ' Subscription: ' +
                                                            selectedPlan[0]
                                                                ['price'];
                                                        BlocProvider.of<
                                                                    AuthBloc>(
                                                                context)
                                                            .add(UpdateMember(
                                                                state.id!,
                                                                text,
                                                                false));
                                                        Future.delayed(
                                                            const Duration(
                                                                seconds: 3),
                                                            () {
                                                          BlocProvider.of<
                                                                      MemberBloc>(
                                                                  context)
                                                              .add(AddMember(
                                                                  state.id!));
                                                          Navigator
                                                              .pushNamedAndRemoveUntil(
                                                                  context,
                                                                  home,
                                                                  (route) =>
                                                                      false);
                                                        });
                                                      },
                                                      loadingIndicator:
                                                          const Center(
                                                        child:
                                                            CircularProgressIndicator(),
                                                      ),
                                                    ),
                                              ],
                                            ),
                                            if (state is GetUserDetails)
                                              if (state.isMember == false)
                                                ElevatedButton(
                                                  onPressed: () {
                                                    var text = selectedPlan[0]
                                                            ['title'] +
                                                        ' Subscription: ' +
                                                        selectedPlan[0]
                                                            ['price'];
                                                    BlocProvider.of<AuthBloc>(
                                                            context)
                                                        .add(UpdateMember(
                                                            state.id!,
                                                            text,
                                                            true));
                                                    Future.delayed(
                                                        const Duration(
                                                            seconds: 1), () {
                                                      Navigator
                                                          .pushNamedAndRemoveUntil(
                                                              context,
                                                              pending,
                                                              (route) => false);
                                                    });
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.blue,

                                                    elevation:
                                                        3, // Elevation of the button
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 20,
                                                        vertical:
                                                            10), // Button padding
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20), // Button border radius
                                                    ),
                                                  ),
                                                  child: const Text(
                                                    'Cash Handler',
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ))),
                        ),
                      ],
                    ),
                  )),
            ));
      },
    );
  }
}
