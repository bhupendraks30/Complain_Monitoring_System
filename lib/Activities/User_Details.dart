import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ApiLink.dart';
import '../UserDetails.dart';

class User_Details extends StatefulWidget {
  const User_Details({super.key});

  @override
  State<User_Details> createState() => _User_DetailsState();
}

class _User_DetailsState extends State<User_Details> {
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

  void getProjects() async {
    try {
      sharedPreferences = await SharedPreferences.getInstance();
      setState(() {
        role = sharedPreferences.getInt(UserDetails.ROLE) ?? -1;
      });
      var response = await get(
        Uri.parse(ApiLink.getRegisterUserApi),
      );
      var data = jsonDecode(response.body);
      setState(() {
        listOfGrievance = data['user_details'];
      });
    } catch (e) {
      print('$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "All Users",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple.shade500,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: double.infinity,
              mainAxisSpacing: 5,
              mainAxisExtent: 350,
            ),
            itemBuilder: (context, index) {
              return GrievanceCardItem(listOfGrievance[index], role);
            },
            itemCount: listOfGrievance.length,
          ),
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
  late int id;
  late String email;

  bool visible = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      id = dataList['id'];
      email = dataList['email'];
    });
  }

  @override
  Widget build(BuildContext context) {
    if (role == 0) {
      setState(() {
        visible = false;
      });
    } else {
      setState(() {
        visible = true;
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
                      'User Details',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'User Id :',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    Text(
                      dataList['uid'],
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'User Full Name :',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    Text(
                      dataList['full_name'],
                      style: TextStyle(color: Colors.black, fontSize: 18),
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
                        'Email :',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      Text(
                        dataList['email'],
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.justify,
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
                      'Contact Number :',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    Text(
                      dataList['mobile_number'],
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'Address :',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    Text(
                      dataList['address'],
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Delete User',
                          style: TextStyle(color: Colors.white),
                        ),
                        IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) =>
                                    deleteAccountAlertDialogBox(),
                              );
                            },
                            icon: Icon(
                              Icons.delete,
                              color: Colors.white,
                            ))
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => deleteAccountAlertDialogBox(),
                    );
                  },
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.yellow.shade300,
              borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  Widget deleteAccountAlertDialogBox() {
    return Dialog(
      child: Container(
        height: 140,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // CircleAvatar(
                //   child: SvgPicture.asset(
                //     'assets/svg_icons/dhamtari_map_svg.svg',
                //     width: 29,
                //     height: 29,
                //   ),
                //   backgroundColor: Colors.white,
                // ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 8),
                  child: Text(
                    'NIC Support Matrix',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 22,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "Are you sure want to delete your account ?",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "No",
                      style: TextStyle(color: Colors.purple.shade500),
                    )),
                SizedBox(
                  width: 10,
                ),
                TextButton(
                    onPressed: () async {
                      try {
                        if (id != -1 && email != "") {
                          final body = jsonEncode({
                            "id": id,
                            "email": email,
                          });
                          final response =
                              await delete(Uri.parse(ApiLink.deleteUserAcApi),
                                  headers: {
                                    'Content-Type': 'application/json',
                                  },
                                  body: body);

                          final data = jsonDecode(response.body);
                          if (data != null) {
                            String message = data['message'];
                            final code = data['code'];
                            if (code == "200") {
                              Fluttertoast.showToast(msg: message);
                            } else {
                              Fluttertoast.showToast(msg: message);
                            }
                          }
                        }
                      } catch (e) {
                        print('Error message is : $e');
                      }
                    },
                    child: Text(
                      "Yes",
                      style: TextStyle(color: Colors.purple.shade500),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
