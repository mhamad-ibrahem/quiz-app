import 'package:flutter/material.dart';
import '../../../../core/Constant/constant.dart';

class CircleTimer extends StatelessWidget {
  const CircleTimer(
      {super.key, required this.startCounter, required this.endCounter});
  final int startCounter;
  final double endCounter;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0, top: 8),
          child: SizedBox(
            height: 50,
            width: 50,
            child: CircularProgressIndicator(
              strokeWidth: 6,
              backgroundColor: AppColors.grey,
              value: endCounter,
              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.amber),
            ),
          ),
        ),
        startCounter < 10
            ? Positioned(
                top: 21,
                right: 26,
                bottom: 2,
                child: Text(
                  '$startCounter',
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.amber),
                ),
              )
            : Positioned(
                top: 21,
                right: 22,
                bottom: 2,
                child: Text(
                  '$startCounter',
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.amber),
                ),
              )
      ],
    );
  }
}
