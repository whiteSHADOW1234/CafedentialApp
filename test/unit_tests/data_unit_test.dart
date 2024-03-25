import 'package:flutter_test/flutter_test.dart';
import 'package:cafedential/MainPageScreen/main_methods/cloud_coffee_data.dart';

void main() {
  group('CoffeeList', () {
    test('toJson() method should return a map with all properties', () {
      final coffee = CoffeeList()
        ..coffeeName = 'Test Coffee'
        ..coffeeRoast = 'Medium'
        ..date = '2024-03-24'
        ..temperature = '200F'
        ..grindSize = 'Medium'
        ..brewMethod = 'Pour Over'
        ..brewTime = '3:30'
        ..brewRatio = '1:16'
        ..aromaScore = '4'
        ..flavorScore = '4'
        ..aftertasteScore = '3'
        ..acidityScore = '3'
        ..bodyScore = '4'
        ..balanceScore = '4'
        ..uniformityScore = '5'
        ..cleanCupScore = '5'
        ..sweetnessScore = '4'
        ..defectScore = '1'
        ..aromaDry = 'Fruity'
        ..aromaBreak = 'Floral'
        ..acidityIntensity = 'Medium'
        ..overallScore = '4'
        ..notes = 'Test notes'
        ..totalScore = '88'
        ..finalScore = '88';

      final expectedMap = {
        'coffee_name': 'Test Coffee',
        'coffee_roast': 'Medium',
        'date': '2024-03-24',
        'temperature': '200F',
        'grind_size': 'Medium',
        'brew_method': 'Pour Over',
        'brew_time': '3:30',
        'brew_ratio': '1:16',
        'aroma_score': '4',
        'flavor_score': '4',
        'aftertaste_score': '3',
        'acidity_score': '3',
        'body_score': '4',
        'balance_score': '4',
        'uniformity_score': '5',
        'clean_cup_score': '5',
        'sweetness_score': '4',
        'defect_score': '1',
        'aroma_dry': 'Fruity',
        'aroma_break': 'Floral',
        'acidity_intensity': 'Medium',
        'overall_score': '4',
        'notes': 'Test notes',
        'total_score': '88',
        'final_score': '88',
      };

      expect(coffee.toJson(), expectedMap);
    });

    test('fromJson() method should initialize properties from a snapshot', () {
      final snapshot = {
        'coffee_name': 'Test Coffee',
        'coffee_roast': 'Medium',
        'date': '2024-03-24',
        'temperature': '200F',
        'grind_size': 'Medium',
        'brew_method': 'Pour Over',
        'brew_time': '3:30',
        'brew_ratio': '1:16',
        'aroma_score': '4',
        'flavor_score': '4',
        'aftertaste_score': '3',
        'acidity_score': '3',
        'body_score': '4',
        'balance_score': '4',
        'uniformity_score': '5',
        'clean_cup_score': '5',
        'sweetness_score': '4',
        'defect_score': '1',
        'aroma_dry': 'Fruity',
        'aroma_break': 'Floral',
        'acidity_intensity': 'Medium',
        'overall_score': '4',
        'notes': 'Test notes',
        'total_score': '88',
        'final_score': '88',
      };

      final coffee = CoffeeList.fromSnapshot(snapshot);

      expect(coffee.coffeeName, 'Test Coffee');
      expect(coffee.coffeeRoast, 'Medium');
      expect(coffee.date, '2024-03-24');
      expect(coffee.temperature, '200F');
      expect(coffee.grindSize, 'Medium');
      expect(coffee.brewMethod, 'Pour Over');
      expect(coffee.brewTime, '3:30');
      expect(coffee.brewRatio, '1:16');
      expect(coffee.aromaScore, '4');
      expect(coffee.flavorScore, '4');
      expect(coffee.aftertasteScore, '3');
      expect(coffee.acidityScore, '3');
      expect(coffee.bodyScore, '4');
      expect(coffee.balanceScore, '4');
      expect(coffee.uniformityScore, '5');
      expect(coffee.cleanCupScore, '5');
      expect(coffee.sweetnessScore, '4');
      expect(coffee.defectScore, '1');
      expect(coffee.aromaDry, 'Fruity');
      expect(coffee.aromaBreak, 'Floral');
      expect(coffee.acidityIntensity, 'Medium');
      expect(coffee.overallScore, '4');
      expect(coffee.notes, 'Test notes');
      expect(coffee.totalScore, '88');
      expect(coffee.finalScore, '88');
    });
  });
}
