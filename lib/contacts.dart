import 'package:flutter/material.dart';
import 'package:profour/addperson.dart';
import 'package:profour/showcontacts.dart';
import 'package:profour/utils/images_path.dart';
import 'package:profour/utils/list.dart';

class MyContacts extends StatefulWidget {
  const MyContacts({super.key});
  @override
  State<MyContacts> createState() => _MyContactsState();
}

class _MyContactsState extends State<MyContacts> {
  Widget custext=Text("Contacts",style: TextStyle(fontFamily: 'Roboto',fontSize: 20,fontWeight: FontWeight.w500,color: Color(0xff000000)));
  Icon cusicon = Icon(Icons.search,size: 35,color: Colors.black,);

  deleteUser() {
    setState(() {
      Mylist.names.clear();
      Mylist.phno.clear();
    });
    print(Mylist.names);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: custext,
          iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
         actions: [
          InkWell(

            child:cusicon,
            onTap: (){
              if(this.cusicon.icon==Icons.search){
              this.custext=TextField(
                    decoration: InputDecoration( 
                      hintText: "Search", 
                    border: InputBorder.none,
                    ),
              );
              this.cusicon = Icon(Icons.cancel,color: Colors.black,);
              setState(() {
                
              });
              }else{
                this.custext=Text("Contacts",style: TextStyle(fontFamily: 'Roboto',fontSize: 20,fontWeight: FontWeight.w500,color: Color(0xff000000)));
                this.cusicon=Icon(Icons.search,color: Colors.black,);
                setState(() {  
                });
              };
            },
          // Icon(Icons.search,color: Colors.black,),
           ),
          PopupMenuButton(
              icon: Icon(
                Icons.more_vert_outlined,
                color: Colors.black,
              ),
              itemBuilder: (context) => [
                    PopupMenuItem(
                        value: 1,
                        child: PopupMenuButton(
                          child: Row(
                            children: [
                              Text("Sort by"),
                              Icon(
                                Icons.arrow_right,
                                color: Colors.black,
                              ),
                            ],
                          ),
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: 1,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.arrow_left,
                                    color: Colors.black,
                                  ),
                                  Text(
                                    "Sort by",
                                  style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                            PopupMenuItem(
                              value: 2,
                              child: Text("A-Z"),
                            ),
                            PopupMenuItem(
                              value: 3,
                              child: Text("Z-A"),
                            ),
                          ],
                        )),
                    PopupMenuItem(value: 1, child: GestureDetector(
                      onTap: () {
                         showDialog(context: context, builder: (BuildContext context) {
                            return AlertDialog(
                              
                              title: Text("Delete contact",style: TextStyle(fontFamily: 'Roboto',fontSize: 18,fontWeight: FontWeight.w600)),
                              content: Text("Are you sure you want to remove Bobur Mavlonov from your contacts?",style: TextStyle(fontFamily: 'Roboto',fontSize: 15,fontWeight: FontWeight.w400),),
                              actions: [
                                Text("NO",style: TextStyle(fontFamily: 'Roboto',fontSize: 16,fontWeight: FontWeight.w600)),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.pop(context);
                                    deleteUser();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 15,left: 20),
                                    child: Text("YES",style: TextStyle(fontFamily: 'Roboto',fontSize: 16,fontWeight: FontWeight.w600,color: Color(0xffFF0000),
                                    ),
                                    
                                    ),
                                  ),
                                ),
                              ],
                              
                            );
                          });
                      },
                      child: Text("Delete"))),
                  ])
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const AddPerson()));
      },child: Icon(Icons.add),),
      body: 
  
      ListView.builder(
          
          itemCount: Mylist.phno.length,
          itemBuilder: ((context, index) {

            return ListView(
              shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
            children: [
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GestureDetector(
              onTap: (){
               Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const ShowContacts()));
              },
              child: ListTile(
                      leading: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage(Constimage.img2,),
                      ),
                      title:Text(Mylist.names[index],style: TextStyle(fontFamily: 'Roboto',fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xff000000))
                      ),
                      
                      subtitle: Text(Mylist.phno[index],style: TextStyle(fontFamily: 'Roboto',fontSize: 14,fontWeight: FontWeight.w500,color: Color(0xff8B8B8B))), 
                      trailing: Icon(Icons.call,color: Colors.green,),
              ),
            ),
          ),
            ],
          );
  }),
    ));
  }
}


