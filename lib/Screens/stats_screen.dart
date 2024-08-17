import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:programmer_health/Widgets/health_metrics_card.dart';
import 'package:programmer_health/models/health_metic.dart';

class StatsScreen extends StatefulWidget {
  const StatsScreen({super.key});

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {


  List<HealthMetic> metric=[
    HealthMetic(name: 'Screen', data:{
      DateTime(2024, 8, 12): 7.5,
      DateTime(2024, 8, 13): 6.8,
      DateTime(2024, 8, 14): 8.2,
      DateTime(2024, 8, 15): 6.5,
      DateTime(2024, 8, 16): 7.0,
      DateTime(2024, 8, 17): 5.5,
      DateTime(2024, 8, 18): 6.0,

    }),
    HealthMetic(name: "Breaks Taken", data: {
      DateTime(2024, 8, 12): 3,
      DateTime(2024, 8, 13): 4,
      DateTime(2024, 8, 14): 2,
      DateTime(2024, 8, 15): 5,
      DateTime(2024, 8, 16): 4,
      DateTime(2024, 8, 17): 6,
      DateTime(2024, 8, 18): 5,
    }),
  ];

  int selectedMetricIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stats'),
      ),
      body:Column(
        children: [
          DropdownButton<int>(
            value: selectedMetricIndex,
            items: List.generate(metric.length, (index){
              return DropdownMenuItem(
                value: index,
                child: Text(metric[index].name),
                );
            }),
            onChanged: (int? newValue){
              setState(() {
                selectedMetricIndex=newValue!;
              });
            },
          ),
         Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: true),
                       ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value,meta){
                          final date=DateTime.fromMillisecondsSinceEpoch(value.toInt());
                          return Text('${date.day}/${date.month}');
                        },
                        reservedSize: 22
                      )
                    ),
                  ),
                  borderData: FlBorderData(show: true),
                  lineBarsData: [
                    LineChartBarData(
                      spots: metric[selectedMetricIndex].data.entries.map((entry) {
                        return FlSpot(entry.key.millisecondsSinceEpoch.toDouble(), entry.value);
                      }).toList(),
                      isCurved: true,
                      color: Theme.of(context).primaryColor,
                      dotData: FlDotData(show: false),
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                ),
              ),
            ),
          ),
          StatsSummary(metric: metric[selectedMetricIndex]),
        ],
      ),
    
    );
  }
}