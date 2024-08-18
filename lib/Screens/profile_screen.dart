import 'package:flutter/material.dart';
import 'package:programmer_health/Widgets/profile_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  String userName='John Doe';
  String userEmail='aman@gmail.com';
  int age=30;
  double height=175.0;
  double weight=70.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(onPressed: (){

          }, icon: Icon(Icons.edit)),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Center(
            child: CircleAvatar(
              radius: 50,
            backgroundImage: AssetImage(''),
            ),
          ),
          SizedBox(height: 16,),
          Center(
            child: Text(
              userName,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          SizedBox(height: 24,),
          ProfileInfoWidget(title: 'Emai', value:userEmail),
          ProfileInfoWidget(title: 'Age', value: age.toString()),
          ProfileInfoWidget(title: 'Height', value: '$height cm'),
          ProfileInfoWidget(title: 'Weight', value: '$weight kg'),
          SizedBox(height: 24,
          ),
          ElevatedButton(onPressed: (){}, child: Text('App Setting')),
          SizedBox(height: 16,),
          ElevatedButton(onPressed: (){}, child: Text('Terms of Service')),
          SizedBox(height: 16,),
          ElevatedButton(onPressed: (){}, child: Text('Log Out'), style: ElevatedButton.styleFrom(backgroundColor: Colors.red),),


        ],
      ),
    );
  }
}