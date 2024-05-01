import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:electro_khata/ui/customer/home_screen.dart';
import 'package:electro_khata/widgets/utils.dart';
import 'package:electro_khata/widgets/round_btn.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'bottom_navbar.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

final FirebaseFirestore firestore = FirebaseFirestore.instance;
final databaseRef = firestore.collection('ShopKeeperBill');
// final CollectionReference subCollectionRef =
//     databaseRef.collection('ShopKeeperBill');

bool loading = false;
final _formKey = GlobalKey<FormState>();
final addNamecontroler = TextEditingController();
final addProductController = TextEditingController();
final addAmountController = TextEditingController();

class _AddProductState extends State<AddProduct> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 4,
        shadowColor: Colors.orange,
        backgroundColor: Colors.white,
        title: const Text(
          'Add Customer',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SafeArea(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Enter Details',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Form(
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
                        controller: addNamecontroler,
                        decoration: InputDecoration(
                          hintText: 'Customer Name',
                          prefixIcon: const Icon(Icons.business),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  width: 1, color: Colors.grey)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  width: 2, color: Colors.orange)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  width: 1, color: Colors.red)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  width: 2, color: Colors.orange)),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Write Something';
                          }
                          return null;
                        },
                        controller: addProductController,
                        decoration: InputDecoration(
                          hintText: 'Product Details',
                          prefixIcon: const Icon(Icons.shopping_cart),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  width: 1, color: Colors.grey)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  width: 2, color: Colors.orange)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  width: 1, color: Colors.red)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  width: 2, color: Colors.orange)),
                        ),
                        keyboardType: TextInputType.multiline,
                        minLines: 1,
                        maxLines: 10,
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
                        controller: addAmountController,
                        decoration: InputDecoration(
                          hintText: 'Total Amount',
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
                              borderSide: const BorderSide(
                                  width: 1, color: Colors.grey)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  width: 2, color: Colors.orange)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  width: 1, color: Colors.red)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  width: 2, color: Colors.orange)),
                        ),
                        keyboardType: TextInputType.number,
                        minLines: 1,
                        maxLines: 10,
                      ),
                      SizedBox(
                        height: height * 0.05,
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
                                'Customer Name':
                                    addNamecontroler.text.toString(),
                                'Details': addProductController.text.toString(),
                                'Amount': addAmountController.text.toString(),
                                // 'id' :
                              }).then((value) {
                                Utils().toastMessage('Saved Successfully');
                                setState(() {
                                  loading = false;
                                });
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ShopBottomNavBar()));
                              }).onError((error, stackTrace) {
                                Utils().toastMessage(error.toString());
                                setState(() {
                                  loading = false;
                                });
                              });
                            }
                          }),
                    ],
                  ))
            ],
          )),
        ),
      ),
    );
  }
}
