import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

enum AddCoffeeDataResult {
  // ignore: constant_identifier_names
  Success,
  // ignore: constant_identifier_names
  Failure,
}

class AddCoffeeInfo {
  Future<AddCoffeeDataResult> addCoffeeInformation({
    String? coffeeName,
    String? coffeeRoast,
    String? date,
    String? temperature,
    String? grindSize,
    String? brewMethod,
    String? brewTime,
    String? brewRatio,
    String? aromaScore,
    String? flavorScore,
    String? aftertasteScore,
    String? acidityScore,
    String? bodyScore,
    String? balanceScore,
    String? uniformityScore,
    String? cleanCupScore,
    String? sweetnessScore,
    String? defectScore,
    String? aromaDry,
    String? aromaBreak,
    String? acidityIntensity,
    String? overallScore,
    String? notes,
    String? totalScore,
    String? finalScore,
  }) async {
    try{
      final User userCredential = FirebaseAuth.instance.currentUser!;
      FirebaseFirestore.instance.collection('users').doc(userCredential.uid).collection('coffee_notes').add({
        'coffee_name': coffeeName,
        'coffee_roast': coffeeRoast,
        'date': date,
        'temperature': temperature,
        'grind_size': grindSize,
        'brew_method': brewMethod,
        'brew_time': brewTime,
        'brew_ratio': brewRatio,
        'aroma_score': aromaScore,
        'flavor_score': flavorScore,
        'aftertaste_score': aftertasteScore,
        'acidity_score': acidityScore,
        'body_score': bodyScore,
        'balance_score': balanceScore,
        'uniformity_score': uniformityScore,
        'clean_cup_score': cleanCupScore,
        'sweetness_score': sweetnessScore,
        'defect_score': defectScore,
        'aroma_dry': aromaDry,
        'aroma_break': aromaBreak,
        'acidity_intensity': acidityIntensity,
        'overall_score': overallScore,
        'notes': notes,
        'total_score': totalScore,
        'final_score': finalScore,
      });
      return AddCoffeeDataResult.Success;
    } catch (e) {
      // print(e.toString());
      return AddCoffeeDataResult.Failure;
    }
  }

  updateCoffeeInformation({
    required String coffeeName, 
    required String coffeeRoast, 
    required String date, 
    required String temperature, 
    required String grindSize, 
    required String brewMethod, 
    required String brewTime, 
    required String brewRatio, 
    required String aromaScore, 
    required String flavorScore, 
    required String aftertasteScore, 
    required String acidityScore, 
    required String bodyScore, 
    required String balanceScore, 
    required String uniformityScore, 
    required String cleanCupScore, 
    required String sweetnessScore, 
    required String defectScore, 
    required String aromaDry, 
    required String aromaBreak, 
    required String acidityIntensity, 
    required String overallScore, 
    required String notes, 
    required String totalScore, 
    required String finalScore,
    required String docId,
    }) async {
      try {
        final User userCredential = FirebaseAuth.instance.currentUser!;
        FirebaseFirestore.instance.collection('users').doc(userCredential.uid).collection('coffee_notes').doc(docId).update({
          'coffee_name': coffeeName,
          'coffee_roast': coffeeRoast,
          'date': date,
          'temperature': temperature,
          'grind_size': grindSize,
          'brew_method': brewMethod,
          'brew_time': brewTime,
          'brew_ratio': brewRatio,
          'aroma_score': aromaScore,
          'flavor_score': flavorScore,
          'aftertaste_score': aftertasteScore,
          'acidity_score': acidityScore,
          'body_score': bodyScore,
          'balance_score': balanceScore,
          'uniformity_score': uniformityScore,
          'clean_cup_score': cleanCupScore,
          'sweetness_score': sweetnessScore,
          'defect_score': defectScore,
          'aroma_dry': aromaDry,
          'aroma_break': aromaBreak,
          'acidity_intensity': acidityIntensity,
          'overall_score': overallScore,
          'notes': notes,
          'total_score': totalScore,
          'final_score': finalScore,
        });
        return AddCoffeeDataResult.Success;
      } catch (e) {
        // print(e.toString());
        return AddCoffeeDataResult.Failure;
      }
    }
}


Widget coffeeTextFormField({required String? labeltext,required String? Function(String?)? validator,required TextEditingController? controller}) {
    return Container(
      padding: const EdgeInsets.only(left: 5, right: 5,bottom: 15),
      child: TextFormField(
        validator: validator,
        controller: controller,
        style: const TextStyle(
          fontSize: 17,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          labelText: labeltext,
          labelStyle: const TextStyle(
            fontSize: 15,
            // fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 255, 0, 0),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 235, 101, 34),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 134, 169, 223),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 134, 169, 223),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      )
    );
  }


Widget coffeeTwoTextFormField({required String? labeltext1,required String? Function(String?)? validator1,required TextEditingController? controller1, required String? labeltext2, required String? Function(String?)? validator2, required TextEditingController? controller2}){
  return Row(
    children: [
      Expanded(
        child: coffeeTextFormField(labeltext: labeltext1, validator: validator1, controller: controller1),
      ),
      const SizedBox(width: 10,),
      Expanded(
        child: coffeeTextFormField(labeltext: labeltext2, validator: validator2, controller: controller2),
      ),
    ],
  );
}


Widget coffeeUpdateTextFormField({required String? labeltext,required String? Function(String?)? validator,required TextEditingController? controller, required String? initialValue}) {
    return Container(
      padding: const EdgeInsets.only(left: 5, right: 5,bottom: 15),
      child: TextFormField(
        validator: validator,
        controller: controller,
        style: const TextStyle(
          fontSize: 17,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          labelText: '$labeltext ($initialValue)',
          labelStyle: const TextStyle(
            fontSize: 15,
            // fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 255, 0, 0),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 235, 101, 34),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 134, 169, 223),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 134, 169, 223),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      )
    );
  }


Widget coffeeTwoUpdateTextFormField({required String? labeltext1,required String? Function(String?)? validator1,required TextEditingController? controller1, required String? initialValue1, required String? labeltext2, required String? Function(String?)? validator2, required TextEditingController? controller2, required String? initialValue2}){
  return Row(
    children: [
      Expanded(
        child: coffeeUpdateTextFormField(labeltext: labeltext1, validator: validator1, controller: controller1, initialValue: initialValue1),
      ),
      const SizedBox(width: 10,),
      Expanded(
        child: coffeeUpdateTextFormField(labeltext: labeltext2, validator: validator2, controller: controller2, initialValue: initialValue2),
      ),
    ],
  );
}



class CoffeeList {
  String? coffeeName;
  String? coffeeRoast;
  String? date;
  String? temperature;
  String? grindSize;
  String? brewMethod;
  String? brewTime;
  String? brewRatio;
  String? aromaScore;
  String? flavorScore;
  String? aftertasteScore;
  String? acidityScore;
  String? bodyScore;
  String? balanceScore;
  String? uniformityScore;
  String? cleanCupScore;
  String? sweetnessScore;
  String? defectScore;
  String? aromaDry;
  String? aromaBreak;
  String? acidityIntensity;
  String? overallScore;
  String? notes;
  String? totalScore;
  String? finalScore;
  // String? indexID;

  CoffeeList();

  Map<String, dynamic> toJson() => {
    'coffee_name': coffeeName,
    'coffee_roast': coffeeRoast,
    'date': date,
    'temperature': temperature,
    'grind_size': grindSize,
    'brew_method': brewMethod,
    'brew_time': brewTime,
    'brew_ratio': brewRatio,
    'aroma_score': aromaScore,
    'flavor_score': flavorScore,
    'aftertaste_score': aftertasteScore,
    'acidity_score': acidityScore,
    'body_score': bodyScore,
    'balance_score': balanceScore,
    'uniformity_score': uniformityScore,
    'clean_cup_score': cleanCupScore,
    'sweetness_score': sweetnessScore,
    'defect_score': defectScore,
    'aroma_dry': aromaDry,
    'aroma_break': aromaBreak,
    'acidity_intensity': acidityIntensity,
    'overall_score': overallScore,
    'notes': notes,
    'total_score': totalScore,
    'final_score': finalScore,
    // 'index': indexID,
  };

  CoffeeList.fromSnapshot(snapshot) : 
    coffeeName = snapshot['coffee_name'],
    coffeeRoast = snapshot['coffee_roast'],
    date = snapshot['date'],
    temperature = snapshot['temperature'],
    grindSize = snapshot['grind_size'],
    brewMethod = snapshot['brew_method'],
    brewTime = snapshot['brew_time'],
    brewRatio = snapshot['brew_ratio'],
    aromaScore = snapshot['aroma_score'],
    flavorScore = snapshot['flavor_score'],
    aftertasteScore = snapshot['aftertaste_score'],
    acidityScore = snapshot['acidity_score'],
    bodyScore = snapshot['body_score'],
    balanceScore = snapshot['balance_score'],
    uniformityScore = snapshot['uniformity_score'],
    cleanCupScore = snapshot['clean_cup_score'],
    sweetnessScore = snapshot['sweetness_score'],
    defectScore = snapshot['defect_score'],
    aromaDry = snapshot['aroma_dry'],
    aromaBreak = snapshot['aroma_break'],
    acidityIntensity = snapshot['acidity_intensity'],
    overallScore = snapshot['overall_score'],
    notes = snapshot['notes'],
    totalScore = snapshot['total_score'],
    finalScore = snapshot['final_score'];
}


