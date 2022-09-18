import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cafedential/MainPageScreen/edit_coffee_info_page.dart';
import 'package:cafedential/MainPageScreen/main_methods/cloud_coffee_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CardPage extends StatefulWidget {
  final Function() notifyParent;
  final String doc_id;
  final CoffeeList coffeeList;
  CardPage({Key? key, required this.coffeeList, required this.doc_id, required this.notifyParent}) : super(key: key);

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown,
          title: Text('${widget.coffeeList.coffeeName}'),
          actions: [
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => EditCoffeeData(coffeeList: widget.coffeeList, doc_id: widget.doc_id, notifyParent: widget.notifyParent)));
              },
            ),

            // IconButton(
            //   icon: const Icon(Icons.delete),
            //   onPressed: () async {
            //     showDialog(
            //       context: context,
            //       builder: (context) {
            //         return AlertDialog(
            //           title: const Text('Delete this note?'),
            //           actions: [
            //             TextButton(
            //               onPressed: () {
            //                 Navigator.pop(context);
            //               },
            //               child: const Text('Cancel'),
            //             ),
            //             TextButton(
            //               onPressed: () async {
            //                 final User userCredential = FirebaseAuth.instance.currentUser!;
            //                 await FirebaseFirestore.instance.collection('users').doc(userCredential.uid).collection('coffee_notes').doc(widget.doc_id).delete().whenComplete((){
            //                   widget.notifyParent();
            //                   Navigator.pop(context);
            //                 });
            //               },
            //               child: const Text('Delete'),
            //             ),
            //           ],
            //         );
            //       },
            //     );
            //   },
            // ),
          
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Color.fromARGB(255, 242, 244, 228),
            child: coffeeInfo()
          ),
        ),
      ),
    );
  }

  Widget coffeeInfo() {
    return Column(
      children: [
        // Text('index: ${widget.coffeeList.indexID}'),
        twoTextStyles('Roast','${widget.coffeeList.coffeeRoast}','Date','${widget.coffeeList.date}'),
        twoTextStyles('Temperature','${widget.coffeeList.temperature}', 'Grind Size','${widget.coffeeList.grindSize}'),
        twoTextStyles('Brew\nRatio','${widget.coffeeList.brewRatio}','Brew\nTime','${widget.coffeeList.brewTime} min'),
        twoTextStyles('Aroma\n Score','${widget.coffeeList.aromaScore}','Flavor\n Score','${widget.coffeeList.flavorScore}'),
        twoTextStyles('Acidity\n Score','${widget.coffeeList.acidityScore}',' Body\nScore','${widget.coffeeList.bodyScore}'),
        twoTextStyles('Balance\n  Score','${widget.coffeeList.balanceScore}','Aftertaste\n   Score','${widget.coffeeList.aftertasteScore}'),
        twoTextStyles('Uniformity\n    Score','${widget.coffeeList.uniformityScore}', 'Sweetness\n    Score','${widget.coffeeList.sweetnessScore}'),
        twoTextStyles('Clean Cup\n    Score','${widget.coffeeList.cleanCupScore}','Overall\n  Score','${widget.coffeeList.overallScore}'),
        twoTextStyles('Defect\n Score','${widget.coffeeList.defectScore}', 'Total (Final)\n     Score','${widget.coffeeList.totalScore} (${widget.coffeeList.finalScore?.substring(0, 4)})'),
        longTextStyle('Aroma Dry','${widget.coffeeList.aromaDry}'),
        longTextStyle('Aroma Break','${widget.coffeeList.aromaBreak}'),
        longTextStyle('Aroma Intensity','${widget.coffeeList.acidityIntensity}'),
        longTextStyle('Brew Method','${widget.coffeeList.brewMethod}'),
        longTextStyle('Notes','${widget.coffeeList.notes}'),
        SizedBox(height: 20,),
      ],
    );
  }

  Widget textStyle(String title,String content) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Card(
          color: Color.fromARGB(157, 228, 170, 149),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: SizedBox(
            height:150,
            width: 175,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 25,
                    // fontWeight: FontWeight.bold,
                    fontFamily: 'ArefRuqaalnk',
                  ),
                ),
                const SizedBox(height: 10,),
                Text(
                  content,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget twoTextStyles(String title1,String content1, String title2, String content2){
    return Row(
      children: [
        textStyle(title1,content1),
        textStyle(title2,content2),
      ],
    );
  }

  Widget longTextStyle(String title, String content){
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Card(
          color: const Color.fromARGB(46, 109, 50, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: SizedBox(
            height:150,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 27,
                    fontFamily: 'ArefRuqaalnk',
                  ),
                ),
                const SizedBox(height: 10,),
                Text(
                  content,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


   Future deleteData(String id) async{
    try {
      await  FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("coffee_notes")
          .doc(id)
          .delete();
    }catch (e){
      return false;
    }
   }
}