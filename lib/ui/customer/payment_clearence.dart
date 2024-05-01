import 'package:electro_khata/ui/customer/bottom_navbar.dart';
import 'package:electro_khata/widgets/round_btn.dart';
//import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../widgets/utils.dart';
import '../../widgets/payment_clearence_widget.dart';
import '../shopkeeper/add_customer.dart';

class PaymentClearencePage extends StatefulWidget {
  const PaymentClearencePage({super.key});

  @override
  State<PaymentClearencePage> createState() => _PaymentClearencePageState();
}

class _PaymentClearencePageState extends State<PaymentClearencePage> {
  final databaseRef = firestore.collection('ShopKeeperBillPaid');
  bool loading = false;
  final _formKey = GlobalKey<FormState>();

  final newCustomerNameController = TextEditingController();
  final customerAmountController = TextEditingController();
  final shopAccountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        elevation: 4,
        shadowColor: Colors.orange,
        backgroundColor: Colors.white,
        title: const Text(
          'Transfer',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Name';
                      }
                      return null;
                    },
                    controller: newCustomerNameController,
                    decoration: InputDecoration(
                      hintText: 'Shop Name',
                      prefixIcon: const Icon(Icons.person),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(width: 1, color: Colors.grey)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(width: 2, color: Colors.orange)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(width: 1, color: Colors.red)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(width: 2, color: Colors.orange)),
                    ),
                    keyboardType: TextInputType.name,
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Account Number';
                      }
                      return null;
                    },
                    controller: shopAccountController,
                    decoration: InputDecoration(
                      hintText: 'Shop Account Number',
                      prefixIcon: const Icon(Icons.account_balance_rounded),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(width: 1, color: Colors.grey)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(width: 2, color: Colors.orange)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(width: 1, color: Colors.red)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(width: 2, color: Colors.orange)),
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Amount';
                      }
                      return null;
                    },
                    controller: customerAmountController,
                    decoration: InputDecoration(
                      hintText: 'Amount',
                      prefixIcon: const Text(
                        'RS',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            height: 2.5,
                            color: Colors.grey),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(width: 1, color: Colors.grey)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(width: 2, color: Colors.orange)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(width: 1, color: Colors.red)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(width: 2, color: Colors.orange)),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Select Bank:',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      DropdownButtonWidget(),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.06,
                  ),
                  RoundBTN(
                      title: 'Save',
                      loading: loading,
                      ontap: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            loading = true;
                          });
                          databaseRef.add({
                            'Shop Name':
                                newCustomerNameController.text.toString(),
                            'Shop Account':
                                shopAccountController.text.toString(),
                            'Amount': customerAmountController.text.toString()
                          }).then((value) {
                            Utils().toastMessage('Saved Successfully');
                            setState(() {
                              loading = false;
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const UserBottomNavBar()));
                          }).onError((error, stackTrace) {
                            Utils().toastMessage(error.toString());
                            setState(() {
                              loading = false;
                            });
                          });
                        }
                      }),
                ],
              ))),
    );
  }
}

//   Future<void> PaymentSent() async {
//     return showDialog<void>(
//       context: context,
//       barrierDismissible: false, // user must tap button!
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Payment'),
//           content: SingleChildScrollView(
//             child: ListBody(
//               children: const <Widget>[
//                 Icon(Icons.check_circle, color: Colors.green,size: 50,),
//                 SizedBox(height: 10,),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 30),
//                   child: Text('Payment Sent Successfully'),
//                 ),
//
//
//               ],
//             ),
//           ),
//           actions: <Widget>[
//             TextButton(
//               child: const Text('Okay'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
