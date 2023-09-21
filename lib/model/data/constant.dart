import '../../views/screens/onboarding_page.dart';
import 'onboarding.dart';

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
final List<String> points = [
  'Access 1000+ online video classes',
  '6000+ activity animation',
  'Track 300+ body metrics',
  'Reduce stress with mindfulness content',
  'Unlimited custom workout plans',
];

enum Auth { LOGIN, SIGNUP }

String authToken =
    'key=AAAAVV-pyZ4:APA91bELWsE83_Sr2qxktwDgmtiBuj6Kthi0DO758Qx7bbrEyk1Hhr0qEYtJCQYs85X3f_0n0MptK36DoiPRxZS8XeeBJ8Jc97oHPEqQk5kvD6qmMvo2bgsv2ZzDtKQuGXsn_25owMTP';

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
  'Omprove Well-being',
  'Improve Performance',
  'Rehabilitation',
  'Get Fit'
];
