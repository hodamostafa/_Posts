import 'package:flutter/material.dart';


class Details extends StatelessWidget {
     var id, title, body;
     Color? color;
     Color? color2;

     Details(this.id, this.body, this.title,this.color,this.color2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color2,
     appBar : AppBar(
       backgroundColor: color,
       elevation: 10,
       toolbarHeight: 100,
      title: Text(id.toString(),style: TextStyle(fontSize: 19)),
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.vertical(
           bottom: Radius.circular(30),
         ),
       ),
     ),
     body : Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25,left: 10,right: 20),
            child: Expanded(
              child: Container(
                // color: Colors.cyan,
                height: 60,
                child: Text(title ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 27,color: Colors.white),),
                ),
              ),
            ),
          const Divider(
            color: Colors.white60,
          ),
  Padding(
    padding: const EdgeInsets.all(10),
    child: Expanded(
      child: Container(
       // color: Colors.cyan,
      height: 200,
      child: Text(body ,style: TextStyle(fontSize: 20,color: Colors.grey),),
    ),
  ),
)
        ],
      )
    );
  }
}
