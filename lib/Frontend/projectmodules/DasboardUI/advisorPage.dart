import 'package:flutter/material.dart';
import 'dart:math';

class AdvisorPage extends StatefulWidget {
  @override
  _AdvisorPageState createState() => _AdvisorPageState();
}

class _AdvisorPageState extends State<AdvisorPage> {
  String message = "";

  final List<String> messages = [
    "You're taking incredible steps towards a healthy and happy journey. Keep going, mom-to-be! 🌸",
    "Every moment of care you give yourself brings you closer to a healthier future. You’re doing great! 👶",
    "Your strength and love are the foundation of your growing family. Believe in yourself! 💖",
    "Each day is a new opportunity to nurture both yourself and your little one. Keep up the amazing work! 🌼",
    "Your health and well-being are top priorities. You’ve got this! 🦋",
    "Trust in the journey and take one step at a time. You’re stronger than you know! 🌷",
    "The care you provide yourself now will bloom into a beautiful tomorrow. Stay positive! 🌻",
    "You are the best advocate for your and your baby’s health. Keep making those wise choices! 🌟",
    "Remember, every small step counts. Keep nurturing yourself and your little one! 🦢",
    "You’re on a wonderful journey, full of growth and discovery. Stay focused and strong! 🌼",
    "Your dedication to your health is a gift to your growing family. Keep shining, mom! 🌟",
    "Nurture yourself with kindness and patience. You’re doing an amazing job! 💚",
    "Every healthy choice you make is a step towards a bright future. Keep it up! 🌞",
    "You are the heart of your family’s well-being. Keep believing in your strength and resilience! 💕",
    "Your journey is unique and beautiful. Embrace each moment with confidence! 🌸",
    "Each day brings new opportunities for growth and care. You’re doing wonderfully! 🌷",
    "The love and care you show yourself reflect in your growing family. Keep nurturing that bond! 🌻",
    "You’re creating a strong foundation for your future. Stay positive and keep going! 🌿",
    "Your well-being is your superpower. Keep taking those steps forward! 🦋",
    "You are a source of strength and love. Keep believing in your incredible journey! 🌟",
  ];

  @override
  void initState() {
    super.initState();
    setState(() {
      message = messages[Random().nextInt(messages.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.pink[100]!, Colors.purple[100]!, Colors.pink[200]!],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Welcome Back!",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.pink[800],
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            message,
            style: TextStyle(
              fontSize: 16,
              fontStyle: FontStyle.italic,
              color: Colors.pink[600],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
