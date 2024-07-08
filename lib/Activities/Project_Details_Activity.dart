import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Project_Details_Activity extends StatefulWidget {
  var complainDetails;
  Project_Details_Activity(this.complainDetails, {super.key});

  @override
  State<Project_Details_Activity> createState() =>
      _Project_Details_ActivityState(complainDetails);

}

class _Project_Details_ActivityState
    extends State<Project_Details_Activity> {
  var dataList;

  _Project_Details_ActivityState(this.dataList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Project Status'),
        elevation: 15,
        backgroundColor:Colors.blue.shade300,
      ),
      body: Center(
        child: Card(
          child: Container(
            width: double.infinity,
            height: 500,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20,),
                  Row(mainAxisAlignment:MainAxisAlignment.center,children: [Text('Complaint Details',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)],),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          'Project Name :',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Text(
                          dataList['project_tittle'],
                          // '652255484',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Text(
                            'Project Description :',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          Text(
                            dataList['description'],
                            // '652255484',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          'Project Budget :',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Text(
                          dataList['project_budget'],
                          // '652255484',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          'Project Register Date :',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Text(
                          dataList['date_submitted'].toString().substring(0, 10),
                          // '652255484',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          'Project Duration :',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Text(
                          dataList['project_duration'],
                          // '652255484',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          'Project Status :',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Text(
                          dataList['status'],
                          // '652255484',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(mainAxisAlignment:MainAxisAlignment.center,children: [Text('Hod Details',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)],),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          'Name Of Dept. :',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Text(
                          "${dataList['hod_department']}",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          'Name of HOD :',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Text(
                          dataList['hod_full_name'],
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Text(
                            'HOD Contact Number :',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          Text(
                            dataList['hod_contact'],
                            style: TextStyle(color: Colors.white, fontSize: 18,),textAlign: TextAlign.justify,
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          'Email id of HOD :',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Text(
                          dataList['how_mail'].toString().substring(0, 10),
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.blue.shade300,
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }
}
