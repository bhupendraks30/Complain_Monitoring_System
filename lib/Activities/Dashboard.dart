import 'package:fluttertoast/fluttertoast.dart';
import 'package:nic_suport_matrix/Activities/Contact_Us_Activity.dart';
import 'package:nic_suport_matrix/Activities/NIC_Services.dart';
import 'package:nic_suport_matrix/Activities/Registered_Project_Activity.dart';
import 'package:nic_suport_matrix/Activities/Hod_Details_Activity.dart';
import 'package:nic_suport_matrix/Activities/User_Details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nic_suport_matrix/UserDetails.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool visible=true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserRole();
  }
  void getUserRole()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int role = sharedPreferences.getInt(UserDetails.ID)??-1;

    Fluttertoast.showToast(msg: '$role');
    if (role!=-1){
      if(role==0){
        setState(() {
          visible=true;
          Fluttertoast.showToast(msg: 'hello');
        });
      }else{
        setState(() {
          visible=false;
        });
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView(
      padding: EdgeInsets.all(5),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 250, mainAxisExtent: 200),
      children: [
        Card(
          elevation: 10,
          child: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Registered_Project_Activity(),));
            },
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Registered_Project_Activity(),));
                    },
                    child: Icon(
                      Icons.note_add_outlined,
                      size: 45,
                    ),
                  ),
                  Text(
                    'All Projects',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.purple, borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ),
        Card(
          elevation: 10,
          child: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => NIC_Services(),));
            },
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => NIC_Services(),));
                    },
                    child: Icon(
                      Icons.pending_actions,
                      size: 45,
                    ),
                  ),
                  Text(
                    'NIC Services',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.green.shade800,
                  borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ),

        Card(
          elevation: 10,
          child: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Hod_Details_Activity(),));
            },
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Hod_Details_Activity(),));
                    },
                    child: Icon(
                      Icons.cloud_done,
                      size: 45,
                    ),
                  ),
                  Text(
                    'HOD Details',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ),
        Card(
          elevation: 10,
          child: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Contact_Us_Activity(),));
            },
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Contact_Us_Activity(),));
                    },
                    child: SvgPicture.asset('assets/svg_logo/hod_details_logo.svg',height: 50,width: 22,),
                  ),
                  Text(
                    'Contact Us',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ),
        Visibility(
          visible: visible,
          child: Card(
            elevation: 10,
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => User_Details(),));
              },
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => User_Details(),));
                      },
                      child: SvgPicture.asset(
                        'assets/svg_logo/file_done_logo.svg',
                        height: 45,
                        width: 45,
                      ),
                    ),
                    Text(
                      'Registered Users',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    color: Colors.yellow.shade700,
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
