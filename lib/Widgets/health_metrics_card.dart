import 'package:flutter/material.dart';
import 'package:programmer_health/models/health_metic.dart';

class StatsSummary extends StatelessWidget {
  final HealthMetic metric;
 
  StatsSummary({required this.metric});


  @override
  Widget build(BuildContext context) {
    double average=metric.data.values.reduce((a,b)=>a+b)/metric.data.length;
    double max=metric.data.values.reduce((a,b)=>a>b ? a:b);
    double min=metric.data.values.reduce((a,b)=>a<b ? a:b);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Summary', style: Theme.of(context).textTheme.headlineMedium,),
          SizedBox(height: 8,),
          Text('Average:${average.toStringAsFixed(2)}'),
          Text('Max:${max.toStringAsFixed(2)}'),
          Text('Min:${min.toStringAsFixed(2)}'),
        ],
      ),
    );
  }
}