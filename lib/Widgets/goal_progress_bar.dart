import 'package:flutter/material.dart';
import 'package:programmer_health/models/goal.dart';

class GoalCard extends StatelessWidget {
  final Goal goal;
  GoalCard({required this.goal});

  @override
  Widget build(BuildContext context) {
    double progress=goal.current/goal.target;

    return Card(
      margin: EdgeInsets.symmetric(vertical: 8,horizontal: 16),
      child: Padding(
       padding: EdgeInsets.all(16),
       child: Column(children: [
        Text(goal.name,style: Theme.of(context).textTheme.headlineMedium,),
        SizedBox(height: 8,),
        LinearProgressIndicator(
          value: progress.clamp(0.0,1.0),
          minHeight: 10,
        ),
        SizedBox(height: 8,),
        Text('${goal.current}/${goal.target} ${goal.unit}')
       ],),
      ),
    );
  }
}