import 'package:active_ecommerce_flutter/helpers/shared_value_helper.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  var _razorpay = Razorpay();
  TextEditingController amountController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    print('success ${response.paymentId}');
    print(response.orderId);
    print(response.signature);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    print('Payment failed');
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 40,
              width: double.infinity,
              child: TextField(
                controller: amountController,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  var options = {
                    'key': 'rzp_test_xlulO3L7kqjqUy',
                    'amount': 50000, //in the smallest currency sub-unit.
                    'name': 'Acme Corp.',
                    // 'order_id':
                    //     'order_EMBFqjDHEEn80l', // Generate order_id using Orders API
                    'description': 'Fine T-Shirt',
                    'timeout': 300, // in seconds
                    'prefill': {
                      'contact': user_phone.$.toString(),
                      'email': 'gaurav.kumar@example.com'
                    }
                  };
                  _razorpay.open(options);
                },
                child: Text('ok')),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _razorpay.clear();
    super.dispose();
  }
}
