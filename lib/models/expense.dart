//describe data structure expense should have
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();

enum Category { food, travel, leisure, work }

const categoryIcons = {
  Category.food: Icons.breakfast_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();

  final String id; //To Identify the expense
  final String title;
  final double amount;
  final DateTime date;
  final Category category; // Accept only values in category enum

  String get formattedDate {
    return DateFormat('yyyy-MM-dd – kk:mm').format(date);
  }
}
