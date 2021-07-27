import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit/Create Fixture")
      ),
      body: EditBody(),
      floatingActionButton: FloatingActionButton(onPressed: (){},
      child: Icon(Icons.save_alt),),
    );
  }
}

class EditBody extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _EditBody();
  }
}

class _EditBody extends State<EditBody>{
  String choosen = 'One';
  String name = "";
  double numOfFixture = 0;
  double probOfUse = 0;
  double gpm = 0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isNumeric(String? s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  @override
  Widget build(BuildContext context) {
    double? width = MediaQuery.of(context).size.width;
    double padd = width*0.2;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: padd),
      child: Column(
        children: [
          Center(
            child: DropdownButton<String>(
                    value: choosen,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    elevation: 16,
                    onChanged: (String? newValue){
                      setState((){
                        choosen = newValue!;
                      });
                    },
                    items: <String>['One', 'Two', 'Three', 'Four']
                    .map<DropdownMenuItem<String>>(
                      (String value) {
                        return DropdownMenuItem<String>(value: value, child: Text(value));
                      }
                    ).toList()
          )),
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Enter your fixture name'
                    ),
                    validator: (String? value){
                      if(value == null || value.isEmpty){
                        return 'Please enter some text';
                      }else{
                        name = value;
                        return null;
                      }
                    },
                  )
                ),
                Center(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Enter your number of Fixture'
                    ),
                    validator: (String? value){
                      if(value == null || value.isEmpty){
                        return 'Please enter number of Fixture';
                      }else if(!isNumeric(value)){
                        return 'Please enter a valid number';
                      }else{
                        numOfFixture = double.parse(value);
                        return null;
                      }
                    },
                  )
                ),
                Center(child:TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Enter probability of Fixture Usage'
                    ),
                    validator: (String? value){
                      if(value == null || value.isEmpty){
                        return 'Please enter probability of Fixture Usage';
                      }else if(!isNumeric(value)){
                        return 'Please enter a valid number';
                      }else{
                        probOfUse = double.parse(value);
                        return null;
                      }
                    },
                  )
                ),
                Center(child:TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Enter Fixture Max Flow'
                    ),
                    validator: (String? value){
                      if(value == null || value.isEmpty){
                        return 'Please enter max GPM';
                      }else if(!isNumeric(value)){
                        return 'Please enter a valid number';
                      }else{
                        gpm = double.parse(value);
                        return null;
                      }
                    },
                  )
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: ElevatedButton(
                    child: Text('Submit'),
                    onPressed: (){
                      if(_formKey.currentState!.validate()){
                        // RUN
                      }
                    },
                  ),
                )
              ],
            )
          )
        ],
      ),
    );
  }
}