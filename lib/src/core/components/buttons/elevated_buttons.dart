import 'package:flutter/material.dart';

class CustomElevatedButton extends StatefulWidget {
  final Future<void> Function() onTap;
  final String title;

  const CustomElevatedButton(
      {super.key, required this.onTap, required this.title});

  @override
  _CustomElevatedButtonState createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _isLoading
          ? null
          : () async {
              setState(() {
                _isLoading = true;
              });
              await widget.onTap();
              setState(() {
                _isLoading = false;
              });
            },
      child: _isLoading
          ? const CircularProgressIndicator()
          :  Text(widget.title),
    );
  }
}
