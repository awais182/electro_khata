// import 'package:electro_khata/ui/auth/shopkeeper/Signup_screen.dart';
// ignore_for_file: file_names

import 'package:electro_khata/ui/customer/payment_clearence.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 4,
        shadowColor: Colors.orange,
        backgroundColor: Colors.white,
        title: const Text(
          'Payment',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PaymentClearencePage()));
              },
              child: Container(
                alignment: Alignment.center,
                height: height * 0.05,
                width: width * 0.6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: 0.5),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.133),
                  child: Row(
                    children: [
                      Image.asset(
                        'images/Jazzcash.png',
                      ),
                      SizedBox(
                        width: width * 0.01,
                      ),
                      const Text(
                        'Jazzcash',
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PaymentClearencePage()));
              },
              child: Container(
                alignment: Alignment.center,
                height: height * 0.05,
                width: width * 0.6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: 0.5),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.133),
                  child: Row(
                    children: [
                      Image.asset(
                        'images/Easypaisa.png',
                        height: 25,
                      ),
                      SizedBox(
                        width: width * 0.04,
                      ),
                      const Text(
                        'EasyPaisa',
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
//
// void JazzBottomSheet(context) {
//   showModalBottomSheet(
//       context: context,
//       builder: (context) {
//         var height = MediaQuery.of(context).size.height;
//         var width = MediaQuery.of(context).size.width;
//         return Container(
//             decoration: BoxDecoration(
//               color: Colors.orange[50],
//             ),
//             height: height * 0.2,
//             width: double.infinity,
//             child: Padding(
//               padding: const EdgeInsets.all(20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   const Text(
//                     'JazzCash',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w900,
//                     ),
//                   ),
//                   SizedBox(
//                     height: height * 0.015,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       TextButton(
//                           onPressed: () {},
//                           child: const Text(
//                             'Account Title:',
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           )),
//                        Text(
//                         shopNameController.text,
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 16,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       TextButton(
//                           onPressed: () {},
//                           child: const Text(
//                             'Account Number:',
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           )),
//                        Text(
//                         shopPhoneController.text,
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 16,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ));
//       });
// }


// void EasyPaisaBottomSheet(context) {
//   showModalBottomSheet(
//       context: context,
//       builder: (context) {
//         var height = MediaQuery.of(context).size.height;
//         var width = MediaQuery.of(context).size.width;
//         return Container(
//             decoration: BoxDecoration(
//               color: Colors.orange[50],
//             ),
//             height: height * 0.2,
//             width: double.infinity,
//             child: Padding(
//               padding: const EdgeInsets.all(20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   const Text(
//                     'EasyPaisa',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w900,
//                     ),
//                   ),
//                   SizedBox(
//                     height: height * 0.015,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       TextButton(
//                           onPressed: () {},
//                           child: const Text(
//                             'Account Title:',
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           )),
//                       const Text(
//                         'Account Name',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 16,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       TextButton(
//                           onPressed: () {},
//                           child: const Text(
//                             'Account Number:',
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           )),
//                       const Text(
//                         '030xxxxxxxx',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 16,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ));
//       });
// }
