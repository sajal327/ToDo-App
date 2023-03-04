import 'package:flutter/material.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:provider/provider.dart';
import '../Provider/App_Provider.dart';
import '../Utils/Const.dart';


class Add_Task_Screens extends StatelessWidget {
  Add_Task_Screens({Key? key}) : super(key: key);

  late String _Task = "";
  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      //color: myRed,
      color: const Color(0xFFC60240),
      child: Scaffold(
        backgroundColor: Colors.white,
        //backgroundColor: const Color(0xFFC60240),
        appBar: AppBar(
          backgroundColor: const Color(0xFFC60240),//myRed,
          //title: const Text("Enter Your Task",
          //style: TextStyle(
          //fontWeight: FontWeight.bold
          //),),
          elevation: 0,
        ),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Enter Your Task",
              style: TextStyle(
                color: myRed,
                fontSize: 22,
                //fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 50),
              height: 250,
              width: 300,
              padding: const EdgeInsets.all(17),
              decoration: BoxDecoration(
                border: Border.all(color: myRed),
                borderRadius: BorderRadius.circular(20),
              ),
              //alignment: Alignment.center,
              child: TextField(
                onChanged: (value){
                  //print(value);
                  _Task = value;
                },
                autofocus: true,
                cursorHeight : 20.0,
                style: const TextStyle(
                    fontSize : 22.0,
                    color: Colors.teal),
                decoration: const InputDecoration(
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    //hintStyle: TextStyle(color: Colors.teal),
                    border: InputBorder.none
                ),
              ),
            ),

          ],
        ),

        floatingActionButton: Consumer<todoProvider>(builder: (context,provider,child){
          return GestureDetector(
            onTap: (){
              provider.setANewTask(_Task);
              Navigator.pop(context);
            },
            child: Container(
              height: 50,
              width: 130,
              decoration: BoxDecoration(
                color: myRed,
                borderRadius: BorderRadius.circular(18),
              ),
              alignment: Alignment.center,
              child: const Text("Add Task",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
            ),
          );
        },),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      ),
    );
  }
}
