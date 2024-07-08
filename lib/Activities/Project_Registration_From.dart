import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';

import '../ApiLink.dart';
import 'Main_Activity.dart';

class Project_Registration_From extends StatefulWidget {
  const Project_Registration_From({super.key});

  @override
  State<Project_Registration_From> createState() =>
      _Project_Registration_FromState();
}

class _Project_Registration_FromState
    extends State<Project_Registration_From> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailFocusNode = FocusNode();
    nameFocusNode = FocusNode();
    mobileFocusNode = FocusNode();
    addressFocusNode = FocusNode();
    projectTitleFocusNode = FocusNode();
    durationFocusNode = FocusNode();
    budgetFocusNode = FocusNode();
    projectDescFocusNode = FocusNode();
    departmentFocusNode = FocusNode();
  }

  // controller of NameTextField
  var nameController = TextEditingController();
  // Controller of Email TextField
  var emailController = TextEditingController();
  var mobileController = TextEditingController();
  var addressController = TextEditingController();
  var projectTitleController=TextEditingController();
  var durationController=TextEditingController();
  var budgetController=TextEditingController();
  var projectDescController=TextEditingController();
  var departmentController=TextEditingController();
  // for email focusNode
  late FocusNode emailFocusNode;
  late FocusNode mobileFocusNode;
  late FocusNode addressFocusNode;
  late FocusNode projectTitleFocusNode;
  late FocusNode durationFocusNode;
  late FocusNode budgetFocusNode;
  late FocusNode projectDescFocusNode;
  late FocusNode departmentFocusNode;

  // for email focusNode
  late FocusNode nameFocusNode;
  // used for error message
  String? emailStringError = null;
  String? mobileStringError = null;
  String? addressStringError = null;
  String? projectTitleStringError = null;
  String? durationStringError = null;
  String? budgetStringError = null;
  String? projectDescStringError = null;
  String? descriptionStringError = null;
  String? departmentStringError = null;
// used for error name
  String? nameStringError = null;
  String? _selectedValue;


  // used to perform validation
  void checkValidationForEmail() {
    // for Email TextField
    bool isValidEmail = EmailValidator.validate(emailController.text.trim());
    if (!isValidEmail && !emailController.text.isEmpty) {
      setState(() {
        emailStringError = 'Please enter a valid email';
        emailFocusNode.requestFocus();
        return;
      });
    } else if (emailController.text.isEmpty) {
      setState(() {
        emailStringError = 'Email field is empty';
        emailFocusNode.requestFocus();
        return;
      });
    } else {
      setState(() {
        emailStringError = null;
        emailFocusNode.unfocus();
      });
    }
  }

  // used to perform validation
  void checkValidationForName() {
    if (nameController.text.isEmpty) {
      setState(() {
        nameStringError = 'Name field is empty';
        nameFocusNode.requestFocus();
        return;
      });
    } else {
      setState(() {
        nameStringError = null;
        nameFocusNode.unfocus();
      });
    }
  }
  void checkValidationFordepartment() {
    if (departmentController.text.isEmpty) {
      setState(() {
        departmentStringError = 'Name field is empty';
        departmentFocusNode.requestFocus();
        return;
      });
    } else {
      setState(() {
        departmentStringError = null;
        departmentFocusNode.unfocus();
      });
    }
  }

  void checkValidationForMobile() {
    if (mobileController.text.isEmpty) {
      setState(() {
        mobileStringError = 'Mobile Number field is empty';
        mobileFocusNode.requestFocus();
        return;
      });
    } else {
      setState(() {
        mobileStringError = null;
        mobileFocusNode.unfocus();
      });
    }
  }

  void checkValidationForAddress() {
    if (addressController.text.isEmpty) {
      setState(() {
        addressStringError = 'Address field is empty';
        addressFocusNode.requestFocus();
        return;
      });
    } else {
      setState(() {
        addressStringError = null;
        addressFocusNode.unfocus();
      });
    }
  }

  void checkValidationForprojectTitle() {
    if (projectTitleController.text.isEmpty) {
      setState(() {
        projectTitleStringError = 'Project Title field is empty';
        projectTitleFocusNode.requestFocus();
        return;
      });
    } else {
      setState(() {
        projectTitleStringError = null;
        projectTitleFocusNode.unfocus();
      });
    }
  }
  void checkValidationForduration() {
    if (durationController.text.isEmpty) {
      setState(() {
        durationStringError = 'Duration field is empty';
        durationFocusNode.requestFocus();
        return;
      });
    } else {
      setState(() {
        durationStringError = null;
        durationFocusNode.unfocus();
      });
    }
  }

  void checkValidationForbudget() {
    if (budgetController.text.isEmpty) {
      setState(() {
        budgetStringError = 'budget field is empty';
        budgetFocusNode.requestFocus();
        return;
      });
    } else {
      setState(() {
        budgetStringError = null;
        budgetFocusNode.unfocus();
      });
    }
  }

  void checkValidationForprojectDesc() {
    if (projectDescController.text.isEmpty) {
      setState(() {
        projectDescStringError = 'Pin Code field is empty';
        projectDescFocusNode.requestFocus();
        return;
      });
    } else {
      setState(() {
        projectDescStringError = null;
        projectDescFocusNode.unfocus();
      });
    }
  }

  // void checkValidationForDescription() {
  //   if (descriptionController.text.isEmpty) {
  //     setState(() {
  //       descriptionStringError = 'Description field is empty';
  //       descriptionFocusNode.requestFocus();
  //       return;
  //     });
  //   } else {
  //     setState(() {
  //       descriptionStringError = null;
  //       descriptionFocusNode.unfocus();
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Project",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple.shade500,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'Personal Details',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.text,
                controller: nameController,
                focusNode: nameFocusNode,
                onTapOutside: (event) {
                  checkValidationForName();
                },
                decoration: InputDecoration(
                  errorText: nameStringError,
                  label: Text(
                    "Full Name Of HOD",
                    style: TextStyle(color: Colors.black),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.purple.shade500,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.purple.shade500,
                    ),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                ),
                cursorColor: Colors.purple.shade500,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                onTapOutside: (event) {
                  checkValidationForEmail();
                },
                focusNode: emailFocusNode,
                decoration: InputDecoration(
                  label: Text(
                    "Email of HOD",
                    style: TextStyle(color: Colors.black),
                  ),
                  errorText: emailStringError,
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.purple.shade500,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.purple.shade500,
                    ),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                ),
                cursorColor: Colors.purple.shade500,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: mobileController,
                focusNode: mobileFocusNode,
                onTapOutside: (event) {
                  checkValidationForMobile();
                },
                keyboardType: TextInputType.number,
                maxLength: 10,
                decoration: InputDecoration(
                  errorText: mobileStringError,
                  label: Text(
                    "Mobile Number Of HOD",
                    style: TextStyle(color: Colors.black),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.purple.shade500,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.purple.shade500,
                    ),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                ),
                cursorColor: Colors.purple.shade500,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.text,
                controller: departmentController,
                focusNode: departmentFocusNode,
                onTapOutside: (event) {
                  checkValidationFordepartment();
                },
                decoration: InputDecoration(
                  errorText: departmentStringError,
                  label: Text(
                    "Name of department",
                    style: TextStyle(color: Colors.black),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.purple.shade500,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.purple.shade500,
                    ),
                  ),
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                ),
                cursorColor: Colors.purple.shade500,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: addressController,
                focusNode: addressFocusNode,
                onTapOutside: (event) {
                  checkValidationForAddress();
                },
                maxLength: 1000,
                maxLines: null,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  errorText: addressStringError,
                  labelText: 'Address',
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  // used to decorate the focusedErrorBorder of Password TextField
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  // used to decorate the TextField when the it is enabled
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.purple.shade500,
                    ),
                  ),

                  // used to decorate the TextField when the it is Focused
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.purple.shade500,
                    ),
                  ),

                  // this contentPadding is used to set the height of the TextField
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                ),
                cursorColor: Colors.purple.shade500,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: projectTitleController,
                focusNode: projectTitleFocusNode,
                onTapOutside: (event) {
                  checkValidationForprojectTitle();
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  errorText: projectTitleStringError,
                  label: Text(
                    "Project Title",
                    style: TextStyle(color: Colors.black),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.purple.shade500,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.purple.shade500,
                    ),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                ),
                cursorColor: Colors.purple.shade500,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: durationController,
                focusNode: durationFocusNode,
                onTapOutside: (event) {
                  checkValidationForduration();
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  errorText: durationStringError,
                  label: Text(
                    "Duratioin",
                    style: TextStyle(color: Colors.black),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.purple.shade500,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.purple.shade500,
                    ),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                ),
                cursorColor: Colors.purple.shade500,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.text,
                controller: budgetController,
                focusNode: budgetFocusNode,
                onTapOutside: (event) {
                  checkValidationForbudget();
                },
                decoration: InputDecoration(
                  errorText: budgetStringError,
                  label: Text(
                    "Budgets",
                    style: TextStyle(color: Colors.black),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.purple.shade500,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.purple.shade500,
                    ),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                ),
                cursorColor: Colors.purple.shade500,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                maxLength: 100,
                keyboardType: TextInputType.text,
                controller: projectDescController,
                focusNode: projectDescFocusNode,
                onTapOutside: (event) {
                  checkValidationForprojectDesc();
                },
                decoration: InputDecoration(
                  errorText: projectDescStringError,
                  label: Text(
                    "Project Desccription",
                    style: TextStyle(color: Colors.black),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.purple.shade500,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.purple.shade500,
                    ),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                ),
                cursorColor: Colors.purple.shade500,
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async{
                    checkValidationForName();
                    checkValidationForEmail();
                    checkValidationForMobile();
                    checkValidationForAddress();
                    checkValidationForprojectTitle();
                    checkValidationForduration();
                    checkValidationForbudget();
                    checkValidationForprojectDesc();

                    if(!nameController.text.isEmpty && !emailController.text.isEmpty && !mobileController.text.isEmpty && !addressController.text.isEmpty && !projectTitleController.text.isEmpty && !durationController.text.isEmpty && !budgetController.text.isEmpty && !projectDescController.text.isEmpty && !durationController.text.isEmpty){
                      var header = {'content-type': "application/json"};
                      var body = jsonEncode({
                        // 'uid':uid,
                        'hod_full_name':nameController.text.toString().trim(),
                        'how_mail':emailController.text.toString().trim(),
                        'hod_contact':mobileController.text.toString().trim(),
                        'hod_department':departmentController.text.toString(),
                        'project_tittle':projectTitleController.text.toString().trim(),
                        'project_duration':durationController.text.toString().trim(),
                        'project_budget':budgetController.text.toString().trim(),
                        'description':projectDescController.text.toString().trim(),
                        'hod_address':addressController.text.toString().trim(),
                      });
                      final response = await post(Uri.parse(ApiLink.registerProjectApi),headers: header,body: body);
                      var data = jsonDecode(response.body);
                      var code = data['code'];
                      if(code=='200'){
                        var message= data['message'];
                        Fluttertoast.showToast(msg: message);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Main_Activity(),));
                      }else{
                        Fluttertoast.showToast(msg: 'Please fill the form correctly');
                      }
                    }else{
                      Fluttertoast.showToast(msg: 'fill the form correctly');
                    }



                  },
                  style: ElevatedButton.styleFrom(
                      overlayColor: Colors.purple.shade500,
                      backgroundColor: Colors.purple.shade500),
                  child: Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
