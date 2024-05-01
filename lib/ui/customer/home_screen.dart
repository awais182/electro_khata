import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electro_khata/ui/auth/customer/Signup_screen.dart';
import 'package:electro_khata/ui/customer/payment%20method.dart';
//import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final FirebaseFirestore firestore = FirebaseFirestore.instance;
final databaseRef = firestore.collection('ShopKeeperBillPaid');

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
            left: width * 0.03, right: width * 0.03, top: height * 0.04),
        child: Column(
          children: [
            Material(
              elevation: 10,
              borderRadius: BorderRadius.circular(20),
              color: Colors.orange,
              shadowColor: Colors.orange,
              child: Container(
                  height: height * 0.16,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.orange,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  customerNameController.text,
                                  style: const TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  height: height * 0.024,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const PaymentPage()));
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: height * 0.035,
                                    width: width * 0.25,
                                    decoration: BoxDecoration(
                                      color: Colors.white70,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const Text('Pay Now'),
                                  ),
                                ),
                              ],
                            ),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '25,000',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'Pending Dues',
                                  style: TextStyle(
                                      color: Colors.black45,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  )),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Padding(
              padding: EdgeInsets.only(right: width * 0.5),
              child: const Text(
                'Pending Dues',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            Expanded(
                child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: double.infinity,
                    height: 600,
                    decoration: const BoxDecoration(
                      // color: Colors.orangeAccent[100],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                      stream: databaseRef.snapshots(),
                      builder: (context,
                          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                              snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: Text('Loading...'),
                          );
                        }
                        if (snapshot.hasError) {
                          return const Center(
                            child: Text('An error occurred.'),
                          );
                        }
                        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                          return const Center(
                            child: Text('No Record Available Yet !!!'),
                          );
                        }

                        final List<DocumentSnapshot<Map<String, dynamic>>>
                            documents = snapshot.data!.docs;

                        return ListView.builder(
                          itemCount: documents.length,
                          itemBuilder: (context, index) {
                            final Map<String, dynamic> data =
                                documents[index].data() as Map<String, dynamic>;

                            return ListTile(
                              leading: const CircleAvatar(
                                child: Icon(Icons.person),
                              ),
                              title: Text(
                                data['Shop Name'],
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              trailing: Text(
                                data['Amount'],
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.green[300],
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ))),
          ],
        ),
        // ],
      ),
    );
    // );
  }
}
