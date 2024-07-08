import 'package:nic_suport_matrix/Activities/Project_Registration_From.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Add_Project extends StatefulWidget {
  const Add_Project({super.key});

  @override
  State<Add_Project> createState() => _Add_ProjectState();
}

class _Add_ProjectState extends State<Add_Project> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Card(
        elevation: 10,
        child: InkWell(
          child: Container(
            width: 250,
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: SvgPicture.asset(
                    'assets/svg_logo/add_complaints2.svg',
                    height: 60,
                    width: 60,
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Project_Registration_From(),));
                  },
                ),
                Text(
                  'Click to Add Project',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            decoration: BoxDecoration(
                color: Colors.purple.shade500, borderRadius: BorderRadius.circular(12)),
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Project_Registration_From(),));
          },
        ),
      ),
    ));
  }
}
