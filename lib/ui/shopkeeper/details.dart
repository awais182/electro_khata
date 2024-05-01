import 'package:flutter/material.dart';

class ShopDetailsPage extends StatefulWidget {
  const ShopDetailsPage({super.key});

  @override
  State<ShopDetailsPage> createState() => _ShopDetailsPageState();
}

class _ShopDetailsPageState extends State<ShopDetailsPage> {
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
          'Details',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.03, vertical: height * 0.05),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: height * 0.117,
              width: width * 0.25,
              decoration: BoxDecoration(
                color: Colors.orange[100],
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Icon(
                Icons.person,
                color: Colors.black,
                size: 50,
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            const Text(
              'Person Name',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: height * 0.06,
            ),
            Row(
              children: [
                const Text(
                  'Product Title:',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
                SizedBox(
                  width: width * 0.055,
                ),
                const Text(
                  'Product title will be replaced',
                )
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Row(
              children: [
                const Text(
                  'Descriptoin:',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
                SizedBox(
                  width: width * 0.08,
                ),
                const Flexible(
                    child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquet tristique velit facilisis vulputate tortor. Senectus fringilla tristique et, sit in in. Euismod eu facilisi consectetur consequat convallis. Adipiscing urna, lectus aliquet elit, sed duis sagittis vestibulum.",
                ))
              ],
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Row(
              children: [
                const Text(
                  'Dues:',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
                SizedBox(
                  width: width * 0.19,
                ),
                const Text(
                  'Rs. 2,000',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                )
              ],
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Row(
              children: [
                const Text(
                  'Status:',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
                SizedBox(
                  width: width * 0.17,
                ),
                Container(
                  alignment: Alignment.center,
                  height: height * 0.035,
                  width: width * 0.2,
                  decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius: BorderRadius.circular(20)),
                  child: const Text(
                    'Received',
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
