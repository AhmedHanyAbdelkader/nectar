import 'package:flutter/material.dart';

class RoundeButtonComponent extends StatelessWidget {
  const RoundeButtonComponent(
      {Key? key,
      required this.label,
      required this.onPressed,
      required this.color,
      this.imgPath})
      : super(key: key);
  final String label;
  final VoidCallback onPressed;
  final Color color;
  final String? imgPath;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 40),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(15)),
        child: MaterialButton(
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              imgPath != null
                  ? Image.asset(
                      imgPath!,
                      width: 35,
                      height: 35,
                    )
                  : const SizedBox(),
              SizedBox(width: imgPath != null ? 15 : 0,),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
