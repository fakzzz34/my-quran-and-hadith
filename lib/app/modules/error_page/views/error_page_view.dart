import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/error_page_controller.dart';

class ErrorPageView extends GetView<ErrorPageController> {
  final String? message;
  const ErrorPageView({super.key, this.message});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ErrorPageView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ErrorPageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
