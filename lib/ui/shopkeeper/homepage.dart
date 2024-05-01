// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electro_khata/ui/auth/shopkeeper/Signup_screen.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'add_customer.dart';

class ShopHomePage extends StatefulWidget {
  const ShopHomePage({super.key});

  @override
  State<ShopHomePage> createState() => _ShopHomePageState();
}

// final cref = FirebaseDatabase.instance.ref('Customer');

final FirebaseFirestore firestore = FirebaseFirestore.instance;
final databaseRef = firestore.collection('ShopKeeperBill');

class _ShopHomePageState extends State<ShopHomePage> {
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
                                  shopNameController.text,
                                  style: const TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: height * 0.021,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const AddProduct()));
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: height * 0.038,
                                    width: width * 0.28,
                                    decoration: BoxDecoration(
                                      color: Colors.white70,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const Text(
                                      'Add Customer',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Balance:',
                                  style: TextStyle(
                                      color: Colors.black45,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  '16,000',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w500),
                                ),
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
              padding: EdgeInsets.only(right: width * 0.75),
              child: const Text(
                'Details',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
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
                                data['Customer Name'],
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
      ),
    );
  }
}
