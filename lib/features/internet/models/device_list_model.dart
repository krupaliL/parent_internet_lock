import 'package:flutter/material.dart';

class DeviceListModel{
  static List<Map<String, dynamic>> deviceList = [
    {
      'name': 'Savannah Nguyen',
      'device': 'One plus',
      'status': 'Active',
      'isOnline': false,
      'backgroundColor': Colors.grey.shade300
    },
    {
      'name': 'Cody Fisher',
      'device': 'iPhone 11',
      'status': 'Active',
      'isOnline': false,
      'backgroundColor': Colors.grey.shade300
    },
    {
      'name': 'Ralph Edwards',
      'device': 'iPhone 12 pro max',
      'status': 'Active',
      'isOnline': false,
      'backgroundColor': Colors.grey.shade300
    },
    {
      'name': 'Dipen dhaduk',
      'device': 'One plus',
      'status': 'Internet Disable',
      'isOnline': true,
      'backgroundColor': Colors.green.shade100
    },
    {
      'name': 'Brijesh sakhiya',
      'device': 'iPhone 15 pro',
      'status': 'Internet Disable',
      'isOnline': true,
      'backgroundColor': Colors.green.shade100
    },
    {
      'name': 'Hiren malaviya',
      'device': 'Google pixel 5',
      'status': 'Internet Disable',
      'isOnline': true,
      'backgroundColor': Colors.green.shade100
    }
  ];

  // static List<Map<String, dynamic>> deviceList = [];
}