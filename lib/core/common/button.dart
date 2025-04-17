import 'package:flutter/material.dart';
import 'package:todyapp/core/constans/constans.dart';
import 'package:todyapp/main.dart';

class FillButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData? icon;
  const FillButton(
      {super.key, required this.text, required this.onPressed, this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height * 0.07,
        width: width * 0.9,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(width * 0.05),
          color: AppColors.primaryColor,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white,
              ),
              SizedBox(
                width: width * 0.01,
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: width * 0.05,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class NotFillB extends StatelessWidget {
//   final String text;
//   final VoidCallback onPressed;
//   const NotFillB({super.key, required this.text, required this.onPressed});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onPressed,
//       child: Container(
//         height: height * 0.07,
//         width: width * 0.4,
//         decoration: BoxDecoration(
//           border: Border.all(color: ButtonColor.first, width: 2),
//           borderRadius: BorderRadius.circular(width * 0.3),
//           color: Colors.transparent, // No fill
//         ),
//         child: Center(
//           child: Text(
//             text,
//             style: TextStyle(
//               fontSize: width * 0.04,
//               fontWeight: FontWeight.bold,
//               color: ButtonColor.first,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
