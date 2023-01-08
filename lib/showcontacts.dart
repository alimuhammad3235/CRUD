import 'package:flutter/material.dart';
import 'package:profour/addperson.dart';
import 'package:profour/contacts.dart';
import 'package:profour/utils/images_path.dart';
import 'package:profour/utils/list.dart';

class ShowContacts extends StatefulWidget {
  const ShowContacts({super.key});

  @override
  State<ShowContacts> createState() => _ShowContactsState();
}

class _ShowContactsState extends State<ShowContacts> {
  Widget custext=Text("Contacts",style: TextStyle(fontFamily: 'Roboto',fontSize: 20,fontWeight: FontWeight.w500,color: Color(0xff000000)));
  Icon cusicon = Icon(Icons.search,size: 35,color: Colors.black,);
  deleteUser(dltkr) {
    setState(() {
      Mylist.names.removeAt(dltkr);
      Mylist.phno.removeAt(dltkr);
    });
  }
  String output='';
  updateUser(chkit) {
    setState(() {
      Mylist.phno[chkit] = output;
    });
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
                    PopupMenuItem(value: 1, child: Text("Delete")),
                  ])
        ],
      ),
      body: ListView.builder(
        itemCount: Mylist.names.length,
          itemBuilder: ((context, index){
        return ListView(
           shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
          children: [
            Center(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 100,left: 90),
                    child: Image.asset(Constimage.img3,height: 120,width: 200,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40,top: 150),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            showDialog(context: context, builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Delete contact",style: TextStyle(fontFamily: 'Roboto',fontSize: 18,fontWeight: FontWeight.w600)),
                                content: Text("Are you sure you want to remove Bobur Mavlonov from your contacts?",style: TextStyle(fontFamily: 'Roboto',fontSize: 15,fontWeight: FontWeight.w400),),
                                actions: [
                                  Text("NO",style: TextStyle(fontFamily: 'Roboto',fontSize: 16,fontWeight: FontWeight.w600)),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15,left: 20),
                                    child: GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          deleteUser(index);
                                        });
                                        Navigator.of(context).pop();
                                         Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyContacts()));

                                      },
                                      child: Text("YES",style: TextStyle(fontFamily: 'Roboto',fontSize: 16,fontWeight: FontWeight.w600,color: Color(0xffFF0000)))),
                                  ),
                                ],
                              );
                            });
                          },
                          child: Icon(Icons.delete)),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: GestureDetector(
                        onTap: (){
                          updateUser(index);
                            Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AddPerson()));
                        },
                        child: Icon(Icons.edit)),
                    ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          
            Padding(
              padding: const EdgeInsets.only(top: 30,left: 10),
              
              child: Text(Mylist.names[index],style: TextStyle(fontFamily: 'Roboto',fontSize: 22,fontWeight: FontWeight.w500,color: Colors.black)),
            ),
            
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(Mylist.phno[index],style: TextStyle(fontFamily: 'Roboto',fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black)),
                    ),
                 Padding(
                   padding: const EdgeInsets.only(left: 140),
                   child: Container(
                     width: 50,
                     height: 50,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(30),
                       color: Color(0xff08AE2D),
                     ),
                     child: Icon(Icons.call,color: Colors.white,),
                   ),
                 ),
            Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                     width: 50,
                     height: 50,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(30),
                       color: Color(0xffE9AD13),
                     ),
                     child: Icon(Icons.message,color: Colors.white,),
                   ),
            ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Call history",style: TextStyle(fontFamily: 'Roboto',fontSize: 16,fontWeight: FontWeight.w300,color: Colors.black))),
              ),
              checkcall("Apr 27, 14:16", "+998901234567", "Didn’t connect",Icons.call_made,Colors.black),
              checkcall("Apr 20, 10:35", "+998901234567", "Rang 5 times",Icons.call_missed,Color(0xffFF2121)),
              checkcall("Mar 05, 19:23", "+998901234567", "Outgoing 15 min 12 sec",Icons.call_made,Colors.black),
              checkcall("Feb 12, 08:03", "+998901234567", "Incoming 30 sec",Icons.call_received,Colors.black),
          ],
        );
  }),
    ));
  }
}

checkcall(String title1,String number,activity,IconData icon,Color colorr){
  return  ListTile(
              title: Text(title1,style: TextStyle(fontFamily: 'Roboto',fontSize: 16,fontWeight: FontWeight.w600,color: colorr)),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Text(number,style: TextStyle(fontFamily: 'Roboto',fontSize: 12,fontWeight: FontWeight.w600,)),
                    Icon(icon,size: 17,color: colorr,),
                  ],
                ),
              ),
              trailing:  Text(activity,style: TextStyle(fontFamily: 'Roboto',fontSize: 12,fontWeight: FontWeight.w300,)),
            );
}