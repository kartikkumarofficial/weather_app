import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ScrollSheet extends StatefulWidget {
  const ScrollSheet({super.key});

  @override
  State<ScrollSheet> createState() => _ScrollSheetState();
}

class _ScrollSheetState extends State<ScrollSheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        color: Colors.purple,
        child: DraggableScrollableSheet(
          initialChildSize: 0.3,
          minChildSize: 0.1,
          maxChildSize: 0.8,
          builder: (context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.transparent.withOpacity(0.5),
                borderRadius: BorderRadius.only(topRight: Radius.circular(40),topLeft: Radius.circular(40))
              ),
              child:Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Container(
                          height: Get.width*0.018,
                          width: Get.width*0.15,
                          decoration: BoxDecoration(
                              color: Color(0xFF333333).withOpacity(0.4),
                              borderRadius: BorderRadius.circular(030)
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text('Hourly Forecast',style: TextStyle(color: Colors.white60,fontSize: 14,fontWeight: FontWeight.bold ,
                            shadows: [BoxShadow(color: Colors.black,offset: Offset(0, 1),blurRadius: 2,spreadRadius: 2)]),),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: Get.width*0.3),
                        child: Text('Weekly Forecast',style: TextStyle(color: Colors.white60,fontSize: 14,fontWeight: FontWeight.bold ,
                            shadows: [BoxShadow(color: Colors.black,offset: Offset(0, 1),blurRadius: 2,spreadRadius: 2)]),),
                      )
                    ],
                  ),
                  Divider(color: Colors.white30.withOpacity(0.5),thickness: 0.5,),
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                      itemCount: 6,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {

                        DateTime now = DateTime.now();
                        DateTime hourTime = now.add(Duration(hours: index - 1));
                        String formattedHour = DateFormat.j().format(hourTime);

                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          padding: EdgeInsets.all(10),
                          width: 60,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [ Color.fromRGBO(100,69,115,1.0),Color.fromRGBO(56,55,96,1.0)]),
                            borderRadius: BorderRadius.circular(35),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                formattedHour,
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),
                              ),
                              SizedBox(height: 8),
                              Icon(Icons.wb_sunny, size: 24,color: Colors.white,),
                              SizedBox(height: 8),
                              Text(
                                "${20 + index}°C",
                                style: TextStyle(fontSize: 14,color: Colors.white),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  )
                  // ListView.builder(
                  //   itemCount: 4,
                  //   scrollDirection: Axis.horizontal,
                  //   itemBuilder: (context, index) {
                  //     return Container(
                  //       height: Get.height*0.1,
                  //       width: Get.width*0.1,
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(20)
                  //       ),
                  //       child:Column(
                  //         children: [
                  //           Text()
                  //         ],
                  //       ),
                  //
                  //     );
                  //   },
                  // )


                ],
              ) ,
            );
          },),
      ),
    );
  }
}






