import 'package:flutter/material.dart';

class ProfileInfoWidget extends StatelessWidget {
   final String title;
    final String value;

    ProfileInfoWidget({required this.title, required this.value});


  @override
  Widget build(BuildContext context) {
   

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,style: Theme.of(context).textTheme.bodyMedium,),
          Text(value,style: Theme.of(context).textTheme.bodyMedium,)
        ],
      ),
    );
  }
}