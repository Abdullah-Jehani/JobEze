import 'package:flutter/material.dart';
import 'package:job_eze/helpers/color_helper.dart';

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
                child: Icon(hidePass ? Icons.visibility_off : Icons.visibility),
              )
            : null,
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: greenColor)),
        errorStyle: TextStyle(color: greenColor, fontFamily: 'poppins'),
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black)),
        focusColor: greenColor,
        focusedErrorBorder:
            OutlineInputBorder(borderSide: BorderSide(color: greenColor)),
        border: const OutlineInputBorder(),
      ),
    );
  }
}
