
import 'package:flutter/material.dart';

class GTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final Stream<String> stream;
  final Function(String name)? onChanged;
  final bool isSecret;
  final bool isReadOnly;
  final IconData? suffixIconData;
  final VoidCallback? onTap;

  const GTextField({
    Key? key,
    this.controller,
    this.hintText,
    required this.stream,
    this.isSecret = false,
    this.onChanged,
    this.onTap,
    this.suffixIconData, this.isReadOnly = false,
  }) : super(key: key);

  @override
  State<GTextField> createState() => _GTextFieldState();
}

class _GTextFieldState extends State<GTextField> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
        stream: widget.stream,
        builder: (context, snapshot) {
          return TextField(
            autofocus: false,
            controller: widget.controller,
            style: const TextStyle(fontSize: 12.0, height: 2.1, color: Colors.black),
            decoration: InputDecoration(
              suffixIcon: GestureDetector(
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        // color: Colors.green
                      ),
                      width: 15,
                      child: Icon(widget.suffixIconData,
                          color: Colors.black, size: 30))),
              border: InputBorder.none,
              errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.redAccent,
                  ),
                  borderRadius: BorderRadius.circular(10)),
              hintText: widget.hintText,
              errorText: snapshot.hasError ? '${snapshot.error}' : null,
              filled: true,
              fillColor: Colors.white,
              contentPadding:
              const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            onChanged: widget.onChanged == null
                ? null
                : (val) => widget.onChanged!(val),
            onTap: widget.onTap ?? null,
            obscureText: widget.isSecret,
            readOnly: widget.isReadOnly
          );
        });
  }
}