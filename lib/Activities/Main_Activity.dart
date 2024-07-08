import 'package:nic_suport_matrix/Activities/AboutUs_Activity.dart';
import 'package:nic_suport_matrix/Activities/Add_Project.dart';
import 'package:nic_suport_matrix/Activities/Project_Status.dart';
import 'package:nic_suport_matrix/Activities/Contact_Us_Activity.dart';
import 'package:nic_suport_matrix/Activities/Dashboard.dart';
import 'package:nic_suport_matrix/Activities/Feedback_Form_Activity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../UserDetails.dart';

class Main_Activity extends StatefulWidget {
  const Main_Activity({super.key});

  @override
  State<Main_Activity> createState() => _Main_ActivityState();
}

class _Main_ActivityState extends State<Main_Activity> {
  String profileImage = '';

  void getUserDataFromSharedPre() async {
    final sharedPref = await SharedPreferences.getInstance();
    setState(() {
      profileImage = sharedPref.getString(UserDetails.PROFILE) ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,

      child: Scaffold(
      appBar: AppBar(
        elevation: 15,
        backgroundColor: Colors.purple.shade500,
        iconTheme: IconThemeData(color: Colors.white),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
                flex: 2,
                child: Text( 'NIC Support Matrix',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w400),
                )),
            Expanded(
                flex: 0,
                child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/profile_activity');
                  },
                  icon: CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.grey.shade100,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: profileImage == ''
                            ? Icon(
                                Icons.person,
                                size: 35,
                              )
                            : Image.network(
                                profileImage,
                                fit: BoxFit.cover,
                                width: 42,
                                height: 42,
                              )),
                  ),
                ))
          ],
        ),
        bottom: TabBar(
          labelPadding: EdgeInsets.symmetric(horizontal: 0,vertical: 0),
          indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 3,
          labelColor: Colors.white,
          indicatorColor: Colors.purple.shade100,
          dividerHeight: double.infinity,
          unselectedLabelColor: Colors.black,
          tabs: [
            Tab(icon: Icon(Icons.dashboard),text: 'Dashboard',height: 50,),
            Tab(icon: Icon(Icons.add_chart_sharp),text: "Add Project", height:50, ),
            Tab(icon: Icon(Icons.pending_actions_outlined),text: "Status",height: 50,),
          ],
        ),
      ),

      drawer: Drawer(
        backgroundColor: Colors.purple.shade50,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: DrawerHeader(
                  padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                  decoration: BoxDecoration(
                      color: Colors.purple.shade500,
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    child: Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          SvgPicture.asset(
                            "assets/svg_logo/emblem_of_India.svg",
                            width: 80,
                            height: 80,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SvgPicture.asset(
                                "assets/svg_logo/nic_logo.svg",
                                width: 50,
                                height: 60,
                              ),
                              SizedBox(
                                height: 5,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
            ListTile(
              title: GestureDetector(
                  child: Row(
                    children: [
                      Icon(
                        Icons.contact_page,
                        size: 21,
                        color: Colors.purple.shade500,
                      ),
                      // SvgPicture.asset(
                      //   "assets/svg_logo/share_svg.svg",
                      //   width: 17,
                      //   height: 17,
                      // ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Contact Us"),
                    ],
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Contact_Us_Activity()));
                  }),
            ),

            ListTile(
                title: GestureDetector(
                    child: Row(
                      children: [
                        Icon(
                          Icons.feedback,
                          size: 21,
                          color: Colors.purple.shade500,
                        ),
                        // SvgPicture.asset(
                        //   "assets/svg_logo/about_us_svg.svg",
                        //   width: 17,
                        //   height: 17,
                        // ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("About Us"),
                      ],
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AboutUs_Activity()));
                    })),

            // GestureDetector(
            //   child: ListTile(
            //     title: Row(
            //       children: [
            //         SvgPicture.asset("assets/svg_icons/gallery_svg.svg",width: 15,height: 15,),
            //         SizedBox(width: 5,),
            //         Text("My Gallery"),
            //       ],
            //     ),
            //   ),
            // ),

            ListTile(
              title: GestureDetector(
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/svg_logo/feedback_icon.svg",
                        width: 17,
                        height: 17,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Feedback"),
                    ],
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Feedback_Form_Activity()));
                  }),
            ),

            ListTile(
              title: GestureDetector(
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/svg_logo/share_icon.svg",
                      width: 17,
                      height: 17,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Share"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      body: TabBarView(
        children: [
          Dashboard(),
          Add_Project(),
          Project_Status(),
        ],

      ),

      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: selectedIndex,
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "Home"),
      //     BottomNavigationBarItem(
      //         tooltip: 'Add Complaints',
      //         activeIcon: SvgPicture.asset(
      //           'assets/svg_logo/comlaint_reg2.svg',
      //           width: 22,
      //           height: 22,
      //         ),
      //         icon: SvgPicture.asset(
      //           'assets/svg_logo/comlaint_reg.svg',
      //           width: 22,
      //           height: 22,
      //         ),
      //         label: "Add Complaint"),
      //     BottomNavigationBarItem(
      //         activeIcon: SvgPicture.asset(
      //           'assets/svg_logo/status_2.svg',
      //           width: 25,
      //           height: 25,
      //         ),
      //         icon: SvgPicture.asset(
      //           'assets/svg_logo/status.svg',
      //           width: 25,
      //           height: 25,
      //         ),
      //         label: "Complaint Status"),
      //   ],
      //   onTap: (index) {
      //     setState(() {
      //       selectedIndex = index;
      //       title = list_of_Titles[index];
      //     });
      //   },
      //   selectedItemColor: Colors.purple.shade500,
      //   showUnselectedLabels: false,
      //   showSelectedLabels: false,
      // ),
    ));
  }
}
