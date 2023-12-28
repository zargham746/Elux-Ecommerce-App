import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onpress;
  final String buttonLabel;
  const CustomButton({
    Key? key,
    required this.onpress,
    required this.buttonLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        color: Colors.black,
      ),
      child: ElevatedButton(
        onPressed: onpress,
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          elevation: 0,
          fixedSize: Size(MediaQuery.of(context).size.width, 60),
          backgroundColor: Colors.transparent,
        ),
        child: Text(
          buttonLabel,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
    );
  }
}
