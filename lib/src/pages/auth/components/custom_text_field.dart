import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

@immutable
class CustomTextField extends StatefulWidget {
  final IconData icon;
  final String label;
  final bool isSecret;
  final TextInputType textType;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  const CustomTextField({Key? key,
    required this.icon,
    required this.label,
    this.isSecret = false,
    this.textType = TextInputType.text,
    this.inputFormatters,
    this.textInputAction = TextInputAction.done,
    this.validator,
    this.controller
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = false;

  @override
  void initState() {
    isObscure = widget.isSecret;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        keyboardType: widget.textType,
        obscureText: isObscure,
        inputFormatters: widget.inputFormatters,
        validator: widget.validator,
        textInputAction: widget.textInputAction,
        controller: widget.controller,
        decoration: InputDecoration(
          suffixIcon: widget.isSecret ? IconButton(
              onPressed: (){
                setState((){
                  isObscure = !isObscure;
                });
              },
              icon: Icon(isObscure ? Icons.visibility : Icons.visibility_off)) : null,
          prefixIcon: Icon(widget.icon),
          labelText: widget.label,
          isDense:true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
