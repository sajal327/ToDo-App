import 'package:flutter/material.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import '../Utils/Const.dart';
import 'package:provider/provider.dart';
import '../Provider/App_Provider.dart';
import 'Add_Task_Screens.dart';


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
        color: const Color(0xFFC60240),
        //color: const Color(0xFFca1b53),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Myred1,
            elevation: 0,
            title: const Text("ToDo App"),
            centerTitle: true,
          ),

          body: Consumer<todoProvider>(builder: (context,provider,child){
            return ListView.builder(
                itemCount: provider.Task.length,
                itemBuilder: (context,index){
                  return CheckboxListTile(
                    value: provider.Task[index].doneOrNot,
                    onChanged: (value){
                      provider.setDoOrNotAtTheIndex(index, value!);
                      // setState(() {
                      //   provider.Task[index].doneOrNot = value!;
                      // });
                    },
                    activeColor: Color(0xFFFA5463),
                    title: provider.Task[index].doneOrNot?
                    Text(provider.Task[index].title,
                      style: const TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    )
                        : Text(provider.Task[index].title,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  );
                }
            );
          },),


          floatingActionButton: FloatingActionButton(
            backgroundColor: const Color(0xFF980340),
            onPressed: (){
              Navigator.push(context,
                MaterialPageRoute(builder: (context) =>  Add_Task_Screens()),
              );
            },
            child: const Icon(Icons.add),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        )
    );
  }
}