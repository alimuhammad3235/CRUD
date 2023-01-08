import 'package:flutter/material.dart';
import 'package:profour/contacts.dart';
import 'package:profour/utils/list.dart';

class AddPerson extends StatefulWidget {
  const AddPerson({super.key});

  @override
  State<AddPerson> createState() => _AddPersonState();
}

class _AddPersonState extends State<AddPerson> {
 addUser() {
    setState(() {
      if (nameTextController.text != '') {
       Mylist.names.add(nameTextController.text);
        Mylist.surname.add(nameTextController1.text);
        Mylist.phno.add(nameTextController2.text);
        print(Mylist.names);
        print(Mylist.surname);
        print(Mylist.phno);
      }
      nameTextController.clear();
    });
  }
  static TextEditingController nameTextController = TextEditingController();
   static TextEditingController nameTextController1 = TextEditingController();
   static TextEditingController nameTextController2 = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         iconTheme: IconThemeData(
    color: Colors.black, 
  ),
  elevation: 3,
        backgroundColor: Color(0xffFFFFFF),
        title: Text("Add",style: TextStyle(fontFamily: 'Roboto',fontSize: 20,fontWeight: FontWeight.w500,color: Color(0xff000000)),),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: GestureDetector(
              onTap: (){
                addUser();
                Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const MyContacts()));
              },
              child: Icon(Icons.check)),
          ),
        ],
      ),
      body: Column(
        children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            child: Text("Name",style: TextStyle(fontFamily: 'Roboto-Regular',fontSize: 16,fontWeight: FontWeight.w400,color: Color(0xff000000)),),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: TextField(
            controller: nameTextController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  
              ),
                 enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Color(0xffD9D9D9),
          ),
      ),
      hintText: "Enter Name", 
          fillColor: Colors.white, 
  ),),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            child: Text("Surname",style: TextStyle(fontFamily: 'Roboto-Regular',fontSize: 16,fontWeight: FontWeight.w400,color: Color(0xff000000)),),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: TextField(
            controller: nameTextController1,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  
              ),
                 enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Color(0xffD9D9D9),
          ),
         
      ),
      hintText: "Enter surname", 
          fillColor: Colors.white, 
  ),),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            child: Text("Phone number",style: TextStyle(fontFamily: 'Roboto-Regular',fontSize: 16,fontWeight: FontWeight.w400,color: Color(0xff000000)),),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: TextField(
            controller: nameTextController2,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
              ),
                 enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Color(0xffD9D9D9),
          ),
      ),
      
      hintText: "+998  _ _   _ _ _   _ _   _ _", 
          fillColor: Colors.white,
        
          
  ),),
        ),
        ],
      ),
    );
  }
}