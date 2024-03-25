import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cafedential/MainPageScreen/edit_coffee_info_page.dart';
import 'package:cafedential/MainPageScreen/main_methods/cloud_coffee_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CardPage extends StatefulWidget {
  final Function() notifyParent;
  // ignore: non_constant_identifier_names
  final String doc_id;
  final CoffeeList coffeeList;
  // ignore: non_constant_identifier_names
  const CardPage({Key? key, required this.coffeeList, required this.doc_id, required this.notifyParent}) : super(key: key);

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
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            color: const Color.fromARGB(255, 242, 244, 228),
            child: coffeeInfo()
          ),
        ),
      ),
    );
  }

  Widget coffeeInfo() {
    return Column(
      key: const Key('coffee_info_column'),
      children: [
        twoTextStyles(' Roast ','${widget.coffeeList.coffeeRoast}',' Date ','${widget.coffeeList.date}'),
        twoTextStyles(' Temperature ','${widget.coffeeList.temperature}', ' Grind Size ','${widget.coffeeList.grindSize}'),
        twoTextStyles(' Brew Ratio ','${widget.coffeeList.brewRatio}',' Brew Time ','${widget.coffeeList.brewTime} min'),
        twoTextStyles(' Aroma Score ','${widget.coffeeList.aromaScore}',' Flavor Score ','${widget.coffeeList.flavorScore}'),
        twoTextStyles(' Acidity Score ','${widget.coffeeList.acidityScore}',' Body Score ','${widget.coffeeList.bodyScore}'),
        twoTextStyles(' Balance Score ','${widget.coffeeList.balanceScore}',' Aftertaste Score ','${widget.coffeeList.aftertasteScore}'),
        twoTextStyles(' Uniformity Score ','${widget.coffeeList.uniformityScore}', ' Sweetness Score ','${widget.coffeeList.sweetnessScore}'),
        twoTextStyles(' Clean Cup Score ','${widget.coffeeList.cleanCupScore}',' Overall Score ','${widget.coffeeList.overallScore}'),
        twoTextStyles(' Defect Score ','${widget.coffeeList.defectScore}', ' Total (Final) Score ','${widget.coffeeList.totalScore} (${widget.coffeeList.finalScore?.substring(0, 4)})'),
        longTextStyle(' Aroma Dry ','${widget.coffeeList.aromaDry}'),
        longTextStyle(' Aroma Break ','${widget.coffeeList.aromaBreak}'),
        longTextStyle(' Aroma Intensity ','${widget.coffeeList.acidityIntensity}'),
        longTextStyle(' Brew Method ','${widget.coffeeList.brewMethod}'),
        longTextStyle(' Notes ','${widget.coffeeList.notes}'),
        const SizedBox(height: 20,),
      ],
    );
  }

  Widget textStyle(String title,String content) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Card(
        color: const Color.fromARGB(157, 228, 170, 149),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: SizedBox(
          height:150,
          width: 173,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              AutoSizeText(
                title,
                style: const TextStyle(
                  fontSize: 22,
                  fontFamily: 'ArefRuqaalnk',
                ),
                maxLines: 1,
              ),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AutoSizeText(
                  content,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget twoTextStyles(String title1,String content1, String title2, String content2){
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: SizedBox(
        height: 150,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            textStyle(title1,content1),// 10 + 175 = 185
            SizedBox(width: (MediaQuery.of(context).size.width - 400 <0) ? 0 : MediaQuery.of(context).size.width - 400,),//185*2 = 370
            textStyle(title2,content2),// 10 + 175 = 185
          ],
        ),
      ),
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
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: AutoSizeText(
                    content,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                    maxLines: 5,
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