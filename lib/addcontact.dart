import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:profour/addperson.dart';
import 'package:profour/utils/images_path.dart';

class AddContacts extends StatefulWidget {
  const AddContacts({super.key});

  @override
  State<AddContacts> createState() => _AddContactsState();
}

class _AddContactsState extends State<AddContacts> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Contact",style: TextStyle(fontFamily: 'Roboto',fontSize: 20,fontWeight: FontWeight.w500,color: Color(0xff000000)),),
        actions: [
          Row(
            children: [
          Icon(Icons.search,color: Colors.black,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Icon(Icons.more_vert,color: Colors.black,),
          ),

            ],
          )
        ],
      ),floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const AddPerson()));
        },child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          Center(child: Padding(
            padding: const EdgeInsets.only(top: 230),
            child: Image.asset(Constimage.img1,),
          ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text("You have no contacts yet",style: TextStyle(fontFamily: 'Roboto',fontSize: 15,),),
          ),
         
        ],
      ),
    );
  }
}