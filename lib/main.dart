import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/Fixtures/fl_controller.dart';
import 'package:flutter_application_1/edit.dart';
import 'package:flutter_application_1/result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyAppBar(),
    );
  }
}

class MyAppBar extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gouvis Plumbing Water Demand Calculator"),
        leading: IconButton(icon: Icon(Icons.plumbing,),
                 onPressed: () {},),
        actions: [],),
      body: MyBody(),
      floatingActionButton: FloatingActionButton(onPressed: ()async{
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EditPage())
        );
      }, child: Icon(Icons.add),),
    );
  }
}

class MyBody extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MyBody();
  }
}

class _MyBody extends State<MyBody>{

  bool isNumeric(String? s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();

    return
    SingleChildScrollView(
        
        child: 
          Form(
          key: _formKey1,
          child: Column(children: [
          //INPUT
          Container(
            padding: EdgeInsets.symmetric(horizontal: width*0.25),
            child: TextFormField(
              initialValue: "1",
              decoration: InputDecoration(
                hintText: 'Enter Number of Dwelling',
                suffixIcon: IconButton(onPressed: (){if(_formKey1.currentState!.validate()){
                      
                  }},
                  icon: Icon(Icons.calculate),
                ),
              ),
              validator: (String? value){
                if(value == null || value.isEmpty){
                  return 'Please enter some text';
                }else if(!isNumeric(value)){
                  return 'Please enter a valid number';
                }else if(double.parse(value) < 1){
                  return 'Value must be greater than 1';
                }else{
                  Controller.fl.numberOfApartment = int.parse(value);
                  
                  return null;
                }
              },
            )
          ),

          FittedBox(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: DataTable(
                dataRowHeight: 50,
                columns: <DataColumn>[
                  DataColumn(label: Container(
                                      width: width *.2,
                                      child: getIconOrText("Fixture", Icons.category),
                                      alignment: Alignment.centerLeft,
                                      ),

                            ),
                  DataColumn(label: Container(
                                      width: width *.2,
                                      child: getIconOrText("# of Fixture", Icons.tag),
                                      alignment: Alignment.centerLeft,
                                      ),
                                       
                            ),
                  DataColumn(label: Container(
                                      width: width *.2,
                                      child: getIconOrText(("prob of use"), Icons.casino),
                                      alignment: Alignment.centerLeft,
                                      )
                            ),
                  DataColumn(label: Container(
                                      width: width *.1,
                                      child: getIconOrText("GPM", Icons.shower),
                                      alignment: Alignment.centerLeft,
                                      )
                            ),
                  DataColumn(label: Container(
                                      width: 70,
                                      child: getIconOrText("Remove", Icons.delete),
                                      alignment: Alignment.centerLeft,
                                      )
                            ),
                  DataColumn(label: Container(
                                      width: 40,
                                      child: getIconOrText("Edit", Icons.edit),
                                      alignment: Alignment.centerLeft,   
                                      )
                  ),
                ],
                rows: GetItems(context),
              ),
            ),
          ),
          Container(
            alignment:Alignment.bottomCenter,
            child: ElevatedButton (
              child: const Text("check", style: TextStyle(fontSize: 20),),
              onPressed: () {if(_formKey1.currentState!.validate()){
                                    Navigator.push(context,MaterialPageRoute(builder: (context) => ResultPage()));
                            }
              },
            ),
          ),
          Container(height: 80,)
        ],)
          ),
    );
  }

  Widget getIconOrText(String text, IconData icon){
    final double width = MediaQuery.of(context).size.width;
    const double max = 900;
    if(width > max){
      return Text(text, style: const TextStyle(fontSize: 20),);
    }else{
      return Icon(icon);
    }
  }

  List<DataRow> GetItems(BuildContext context){
    List<DataRow> items = <DataRow>[];
    items = Controller.fl.getItems().map(
      (item) => DataRow(cells: [
        DataCell(Text(item.name)),
        DataCell(Text(item.amount.toString())),
        DataCell(Text(item.getProbability(Controller.fl.numberOfApartment).toString())),
        DataCell(Text(item.gpm.toString())),
        DataCell(Icon(Icons.delete), onTap: () async{ 
          setState(() {
            Controller.fl.getItems().remove(item);
          });
        }),
        DataCell(Icon(Icons.edit), onTap: () async{ 
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EditPage())
          );
        }),
      ])).toList();

    return items;
  }
}


