import 'package:flutter/material.dart';

class ServiceWidget extends StatelessWidget {
  ServiceWidget({super.key, required this.serviceName});

  String serviceName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(serviceName),
      ],
    );
  }
}
