import 'package:flutter/material.dart';
import '../utilities/utilities.dart';

class CustomBackground extends StatelessWidget {
  final Widget child;
  const CustomBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height(context) * 1.1,
      // < 850,

          // ? height(context) * 0.837
          // : height(context) * 0.8,
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: height(context) * 0.25,
                color: AppColors.primary,
              ),
              Expanded(
                child: Container(
                  height:
                      (height(context) * 0.65) - AppBar().preferredSize.height,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Positioned(child: child)
        ],
      ),
    );
  }
}

class CustomBackground2 extends StatelessWidget {
  final Widget child;
  const CustomBackground2({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height(context) * 1.1 ,
      // < 850
      //     ? height(context) * 0.837
      //     : height(context) * 0.8,
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: height(context) * 0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.elliptical(
                          width(context) * 0.3, height(context) * 0.03),
                      bottomRight: Radius.elliptical(
                          width(context) * 0.3, height(context) * 0.03)),
                  color: AppColors.primary,
                ),
              ),
              Expanded(
                child: Container(
                  height:
                      (height(context) * 0.65) - AppBar().preferredSize.height,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Positioned(child: child)
        ],
      ),
    );
  }
}

class CustomBackground3 extends StatelessWidget {
  final Widget child;
  const CustomBackground3({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:
      // height(context) < 850
        //  ? 
          height(context) * 1.1,
         // : height(context) * 0.8,
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: height(context) * 0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(width(context) * 0.15),
                      bottomRight: Radius.circular(width(context) * 0.15)),
                  color: AppColors.primary,
                ),
              ),
              Expanded(
                child: Container(
                  height:
                      (height(context) * 0.65) - AppBar().preferredSize.height,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Positioned(child: child)
        ],
      ),
    );
  }
}
