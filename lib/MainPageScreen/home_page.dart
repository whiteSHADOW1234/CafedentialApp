import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cafedential/MainPageScreen/add_coffee_page.dart';
import 'package:cafedential/MainPageScreen/card_page.dart';
import 'package:cafedential/MainPageScreen/main_methods/cloud_coffee_data.dart';
import 'package:cafedential/nav.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Object> coffeeList = [];
  bool have_data = false;
  late var doc_id;

  refresh() {
    setState(() {
      didChangeDependencies();
      // getUserCoffeeNoteList();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getUserCoffeeNoteList();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(10),
          child: have_data
              ? ListView.builder(
                  itemCount: coffeeList.length,
                  itemBuilder: (context, index) {
                    return HomeCard(coffeeList: coffeeList[index] as CoffeeList, indexID: doc_id[index], notifyParent: refresh);
                  },
                )
              : Center(
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                    SizedBox(
                        height: 250.0,
                        child: Lottie.asset('assets/no-data-coffee-time.json'),
                        // child: Lottie.network('https://assets6.lottiefiles.com/packages/lf20_UTYENB.json'),
                      ),
                    Text('No Data ...', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                    Text('Press the plus button to create your coffee data', style: TextStyle(fontSize: 15,)),
                  ],
                ),
              ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 125, 58, 58),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => AddCoffeeData(notifyParent: refresh)));
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
  

  Future getUserCoffeeNoteList() async {
    final User userCredential = await FirebaseAuth.instance.currentUser!;
    QuerySnapshot<Map<String, dynamic>> data = await FirebaseFirestore.instance.collection('users').doc(userCredential.uid).collection('coffee_notes').get();
    doc_id = data.docs.map((e) => e.id).toList();
    if(data.docs.isNotEmpty){
      setState(() {
        coffeeList = List.from(data.docs.map((doc) => CoffeeList.fromSnapshot(doc)));
        have_data = true;
      });
    } else{
      if (mounted) {
        setState(() {
          have_data = false;
        });
      }
      // setState(() {
      //   have_data = false;
      // });
    }
    print('doc_id: $doc_id');
  }
}


class HomeCard extends StatefulWidget {
  final Function() notifyParent;
  final CoffeeList coffeeList;
  final String indexID;
  HomeCard({Key? key, required this.coffeeList, required this.indexID, required this.notifyParent}) : super(key: key);

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  @override
  Widget build(BuildContext context) {
    bool showSpinner = false;
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Container(
        margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Material(
          color: Colors.transparent,
          child: Ink(
            width: MediaQuery.of(context).size.width,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color.fromARGB(148, 243, 182, 83), Color.fromARGB(255, 236, 162, 135)],
              ),
            ),
            child: InkWell(
              child: ListTile(
                title: Text(
                  "${widget.coffeeList.coffeeName}",
                  style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  '\n${widget.coffeeList.date}',
                  style: const TextStyle(fontSize: 15, color: Color.fromARGB(255, 138, 138, 138)),
                ),
                trailing: Text(
                      'Total Score: ${widget.coffeeList.totalScore}\nFinal Score: ${widget.coffeeList.finalScore?.substring(0, 4)}',
                      style: const TextStyle(fontSize: 20, color: Color.fromARGB(255, 75, 75, 75)),
                    ),//Text('${coffeeList.totalScore}  (${coffeeList.finalScore})'),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CardPage(coffeeList: widget.coffeeList, doc_id: widget.indexID, notifyParent: widget.notifyParent, ),
                  ),
                );
              },
              onLongPress: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Delete this note?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () async {
                            setState(() {
                              showSpinner = true;
                            });
                            final User userCredential = FirebaseAuth.instance.currentUser!;
                            await FirebaseFirestore.instance.collection('users').doc(userCredential.uid).collection('coffee_notes').doc(widget.indexID).delete().whenComplete((){
                              print('Delete Success');
                              widget.notifyParent();
                            }).catchError((error) => print('Failed to delete the note: $error'));
                            setState(() {
                              showSpinner = false;
                            });
                            print('Going to pop the dialog');
                            widget.notifyParent();
                            Navigator.pop(context);
                            // Navigator.pop(context);
                            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Nav()));
                          },
                          child: const Text('Delete'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}