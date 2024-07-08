import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ApiLink.dart';
import '../UserDetails.dart';

class Registered_Project_Activity extends StatefulWidget {
  const Registered_Project_Activity({super.key});

  @override
  State<Registered_Project_Activity> createState() => _Registered_Project_ActivityState();
}

class _Registered_Project_ActivityState extends State<Registered_Project_Activity> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProjects();
  }

  var listOfGrievance = [];
  late final SharedPreferences sharedPreferences;
  int uid = -1;
  var role = -1;

  void getProjects()async{
    try{
      sharedPreferences = await SharedPreferences.getInstance();
      setState(() {
        role = sharedPreferences.getInt(UserDetails.ROLE) ?? -1;
      });
          var response = await get(Uri.parse(ApiLink.registerProjectApi),);
          var data = jsonDecode(response.body);
          setState(() {
            listOfGrievance = data['project_details'];
          });
    }catch (e){
      print('$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Projects",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.purple.shade500,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: GridView.builder(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: double.infinity,mainAxisSpacing:5,mainAxisExtent: 300,), itemBuilder: (context, index) {
            return GrievanceCardItem(listOfGrievance[index],role);
          },itemCount: listOfGrievance.length,),
        ),
      ),
    );
  }
}

class GrievanceCardItem extends StatefulWidget {
  var dataList;
  var role;
  GrievanceCardItem(this.role, this.dataList, {super.key});

  @override
  State<GrievanceCardItem> createState() =>
      _GrievanceCardItemState(dataList, role);
}

class _GrievanceCardItemState extends State<GrievanceCardItem> {
  var dataList;
  var role;

  _GrievanceCardItemState(this.role, this.dataList);

  String? _selectedValue;

  var status = ['Pending', 'Approved', 'Reject'];
  bool visible=true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _selectedValue=dataList['status'];
    });
  }


  @override
  Widget build(BuildContext context) {
    if(role==0){
      setState(() {
        visible=false;
      });
    }else{
      setState(() {
        visible=true;
      });
    }
    return Scaffold(
      body: Card(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Project Details',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'Project Id :',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Text(
                      "${dataList['id']}",
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
                      'Project Name :',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Text(
                      dataList['project_tittle'],
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
                        'Grievance Description :',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Text(
                        dataList['description'],
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
                      'Project Register Date :',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Text(
                      dataList['date_submitted'].toString().substring(0, 10),
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
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )
                  ],
                ),
              ),
              Visibility(
                visible: visible,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        'Set Grievance Status :',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      DropdownButton(
                        elevation: 12,
                        itemHeight: 50,
                        focusColor: Colors.red.shade100,
                        iconEnabledColor: Colors.black,
                        dropdownColor: Colors.lightBlue.shade50,
                        menuMaxHeight: 400,
                        borderRadius: BorderRadius.circular(12),
                        iconSize: 35,
                        alignment: Alignment.center,
                        value: _selectedValue,
                        hint: Text(
                          'set status',
                          style: TextStyle(fontSize: 18),
                        ),
                        onChanged: (String? newValue) async{
                          setState(() {
                            _selectedValue = newValue;
                          });

                          var response = await post(
                              Uri.parse(ApiLink.updateGrievanceStatus),
                              headers: {'content-type': 'application/json'},
                              body: jsonEncode({
                                'cid': dataList['cid'],
                                'status':_selectedValue
                              }));
                          var data = jsonDecode(response.body);
                          if (data['code'] == '200') {
                            Fluttertoast.showToast(msg: data['message']);
                          } else {
                            Fluttertoast.showToast(msg: data['message']);
                          }

                        },
                        items: status
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.blue.shade300,
              borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}