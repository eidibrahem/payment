import 'package:flutter/material.dart';
//import 'package:flutter_tap_payment/flutter_tap_payment.dart';
import 'package:payment/paypal_payment/payment.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        colorScheme: const ColorScheme.light(
                  primary: Color.fromARGB(255, 1, 133, 145),
                  background: Color.fromRGBO(255, 153, 0, 1)
                ),
    
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  var controllerPrice = TextEditingController();
  int price=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: controllerPrice,
                keyboardType: TextInputType.number,
                onFieldSubmitted: (value) {
                  print(value);
                },
                onTap: () {},
                onChanged: (value) {
                  price=int.parse(value);
                },
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'please enter  number';
                  }
                },
                maxLines: 1,
                decoration: const InputDecoration(
                  hintText: 'hintText',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black38),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black38),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                 GestureDetector(
                  onTap:(){

                    // if you wont to use tap  you shoud use webview_flutter: ^2.1.1
                    
                   /*  Navigator.push(context, MaterialPageRoute(builder: (context) 
                                       =>TapPayment(onSuccess: (Map success){
                                         print('**************************');
                                         print('success${success}');
                                        print('**************************');
                                       },onError:(err){
                                        print('**************************');
                                        print('eeeeeee${err}');
                                       } , 
                                       apiKey:'sk_test_XKokBfNWv6FIYuTMg5sLPjhJ' ,
                                       postUrl: 'https://tappayments.api-docs.io/2.0/response-codes/errors-list',
                                       redirectUrl: 'https://tappayments.api-docs.io/2.0/response-codes/errors-list',
                            paymentData: const {
                              "amount": 100,
                              "currency": "Egp",
                              "threeDSecure": true,
                              "save_card": false,
                              "description": "Test Description",
                              "statement_descriptor": "Sample",
                              "metadata": {"udf1": "test 1", "udf2": "test 2"},
                              "reference": {
                                "transaction": "txn_0001",
                                "order": "ord_0001"
                              },
                              "receipt": {"email": false, "sms": true},
                              "customer": {
                                "first_name": "test",
                                "middle_name": "test",
                                "last_name": "test",
                                "email": "test@test.com",
                                "phone": {
                                  "country_code": "965",
                                  "number": "4501554361595"
                                }
                              },
                              // "merchant": {"id": ""},
                              "source": {"id": "src_card"},
                              // "destinations": {
                              //   "destination": [
                              //     {"id": "480593777", "amount": 2, "currency": "KWD"},
                              //     {"id": "486374777", "amount": 3, "currency": "KWD"}
                              //   ]
                              // }
                            } ,
                            
                            )
                            
                            )); */

                  },
                   child: Container(
                    height: 130,
                    width: 130,
                    child: Image.asset('assets/images/tap.png', 
                    ),
                                 ),
                 ), 
                GestureDetector(
                  onTap: () {
                    
                  },
                  child: Container(
                    height: 70,
                    width: 130,
                    decoration: BoxDecoration(
                      border:Border.all(color:Color.fromARGB(255, 0, 24, 88),width: 2 ),
                      borderRadius: BorderRadius.circular(15),
                     ),
                    child: Image.asset('assets/images/checkout.png', 
                    ),
                  ),
                ),
                 GestureDetector(
                  onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) =>PaymentScreen(price) ,));
                  },
                  child: Container(
                    height: 130,
                    width: 130,
                    child: Image.asset('assets/images/paypal.png', 
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
