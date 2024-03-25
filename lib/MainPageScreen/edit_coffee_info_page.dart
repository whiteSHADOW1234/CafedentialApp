import 'package:cafedential/MainPageScreen/main_methods/cloud_coffee_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class EditCoffeeData extends StatefulWidget {
  final Function() notifyParent;
  final CoffeeList coffeeList;
  // ignore: non_constant_identifier_names
  final String doc_id;
  // ignore: non_constant_identifier_names
  const EditCoffeeData({Key? key, required this.coffeeList, required this.doc_id, required this.notifyParent}) : super(key: key);

  @override
  State<EditCoffeeData> createState() => _EditCoffeeDataState();
}

class _EditCoffeeDataState extends State<EditCoffeeData> {
  final GlobalKey<FormState> _updateDataKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _roastController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _temperatureController = TextEditingController();
  final TextEditingController _grindSizeController = TextEditingController();
  final TextEditingController _brewTimeController = TextEditingController();
  final TextEditingController _brewMethodController = TextEditingController();
  final TextEditingController _brewRatioController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  final TextEditingController _aromaSController = TextEditingController();
  final TextEditingController _flavorSController = TextEditingController();
  final TextEditingController _aftertasteSController = TextEditingController();
  final TextEditingController _aciditySController = TextEditingController();
  final TextEditingController _bodySController = TextEditingController();
  final TextEditingController _balanceSController = TextEditingController();
  final TextEditingController _uniformityMController = TextEditingController();
  final TextEditingController _cleanCupMController = TextEditingController();
  final TextEditingController _sweetnessMController = TextEditingController();
  final TextEditingController _defectSController = TextEditingController();
  final TextEditingController _overallSController = TextEditingController();
  final TextEditingController _aromaDryController = TextEditingController();
  final TextEditingController _aromaBreakController = TextEditingController();
  final TextEditingController _acidityIntensityController = TextEditingController();
  final AddCoffeeInfo _addCoffeeInfo = AddCoffeeInfo();

  // ignore: non_constant_identifier_names
  late double total_score = double.parse(_aromaSController.text) + double.parse(_flavorSController.text) 
    + double.parse(_aftertasteSController.text) + double.parse(_aciditySController.text) + double.parse(_bodySController.text) 
    + double.parse(_balanceSController.text) + double.parse(_uniformityMController.text) + double.parse(_sweetnessMController.text) 
    + double.parse(_cleanCupMController.text) + double.parse(_overallSController.text);
  // ignore: non_constant_identifier_names
  late double final_score = (total_score - double.parse(_defectSController.text)) / 85 * 100;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 157, 96, 74),
          title: const Text('Edit Coffee Data'),
        ),
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Form(
                    key: _updateDataKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        coffeeUpdateTextFormField(
                          labeltext: 'Coffee Name',
                          initialValue: '${widget.coffeeList.coffeeName}',
                          validator: (inputVal){
                            if(inputVal!.isEmpty){
                              return 'Please enter a name';
                            }
                            return null;
                          }, 
                          controller: _nameController
                        ),
                        coffeeTwoUpdateTextFormField(
                          labeltext1: 'Coffee Roast', 
                          controller1: _roastController, 
                          validator1: (inputVal){
                            if(inputVal!.isEmpty){
                              return 'Please enter the roast';
                            }
                            return null;
                          }, 
                          initialValue1: '${widget.coffeeList.coffeeRoast}',
                          labeltext2: 'Date', 
                          validator2: (inputVal){
                            if(inputVal!.isEmpty){
                              return 'Please enter the date';
                            }
                            return null;
                          }, 
                          controller2: _dateController,
                          initialValue2: '${widget.coffeeList.date}'
                        ),
                        coffeeTwoUpdateTextFormField(
                          labeltext1: 'Temperature', 
                          controller1: _temperatureController,
                          validator1: (inputVal){
                            if(inputVal!.isEmpty){
                              return 'Please enter the temperature';
                            }
                            return null;
                          }, 
                          initialValue1: '${widget.coffeeList.temperature}',
                          labeltext2: 'Grind Size', 
                          validator2: (inputVal){
                            if(inputVal!.isEmpty){
                              return 'Please enter the grind size';
                            }
                            return null;
                          }, 
                          controller2: _grindSizeController,
                          initialValue2: '${widget.coffeeList.grindSize}'
                        ),
                        coffeeTwoUpdateTextFormField(
                          labeltext1: 'Brew Time', 
                          controller1: _brewTimeController,
                          validator1: (inputVal){
                            if(inputVal!.isEmpty){
                              return 'Please enter the brew time';
                            }
                            return null;
                          }, 
                          initialValue1: '${widget.coffeeList.brewTime}',
                          labeltext2: 'Brew Ratio', 
                          validator2: (inputVal){
                            if(inputVal!.isEmpty){
                              return 'Please enter the brew ratio';
                            }
                            return null;
                          }, 
                          controller2: _brewRatioController,
                          initialValue2: '${widget.coffeeList.brewRatio}'
                        ),
                        coffeeUpdateTextFormField(
                          labeltext: 'Brew Method',
                          validator: (inputVal){
                            if(inputVal!.isEmpty){
                              return 'Please enter the brew method';
                            }
                            return null;
                          }, 
                          controller: _brewMethodController,
                          initialValue: '${widget.coffeeList.brewMethod}'
                        ),
                        coffeeTwoUpdateTextFormField(
                          labeltext1: 'Aroma Score', 
                          controller1: _aromaSController,
                          validator1: (inputVal){
                            try {
                              if(inputVal!.isEmpty){
                                return 'Please enter the aroma score';
                              } else if(double.parse(inputVal) > 10 || double.parse(inputVal) < 0){
                                return '0 <= Score <= 10';
                              }
                              return null;
                            } catch(e){
                              return 'Please enter a valid number';
                            }
                            
                          }, 
                          initialValue1: '${widget.coffeeList.aromaScore}',
                          labeltext2: 'Flavor Score', 
                          validator2: (inputVal){
                            try {
                              if(inputVal!.isEmpty){
                                return 'Please enter the flavor score';
                              } else if(double.parse(inputVal) > 10 || double.parse(inputVal) < 0){
                                return '0 <= Score <= 10';
                              }
                              return null;
                            } catch (e) {
                              return 'Please enter a valid number';
                            }
                          }, 
                          controller2: _flavorSController,
                          initialValue2: '${widget.coffeeList.flavorScore}'
                        ),
                        coffeeTwoUpdateTextFormField(
                          labeltext1: 'Aftertaste Score', 
                          controller1: _aftertasteSController,
                          validator1: (inputVal){
                            try {
                              if(inputVal!.isEmpty){
                                return 'Please enter the aftertaste score';
                              } else if(double.parse(inputVal) > 10 || double.parse(inputVal) < 0){
                                return '0 <= Score <= 10';
                              }
                              return null;
                            } catch (e) {
                              return 'Please enter a valid number';
                            }
                          }, 
                          initialValue1: '${widget.coffeeList.aftertasteScore}',
                          labeltext2: 'Acidity Score', 
                          validator2: (inputVal){
                            try {
                              if(inputVal!.isEmpty){
                                return 'Please enter the acidity score';
                              } else if(double.parse(inputVal) > 10 || double.parse(inputVal) < 0){
                                return '0 <= Score <= 10';
                              }
                              return null;
                            } catch (e) {
                              return '0 <= Score <= 10';
                            }
                          }, 
                          controller2: _aciditySController,
                          initialValue2: '${widget.coffeeList.acidityScore}'
                        ),
                        coffeeTwoUpdateTextFormField(
                          labeltext1: 'Body Score', 
                          controller1: _bodySController,
                          validator1: (inputVal){
                            try {
                              if(inputVal!.isEmpty){
                                return 'Please enter the body score';
                              } else if(double.parse(inputVal) > 10 || double.parse(inputVal) < 0){
                                return '0 <= Score <= 10';
                              }
                              return null;
                            } catch (e) {
                              return 'Please enter a number';
                            }
                          }, 
                          initialValue1: '${widget.coffeeList.bodyScore}',
                          labeltext2: 'Balance Score', 
                          validator2: (inputVal){
                            try {
                              if(inputVal!.isEmpty){
                                return 'Please enter the balance score';
                              } else if(double.parse(inputVal) > 10 || double.parse(inputVal) < 0){
                                return '0 <= Score <= 10';
                              }
                              return null;
                            } catch (e) {
                              return 'Please enter a number';
                            }
                          }, 
                          controller2: _balanceSController,
                          initialValue2: '${widget.coffeeList.balanceScore}'
                        ),
                        coffeeTwoUpdateTextFormField(
                          labeltext1: 'Uniformity Score', 
                          controller1: _uniformityMController,
                          validator1: (inputVal){
                            try {
                              if(inputVal!.isEmpty){
                                return 'Please enter the uniformity score';
                              } else if(double.parse(inputVal) > 5 || double.parse(inputVal) < 0){
                                return '0 <= Score <= 5';
                              }
                              return null;
                            } catch (e) {
                              return 'Please enter a number';
                            }
                          }, 
                          initialValue1: '${widget.coffeeList.uniformityScore}',
                          labeltext2: 'Clean Cup Score', 
                          validator2: (inputVal){
                            try {
                              if(inputVal!.isEmpty){
                                return 'Please enter the clean cup score';
                              } else if(double.parse(inputVal) > 5 || double.parse(inputVal) < 0){
                                return '0 <= Score <= 5';
                              }
                              return null;
                            } catch (e) {
                              return 'Please enter a number';
                            }
                          }, 
                          controller2: _cleanCupMController,
                          initialValue2: '${widget.coffeeList.cleanCupScore}'
                        ),
                        coffeeTwoUpdateTextFormField(
                          labeltext1: 'Sweetness Score', 
                          controller1: _sweetnessMController,
                          validator1: (inputVal){
                            try {
                              if(inputVal!.isEmpty){
                                return 'Please enter the sweetness score';
                              } else if(double.parse(inputVal) > 5 || double.parse(inputVal) < 0){
                                return '0 <= Score <= 5';
                              }
                              return null;
                            } catch (e) {
                              return 'Please enter a number';
                            }
                          }, 
                          initialValue1: '${widget.coffeeList.sweetnessScore}',
                          labeltext2: 'Defects Score', 
                          validator2: (inputVal){
                            try{
                              if(inputVal!.isEmpty){
                                return 'Please enter the defects score';
                              } else if(double.parse(inputVal) == 2.0 || double.parse(inputVal) == 4.0){
                                return null;
                              } 
                              return 'Please enter 2 or 4';
                            } catch (e) {
                              return 'Please enter a number';
                            }
                          }, 
                          controller2: _defectSController,
                          initialValue2: '${widget.coffeeList.defectScore}'
                        ),
                        coffeeUpdateTextFormField(
                          labeltext: 'Aroma_Dry',
                          validator: (inputVal){
                            if(inputVal!.isEmpty){
                              return 'Please enter the aroma dry';
                            }
                            return null;
                          },
                          controller: _aromaDryController,
                          initialValue: '${widget.coffeeList.aromaDry}'
                        ),
                        coffeeUpdateTextFormField(
                          labeltext: 'Aroma_Break',
                          validator: (inputVal){
                            if(inputVal!.isEmpty){
                              return 'Please enter the aroma break';
                            }
                            return null;
                          },
                          controller: _aromaBreakController,
                          initialValue: '${widget.coffeeList.aromaBreak}'
                        ),
                        coffeeUpdateTextFormField(
                          labeltext: 'Acidity_Intensity',
                          validator: (inputVal){
                            if(inputVal!.isEmpty){
                              return 'Please enter the acidity intensity';
                            }
                            return null;
                          },
                          controller: _acidityIntensityController,
                          initialValue: '${widget.coffeeList.acidityIntensity}'
                        ),
                        coffeeUpdateTextFormField(
                          labeltext: 'Overall Score',
                          validator: (inputVal){
                            try {
                              if(inputVal!.isEmpty){
                                return 'Please enter the overall score';
                              } else if(double.parse(inputVal) > 10 || double.parse(inputVal) < 0){
                                return '0 <= Score <= 10';
                              }
                              return null;
                            } catch (e) {
                              return 'Please enter a number';
                            }
                          },
                          controller: _overallSController,
                          initialValue: '${widget.coffeeList.overallScore}'
                        ),
                        coffeeUpdateTextFormField(
                          labeltext: 'Notes',
                          validator: (inputVal){
                            return null;
                          },
                          controller: _notesController,
                          initialValue: '${widget.coffeeList.notes}'
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Colors.purple,
                              Colors.deepPurple,
                              Colors.blueAccent
                            ],
                            begin: Alignment.bottomRight,
                            end: Alignment.topLeft,
                          ),
                          borderRadius: BorderRadius.circular(20.0)
                      ),
                      child: TextButton(
                        onPressed: () async {
                          if(_updateDataKey.currentState!.validate()) {
                            // print('Validated');
                            SystemChannels.textInput.invokeMethod('TextInput.hide');
                            setState(() {
                              showSpinner = true;
                            });
                            // ignore: no_leading_underscores_for_local_identifiers
                            final AddCoffeeDataResult _addCoffeeDataResult = await _addCoffeeInfo.updateCoffeeInformation(
                              coffeeName: _nameController.text, 
                              coffeeRoast: _roastController.text, 
                              date: _dateController.text, 
                              temperature: _temperatureController.text, 
                              grindSize: _grindSizeController.text, 
                              brewMethod: _brewMethodController.text, 
                              brewTime: _brewTimeController.text, 
                              brewRatio: _brewRatioController.text, 
                              aromaScore: _aromaSController.text, 
                              flavorScore: _flavorSController.text, 
                              aftertasteScore: _aftertasteSController.text, 
                              acidityScore: _aciditySController.text, 
                              bodyScore: _bodySController.text, 
                              balanceScore: _balanceSController.text, 
                              uniformityScore: _uniformityMController.text, 
                              cleanCupScore: _cleanCupMController.text, 
                              sweetnessScore: _sweetnessMController.text, 
                              defectScore: _defectSController.text, 
                              aromaDry: _aromaDryController.text, 
                              aromaBreak: _aromaBreakController.text, 
                              acidityIntensity: _acidityIntensityController.text, 
                              overallScore: _overallSController.text, 
                              notes: _notesController.text, 
                              totalScore: total_score.toString(), 
                              finalScore: final_score.toString(), 
                              docId: widget.doc_id,
                            );
                            String msg = "";
                            if(_addCoffeeDataResult == AddCoffeeDataResult.Success){
                              msg = "Data updated successfully";
                            } else if (_addCoffeeDataResult == AddCoffeeDataResult.Failure){
                              msg = "Error updating data (Check your internet connection)";
                            } else {
                              msg = "Unknown error";
                            }
                            if(msg != ""){
                              // ignore: use_build_context_synchronously
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
                            }
                            widget.notifyParent();
                            setState(() {
                              showSpinner = false;
                            });
                            // ignore: use_build_context_synchronously
                            Navigator.pop(context);
                            // ignore: use_build_context_synchronously
                            Navigator.pop(context);
                          } else {
                            // print('Not Validated');
                          }
                        },
                        child: const Text(
                          'Save',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}