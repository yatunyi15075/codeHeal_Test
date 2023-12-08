import 'package:flutter/material.dart';

class DoctorList extends StatelessWidget {
  const DoctorList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.more_vert),
            SizedBox(width: 8.0),
            Text("Doctors List"),
            Spacer(),
            CircleAvatar(
              backgroundImage: AssetImage('assets/img1.jpg'),
              radius: 20.0,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Category Section
              Row(
                children: [
                  Text("Category"),
                  Spacer(),
                  Text(
                    "See all",
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                  Icon(Icons.arrow_forward),
                ],
              ),
              SizedBox(height: 10.0),

              //Boxes with mother, baby, checkup, eye, tooth imgs/section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildCircularBox('assets/img1.jpg', 'Mother'),
                  buildCircularBox('assets/img1.jpg', 'Baby'),
                  buildCircularBox('assets/img1.jpg', 'Checkup'),
                  buildCircularBox('assets/img1.jpg', 'Eye'),
                  buildCircularBox('assets/img1.jpg', 'Tooth'),
                ],
              ),
              SizedBox(height: 20.0),

              //Available Doctors
              Text("Available Doctors"),
              SizedBox(height: 10.0),

              //ScrollableSections
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    buildDoctorSection('assets/img1.jpg'),
                    buildDoctorSection('assets/img1.jpg'),
                    buildDoctorSection('assets/img1.jpg'),
                    buildDoctorSection('assets/img1.jpg'),
                    buildDoctorSection('assets/img1.jpg'),
                    buildDoctorSection('assets/img1.jpg'),
                    buildDoctorSection('assets/img1.jpg'),
                    buildDoctorSection('assets/img1.jpg'),
                    buildDoctorSection('assets/img1.jpg'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Appointments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_pharmacy),
            label: 'Appointments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.healing),
            label: 'Health Checker',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget buildCircularBox(String imagePath, String text) {
    return Column(
      children: [
        ClipOval(
          child: Image.asset(
            imagePath,
            width: 50.0,
            height: 50.0,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          text,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget buildDoctorSection(String imagePath) {
    return Container(
      width: 150.0,
      height: 200.0,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.blue,
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
            child: Image.asset(
              imagePath,
              width: 150.0,
              height: 100.0,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10.0),
          //Dummy data for the second part of the section
          Container(
            height: 90.0,
            color: Colors.white,
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Doctor $index'),
                  subtitle: Text('Speciality $index'),
                  leading: CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
