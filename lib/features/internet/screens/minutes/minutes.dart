import 'package:flutter/material.dart';
import 'package:parent_internet_lock/common/widgets/appbar/appbar.dart';
import 'package:parent_internet_lock/features/internet/screens/minutes/widgets/minutes_tile.dart';

import '../../../../utils/constants/colors.dart';

class MinutesScreen extends StatelessWidget {
  const MinutesScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PAppBar(
        title: Text(
          'Minutes',
          style: TextStyle(fontFamily: 'LexendDeca', fontWeight: FontWeight.w600, fontSize: 14.0, color: PColors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Expanded(child: MinutesList()),
            // const SizedBox(height: 10),
          ],
        ),
      )
    );
  }
}