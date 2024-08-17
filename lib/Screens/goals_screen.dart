import 'package:flutter/material.dart';
import 'package:programmer_health/Widgets/goal_progress_bar.dart';
import 'package:programmer_health/models/goal.dart';

class GoalTrackingScreen extends StatefulWidget {
  const GoalTrackingScreen({super.key});

  @override
  State<GoalTrackingScreen> createState() => _GoalTrackingScreenState();
}

class _GoalTrackingScreenState extends State<GoalTrackingScreen> {

  List<Goal> goals=[
    Goal(name:'Reduce screen time', target:6,current:7.5,unit:'hourse'),
    Goal(name:'Take regular breaks', target: 5, current: 3, unit:'breaks'),
    Goal(name: 'Improve posture', target: 8, current: 6, unit: "hours")
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Goal Tracking'),
      ),
      body: ListView.builder(
        itemCount: goals.length,
        itemBuilder:(context,index){
          return GoalCard(goal: goals[index]);
        } ),
    );
  }
}