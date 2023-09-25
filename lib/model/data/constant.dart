import 'package:pay/pay.dart';
import 'package:flutter/material.dart';
import '../../views/screens/component/cardsList.dart';
import '../../views/screens/difficultyLevel.dart';
import '../../views/screens/onboarding_page.dart';
import '../../views/screens/paySubscription.dart';
import '../location.dart';
import '../onboarding.dart';
import '../order.dart';

Color kAppPrimaryColor = Colors.grey.shade200;
Color kWhite = Colors.white;
Color kLightBlack = Colors.black.withOpacity(0.075);
Color mCC = Colors.green.withOpacity(0.65);
Color fCL = Colors.grey.shade600;

IconData twitter = const IconData(0xe900, fontFamily: "CustomIcons");
IconData facebook = const IconData(0xe901, fontFamily: "CustomIcons");
IconData googlePlus = const IconData(0xe902, fontFamily: "CustomIcons");
IconData linkedin = const IconData(0xe903, fontFamily: "CustomIcons");

const kSpacingUnit = 10;

const kTitleTextStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w600,
);

BoxDecoration avatarDecoration = BoxDecoration(
  shape: BoxShape.circle,
  color: kAppPrimaryColor,
);

String applepay = '''{
  "provider": "apple_pay",
  "data": {
    "merchantIdentifier": "merchant.com.sams.fish",
    "displayName": "Sam's Fish",
    "merchantCapabilities": ["3DS", "debit", "credit"],
    "supportedNetworks": ["amex", "visa", "discover", "masterCard"],
    "countryCode": "US",
    "currencyCode": "USD",
    "requiredBillingContactFields": ["post"],
    "requiredShippingContactFields": ["post", "phone", "email", "name"],
    "shippingMethods": [
      {
        "amount": "0.00",
        "detail": "Available within an hour",
        "identifier": "in_store_pickup",
        "label": "In-Store Pickup"
      },
      {
        "amount": "4.99",
        "detail": "5-8 Business Days",
        "identifier": "flat_rate_shipping_id_2",
        "label": "UPS Ground"
      },
      {
        "amount": "29.99",
        "detail": "1-3 Business Days",
        "identifier": "flat_rate_shipping_id_1",
        "label": "FedEx Priority Mail"
      }
    ]
  }
}''';
final List<Map> SocietyLists = [
  {
    "name": "Save Trees, Save Earth",
    "location": "Lane - 7",
    "type": "Not a Member",
    "logoText":
        "https://cdn.pixabay.com/photo/2017/03/16/21/18/logo-2150297_960_720.png"
  },
  {
    "name": "Music and Dance Club",
    "location": "Auditorium, Lane - 9",
    "type": "Not a Member",
    "logoText":
        "https://cdn.pixabay.com/photo/2017/01/31/13/14/animal-2023924_960_720.png"
  },
  {
    "name": "Swacch Bharat Society",
    "location": "Lane - 5",
    "type": "Member",
    "logoText":
        "https://cdn.pixabay.com/photo/2016/06/09/18/36/logo-1446293_960_720.png"
  },
  {
    "name": "Astronomy Club",
    "location": "Residential park, Lane - 2",
    "type": "Not a Member",
    "logoText":
        "https://cdn.pixabay.com/photo/2017/01/13/01/22/rocket-1976107_960_720.png"
  },
  {
    "name": "Business Society",
    "location": "Activity Center, Lane - 5",
    "type": "Member",
    "logoText":
        "https://cdn.pixabay.com/photo/2017/03/16/21/18/logo-2150297_960_720.png"
  },
  {
    "name": "Handicraft Club",
    "location": "Art Center, Lane - 8",
    "type": "Not a Member",
    "logoText":
        "https://cdn.pixabay.com/photo/2017/01/31/13/14/animal-2023924_960_720.png"
  },
];
String gpay = '''{
    "provider": "google_pay",
    "data": {
      "environment": "TEST",
      "apiVersion": 2,
      "apiVersionMinor": 0,
      "allowedPaymentMethods": [
        {
          "type": "CARD",
          "tokenizationSpecification": {
            "type": "PAYMENT_GATEWAY",
            "parameters": {
              "gateway": "example",
              "gatewayMerchantId": "gatewayMerchantId"
            }
          },
          "parameters": {
            "allowedCardNetworks": ["VISA", "MASTERCARD"],
            "allowedAuthMethods": ["PAN_ONLY", "CRYPTOGRAM_3DS"],
            "billingAddressRequired": true,
            "billingAddressParameters": {
              "format": "FULL",
              "phoneNumberRequired": true
            }
          }
        }
      ],
      "merchantInfo": {
        "merchantId": "01234567890123456789",
        "merchantName": "Example Merchant Name"
      },
      "transactionInfo": {
        "countryCode": "US",
        "currencyCode": "USD"
      }
    }
  }''';

class Constants {
  static const Color primaryColor = Colors.blue;
  static const Color scaffoldBackgroundColor = Color.fromRGBO(245, 247, 249, 1);
}

final List<String> points = [
  'Access 1000+ online video classes',
  '6000+ activity animation',
  'Track 300+ body metrics',
  'Reduce stress with mindfulness content',
  'Unlimited custom workout plans',
];
final plans = [
  {
    'title': '12 months',
    'price': 'Rs 8200.00',
    'weekPrice': '157.69',
    'save': '59%'
  },
  {
    'title': '3 months',
    'price': 'Rs 3300.00',
    'weekPrice': '253.85',
    'save': '33%'
  },
  {
    'title': '1 months',
    'price': 'Rs 1650.00',
    'weekPrice': '380.77',
    'save': '0'
  },
];
const paymentItems = [
  PaymentItem(
    label: 'Total',
    amount: '99.99',
    status: PaymentItemStatus.final_price,
  )
];

enum Auth { LOGIN, SIGNUP }

List<String> images1 = [
  "https://st4.depositphotos.com/1643295/24751/i/600/depositphotos_247513910-stock-photo-portrait-serious-mature-indian-businessman.jpg",
  "https://www.mckinsey.com/~/media/mckinsey/locations/asia/india/careers/our%20people/raman/india_careers_raman-sharma_quote-profile_1536x1152.jpg?mw=1536&car=48:59&cpx=Left&cpy=Top"
      "https://us.123rf.com/450wm/michaeljung/michaeljung1209/michaeljung120900015/15041949-attractive-female-white-collar-worker-in-office.jpg?ver=6",
  "https://www.manchester.ac.uk/study/international/country-specific-information/india/India-profile-video-pic-070519-edited.jpg"
];
List<String> images4 = [
  "https://st4.depositphotos.com/1643295/24751/i/600/depositphotos_247513910-stock-photo-portrait-serious-mature-indian-businessman.jpg",
  "https://www.mckinsey.com/~/media/mckinsey/locations/asia/india/careers/our%20people/raman/india_careers_raman-sharma_quote-profile_1536x1152.jpg?mw=1536&car=48:59&cpx=Left&cpy=Top"
      "https://us.123rf.com/450wm/michaeljung/michaeljung1209/michaeljung120900015/15041949-attractive-female-white-collar-worker-in-office.jpg?ver=6",
  "https://www.manchester.ac.uk/study/international/country-specific-information/india/India-profile-video-pic-070519-edited.jpg"
];
List<String> images5 = [
  "https://www.mckinsey.com/~/media/mckinsey/locations/asia/india/careers/our%20people/raman/india_careers_raman-sharma_quote-profile_1536x1152.jpg?mw=1536&car=48:59&cpx=Left&cpy=Top",
  "https://us.123rf.com/450wm/michaeljung/michaeljung1209/michaeljung120900015/15041949-attractive-female-white-collar-worker-in-office.jpg?ver=6",
  "https://www.manchester.ac.uk/study/international/country-specific-information/india/India-profile-video-pic-070519-edited.jpg"
];
List<String> images6 = [
  "https://images.unsplash.com/photo-1534235187448-833893dfe3e0?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=687&q=80",
  "https://us.123rf.com/450wm/michaeljung/michaeljung1209/michaeljung120900015/15041949-attractive-female-white-collar-worker-in-office.jpg?ver=6",
  "https://images.pexels.com/photos/4593618/pexels-photo-4593618.jpeg?cs=srgb&dl=pexels-nila-racigan-4593618.jpg&fm=jpg",
];
final List<DifficultyLevel> difficultyLevels = [
  DifficultyLevel('Easy', 'Suitable for beginners'),
  DifficultyLevel('Intermediate', 'Some experience required'),
  DifficultyLevel('Advanced', 'Challenging for experts'),
  DifficultyLevel('Expert', 'Only for the very experienced'),
];
List? data;
DateTime now = DateTime.now();
DateTime pickedDate = DateTime.now();
String? dateText;

String jsonData =
    '{"01-08-2021":[{"from":"6:00pm","to":"7:00pm","location":"Community hall","title":"Party planning meeting"},'
    '{"from":"7:30pm","to":"8:00pm","location":"Apt 13, floor 3","title":"Book club meeting"},'
    '{"from":"8:30pm","to":"9:00pm","location":"Community hall","title":"Covid-19 safety meeting"}],'
    '"02-08-2021":[{"from":"8:00pm","to":"7:00pm","location":"Apt 20, floor 4","title":"Birthday Party"},'
    '{"from":"9:30pm","to":"8:00pm","location":"Apt 13, floor 3","title":"Weekly meeting"}],'
    '"03-08-2021":[{"from":"8:00pm","to":"7:00pm","location":"Apt 20, floor 4","title":"Current Events"},'
    '{"from":"9:30pm","to":"8:00pm","location":"Apt 13, floor 3","title":"Arts club meeting"}]}';
showDialogbox(cntxt, state, auth) {
  showDialog(
    context: cntxt,
    builder: (ctx) => AlertDialog(
      title: (auth == Auth.LOGIN)
          ? const Text("Error logging in")
          : const Text("Error Signing up"),
      content: Text(state.value.toString()),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: const Text("okay")),
      ],
    ),
  );
}

List<Locations> locations = [
  //to-do
  Locations(
    address: "Gym",
    color: Colors.deepOrange,
    state: "Active",
    imagePath: "images/gym.png",
  ),
  Locations(
    address: "Pool",
    color: Colors.blue,
    state: "Active",
    imagePath: "images/pool.png",
  ),
  Locations(
    address: "Nightclub",
    color: const Color.fromRGBO(89, 69, 199, 1),
    state: "Active",
    imagePath: "images/party.png",
  ),
  Locations(
    address: "Shopping Mall",
    color: Colors.amber.shade500,
    state: "Expired!",
    imagePath: "images/shopping.png",
  ),
  Locations(
    address: "Park",
    color: Colors.green,
    state: "Expired!",
    imagePath: "images/park.png",
  ),
];
List<Order> orders = [
  Order(
    id: 507,
    deliveryAddress: "New Times Square",
    arrivalDate: "7:46 AM",
    placedDate: "01-08-2021",
    status: OrderStatus.DELIVERING,
  ),
  Order(
    id: 536,
    deliveryAddress: "Victoria Square",
    arrivalDate: "6:45 PM",
    placedDate: "31-07-2021",
    status: OrderStatus.PICKING_UP,
  )
];
final TextStyle dropdownMenuItem =
    const TextStyle(color: Colors.black, fontSize: 18);

final primary = Colors.indigo;
final secondary = Colors.deepOrange;

String authToken =
    'key=AAAAVV-pyZ4:APA91bELWsE83_Sr2qxktwDgmtiBuj6Kthi0DO758Qx7bbrEyk1Hhr0qEYtJCQYs85X3f_0n0MptK36DoiPRxZS8XeeBJ8Jc97oHPEqQk5kvD6qmMvo2bgsv2ZzDtKQuGXsn_25owMTP';
final List<dynamic> pages = [
  CardList(
      title: "What is your main goal?",
      items: List.generate(6, (index) => {'data$index': 'Item is $index'})),
  const DifficultyLevelsStepIndicator(title: "What is your fitness level?"),
  const Subscription(title: "Get fit. Start free."),
];
var introClass = [
  OnboardingPage(
    data: OnboardingData(
      title: 'Personal Trainers',
      description:
          'Gets access to experienced personal trainers who will guide you on your fitness journey.',
      image: 'assets/image/intro1.jpeg',
    ),
  ),
  OnboardingPage(
    data: OnboardingData(
      title: 'Family-Friendly Environment',
      description:
          'Our gym is family-friendly, so you can work out while your kids enjoy our play area.',
      image: 'assets/image/intro2.jpeg',
    ),
  ),
  OnboardingPage(
    data: OnboardingData(
      title: 'Fitness Programs',
      description:
          'Explore a variety of fitness programs designed to help you achieve your fitness goals.',
      image: 'assets/image/intro3.jpeg',
    ),
  ),
];
var cardOption = [
  'Lose Weight',
  'Build Muscle',
  'Improve Well-being',
  'Improve Performance',
  'Rehabilitation',
  'Get Fit'
];
