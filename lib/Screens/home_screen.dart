import 'package:flutter/material.dart';
import 'package:programmer_health/Screens/goals_screen.dart';
import 'package:programmer_health/Screens/profile_screen.dart';
import 'package:programmer_health/Screens/stats_screen.dart';
import 'package:programmer_health/Widgets/custom_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dev Health Monitor'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Navigate to settings
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              QuickStatsPanel(),
              SizedBox(height: 20),
              Text('Health Metrics', style: Theme.of(context).textTheme.titleLarge),
              SizedBox(height: 10),
              HealthMetricsList(),
              SizedBox(height: 20),
              DailyGoalProgress(),
              SizedBox(height: 20),
              ActionButtons(),
              SizedBox(height: 20),
              RecentTips(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Stats'),
          BottomNavigationBarItem(icon: Icon(Icons.flag), label: 'Goals'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: 0,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if(index==2){
            Navigator.push(context,
            MaterialPageRoute(builder: (context)=>GoalTrackingScreen()));
          }
          if(index==1){
            Navigator.push(context, 
            MaterialPageRoute(builder: (context)=>StatsScreen()));
          }
          if(index==3) {
            Navigator.push(context,
            MaterialPageRoute(builder: (context)=>ProfileScreen()));
          }
        },
      ),
    );
  }
}
