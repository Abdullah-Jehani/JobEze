import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  const InputField(
      {super.key,
      required this.controller,
      required this.validator,
      required this.isPassword});

  final TextEditingController controller;
  final String Function(String?)? validator;
  final bool isPassword;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool hidePass = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isPassword ? hidePass : !hidePass,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: widget.controller,
      validator: widget.validator,
      decoration: InputDecoration(
          suffix: widget.isPassword
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      hidePass = !hidePass;
                    });
                  },
                  child:
                      Icon(hidePass ? Icons.visibility_off : Icons.visibility),
                )
              : null,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)),
          errorStyle: TextStyle(
              color: Colors.black.withOpacity(.4), fontFamily: 'poppins'),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)),
          focusColor: Colors.black,
          focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey))),
    );
  }
}
