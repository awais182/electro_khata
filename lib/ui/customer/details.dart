import 'package:electro_khata/ui/customer/payment%20method.dart';
import 'package:electro_khata/widgets/round_btn.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
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
        padding:  EdgeInsets.symmetric(horizontal: width*0.03, vertical: height*0.05),
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
              'Shop Name',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
            ),

            SizedBox(
              height: height * 0.06,
            ),


            Row(
              children: [
                const Text('Product Title:', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),),
                SizedBox(width: width*0.055,),
                const Text('Product title will be replaced',)
              ],
            ),
            SizedBox(height: height*0.02,),
            Row(
              children: [
                const Text('Descriptoin:',style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),),
                SizedBox(width: width*0.08,),
                const Flexible(child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquet tristique velit facilisis vulputate tortor. Senectus fringilla tristique et, sit in in. Euismod eu facilisi consectetur consequat convallis. Adipiscing urna, lectus aliquet elit, sed duis sagittis vestibulum.",))
              ],
            ),

            SizedBox(height: height*0.03,),
            Row(
              children: [
                const Text('Dues:',style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),),
                SizedBox(width: width*0.19,),
                const Text('Rs. 2,000', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),)
              ],
            ),
            SizedBox(height: height*0.03,),
            Row(
              children: [
                const Text('Status:',style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),),
                SizedBox(width: width*0.17,),
                Container(
                  alignment: Alignment.center,
                  height: height*0.035,
                    width: width*0.2,
                    decoration: BoxDecoration(color: Colors.red[100], borderRadius: BorderRadius.circular(20)),

                    child: const Text('Pending', ),)
              ],
            ),
            SizedBox(height: height*0.09,),

            RoundBTN(title: 'Pay Now', ontap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const PaymentPage()));
            })
            
          ],
        ),
      ),
    );
  }
}
