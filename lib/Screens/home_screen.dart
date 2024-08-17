import 'package:flutter/material.dart';

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
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.indigoAccent,), label: 'Home',),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Stats'),
          BottomNavigationBarItem(icon: Icon(Icons.flag), label: 'Goals'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: 0,
        onTap: (index) {
          // Handle navigation
        },
      ),
    );
  }
}

class QuickStatsPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth=MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth*0.8,
      height: 100,
      child:Row(
        // scrollDirection: Axis.horizontal,
        children: [
          QuickStatCard(title: 'Screen Time', value: '6h 30m', trend: 'up'),
          QuickStatCard(title: 'Breaks', value: '4', trend: 'down'),
          QuickStatCard(title: 'Posture', value: 'Good', trend: 'up'),
        ],
      ),
    );
  }
}

class QuickStatCard extends StatelessWidget {
  final String title;
  final String value;
  final String trend;

  QuickStatCard({required this.title, required this.value, required this.trend});

  @override
  Widget build(BuildContext context) {

    return Container(
      child: SizedBox(
        child: Card(        
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
        
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title),
                Text(value, style: Theme.of(context).textTheme.titleLarge),
                Icon(trend == 'up' ? Icons.arrow_upward : Icons.arrow_downward),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HealthMetricsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HealthMetricCard(title: 'Screen Time', value: '6h 30m', icon: Icons.screen_lock_portrait),
        HealthMetricCard(title: 'Posture', value: 'Good', icon: Icons.accessibility_new),
        HealthMetricCard(title: 'Breaks', value: '4 today', icon: Icons.free_breakfast),
        HealthMetricCard(title: 'Water Intake', value: '1.5L', icon: Icons.local_drink),
      ],
    );
  }
}

class HealthMetricCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  HealthMetricCard({required this.title, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        trailing: Text(value, style: Theme.of(context).textTheme.titleMedium),
      ),
    );
  }
}

class DailyGoalProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Daily Goal Progress', style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: 10),
        LinearProgressIndicator(
          value: 0.7,
          minHeight: 10,
        ),
        SizedBox(height: 5),
        Text('70% Complete'),
      ],
    );
  }
}

class ActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.timer),
          label: Text('Start Break'),
        ),
        ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.local_drink),
          label: Text('Log Water'),
        ),
      ],
    );
  }
}

class RecentTips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Recent Tips', style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: 10),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Remember to take a 5-minute break every hour to reduce eye strain.'),
          ),
        ),
      ],
    );
  }
}

// import 'package:flutter/material.dart';

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Dev Health Monitor'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.settings),
//             onPressed: () {
//               // Navigate to settings
//             },
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               QuickStatsPanel(),
//               SizedBox(height: 20),
//               Text('Health Metrics', style: Theme.of(context).textTheme.headline6),
//               SizedBox(height: 10),
//               HealthMetricsList(),
//               SizedBox(height: 20),
//               DailyGoalProgress(),
//               SizedBox(height: 20),
//               ActionButtons(),
//               SizedBox(height: 20),
//               RecentTips(),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Stats'),
//           BottomNavigationBarItem(icon: Icon(Icons.flag), label: 'Goals'),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
//         ],
//         currentIndex: 0,
//         onTap: (index) {
//           // Handle navigation
//         },
//       ),
//     );
//   }
// }

// class QuickStatsPanel extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 100,
//       child: ListView(
//         scrollDirection: Axis.horizontal,
//         children: [
//           QuickStatCard(title: 'Screen Time', value: '6h 30m', trend: 'up'),
//           QuickStatCard(title: 'Breaks', value: '4', trend: 'down'),
//           QuickStatCard(title: 'Posture', value: 'Good', trend: 'up'),
//         ],
//       ),
//     );
//   }
// }

// class QuickStatCard extends StatelessWidget {
//   final String title;
//   final String value;
//   final String trend;

//   QuickStatCard({required this.title, required this.value, required this.trend});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(title),
//             Text(value, style: Theme.of(context).textTheme.titleLarge),
//             Icon(trend == 'up' ? Icons.arrow_upward : Icons.arrow_downward),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // Implement other widgets: HealthMetricsList, DailyGoalProgress, ActionButtons, RecentTips