import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

// import 'details.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  // final cref = FirebaseDatabase.instance.ref('Customer');

// final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final databaseRef =
      FirebaseFirestore.instance.collection('ShopKeeperBillPaid');
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 4,
        shadowColor: Colors.orange,
        backgroundColor: Colors.white,
        title: const Text(
          'History',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: double.infinity,
                  height: 700,
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
                      if (snapshot.connectionState == ConnectionState.waiting) {
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
          // ]),
        ],
      ),
    );
  }
}
