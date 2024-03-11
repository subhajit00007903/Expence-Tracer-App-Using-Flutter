import 'widgets.dart';
import "package:flutter/material.dart";
import 'package:shared_preferences/shared_preferences.dart';

void main(){
  runApp(ExpensetrackerApp());
}
class ExpensetrackerApp extends StatefulWidget {
  const ExpensetrackerApp({super.key});

  @override
  State<ExpensetrackerApp> createState() => _ExpensetrackerAppState();
}

class _ExpensetrackerAppState extends State<ExpensetrackerApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Expense Tracker",
      
      debugShowCheckedModeBanner: false,

      home: Expensetrackerpage(),
    );
  }
}

//expence tracker app  PAGE to Home APP 
class Expensetrackerpage extends StatefulWidget {
  const Expensetrackerpage({super.key});

  @override
  State<Expensetrackerpage> createState() => _ExpensetrackerpageState();
}

class _ExpensetrackerpageState extends State<Expensetrackerpage> {

late TextEditingController _expencecontroller;

late TextEditingController _amountcontroller;
List <String> _expences = [];
double _totalAmount = 0;
@override
  void initState() {
    super.initState();
    _expencecontroller = TextEditingController();
    _amountcontroller = TextEditingController();
  }


Future <void>_loadData() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  setState(() {
    _expences = prefs.getStringList("Expences") ?? [];
    _totalAmount = prefs.getDouble("Total Amount") ?? 0.0;
  });
}







Future <void>_saveData() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setStringList("Expences", _expences);
  prefs.setDouble("Total Amount", _totalAmount);
  setState(() {
    _expences = prefs.getStringList("Expences") ?? [];
    _totalAmount = prefs.getDouble("Total Amount") ?? 0.0;
  });
}

void _clearExpence(){
  setState(() {
     _expences.clear();
    _totalAmount = 0.0;
    _saveData();
  });
}







  void _addExpences (){
  setState(() {
    String newExpence = _expencecontroller.text;
    String amounttext = _amountcontroller.text;
    double amount = double.tryParse(amounttext)?? 0.0;
    if(newExpence.isNotEmpty && amount > 0){
      var p = newExpence.length;
      _expences.add("$newExpence"+"       "+"\u{20B9}  $amounttext");
       
        
     _totalAmount += amount;
    _expencecontroller.clear();
      _amountcontroller.clear();
      _saveData();
      
      
      
    }
  });
}

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    backgroundColor: Colors.white,
    body: Column(children: [
      SizedBox(
        height: 20,

      ),
      Column(children: [
        outlinetext("This Month Spend"),
        totalexpencetext("₹ $_totalAmount")
      ],),
    SizedBox(
      height: 10,
    ),
    

Padding(
  padding: const EdgeInsets.symmetric(vertical:10.0),
  child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
       children: [
         outlinetext("Add New  Expences : "),
       ],
      ),
),





    TextField(
      controller: _expencecontroller,
      decoration: InputDecoration(
        labelText: "Expence",
        border: OutlineInputBorder(),
        suffixIcon: Icon(Icons.add_box_rounded),
      ),
    ),
    SizedBox(
      height: 10,
    ),



    TextField(
      controller: _amountcontroller,
      decoration: InputDecoration(
        labelText: "Amount",
        border: OutlineInputBorder(),
        suffixIcon: Icon(Icons.add_box_rounded),
      ),
    ),




    
     SizedBox(
      height: 10,
    ),





Padding(
  padding: const EdgeInsets.symmetric(vertical:20.0),
  child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        
        children: [
          
          ElevatedButton(onPressed: _addExpences, child: Text("Add Expence")),
          
          ElevatedButton(onPressed: _clearExpence, child: Text("Clear Expence")),
        ],
      ),





),SizedBox(
      height: 10,
    ),







    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        
        mainAxisAlignment: MainAxisAlignment.spaceAround,
       children: [
        
         Text("This Month Expences : ",
         style: TextStyle(
          color: Colors.red,
          shadows: [
          Shadow(
            blurRadius: 10.0,
            color: Colors.black,
            offset: Offset(5.0, 5.0),
          ),
        ],
        fontWeight: FontWeight.bold,
         ),
         ),
       ],
      ),
    ),




    Expanded(
      
      child: ListView.builder(
        
        itemCount:  _expences.length,
        itemBuilder: (context,index){
          
              if(index<_expences.length){
                return expencecontainer(_expences[index]);

              }else{
                return null;
              }
      
      }),
    )




    ]),
   );
  }
}



