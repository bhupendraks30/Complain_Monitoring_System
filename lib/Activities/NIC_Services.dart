import 'package:flutter/material.dart';

class NIC_Services extends StatefulWidget {
  const NIC_Services({super.key});

  @override
  State<NIC_Services> createState() => _NIC_ServicesState();
}

class _NIC_ServicesState extends State<NIC_Services> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NIC Services",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.purple.shade500,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: GridView.builder(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: double.infinity,mainAxisSpacing:5,mainAxisExtent: 300,), itemBuilder: (context, index) {
            return GrievanceCardItem();
          },itemCount: 5,),
        ),
      ),

    );
  }
}

class GrievanceCardItem extends StatefulWidget {
  const GrievanceCardItem({super.key});

  @override
  State<GrievanceCardItem> createState() => _GrievanceCardItemState();
}

class _GrievanceCardItemState extends State<GrievanceCardItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        child: Container(
          width: double.infinity,
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [Text('NIC Sevices',style: TextStyle(color: Colors.white, fontSize: 18),),
                  // Text("123456789",style: TextStyle(color: Colors.white, fontSize: 18),)
                ],),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Row(children: [Text('Grievance Calegory :',style: TextStyle(color: Colors.white, fontSize: 18),),Text("123456789",style: TextStyle(color: Colors.white, fontSize: 18),)],),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Row(children: [Text('Grievance Description :',style: TextStyle(color: Colors.white, fontSize: 18),),Text("123456789",style: TextStyle(color: Colors.white, fontSize: 18),)],),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Row(children: [Text('Grievance Register Date :',style: TextStyle(color: Colors.white, fontSize: 18),),Text("123456789",style: TextStyle(color: Colors.white, fontSize: 18),)],),
              // ),
              //
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Row(children: [Text('Grievance Status :',style: TextStyle(color: Colors.white, fontSize: 18),),Text("123456789",style: TextStyle(color: Colors.white, fontSize: 18),)],),
              // ),
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.green.shade400,
              borderRadius: BorderRadius.circular(12)

          ),
        ),
      ),
    );
  }
}

