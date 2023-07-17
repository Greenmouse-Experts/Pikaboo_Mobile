import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../utilities/utilities.dart';

class AppErrorWidget extends StatelessWidget {
  final double widgetHeight;
  final Type errorType;
  final String error;
  const AppErrorWidget(
      {super.key,
      required this.widgetHeight,
      required this.errorType,
      required this.error});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height(context) * widgetHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: width(context)),
          Icon(
            (errorType == DioException)
                ? Icons.signal_wifi_off_outlined
                : Icons.error,
            size: 200,
            color: Colors.red,
          ),
          Text((errorType == DioException) ? 'Network Error occurred' : error)
        ],
      ),
    );
  }
}
