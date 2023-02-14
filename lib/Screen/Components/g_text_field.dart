
import 'package:flutter/material.dart';

class GTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? hintStyle;
  final String label;
  final Stream<String> stream;
  final Function(String name)? onChanged;
  bool isSecret;
  final bool isReadOnly;
  final IconData? suffixIconData;
  final IconData? prefixIconData;
  final VoidCallback? onTap;

  GTextField({
    Key? key,
    this.controller,
    required this.label,
    this.hintText,
    this.hintStyle,
    required this.stream,
    this.isSecret = false,
    this.onChanged,
    this.onTap,
    this.suffixIconData, this.isReadOnly = false, this.prefixIconData,
  }) : super(key: key);

  @override
  State<GTextField> createState() => _GTextFieldState();
}

class _GTextFieldState extends State<GTextField> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
        stream: widget.stream,
        builder: (context, snapshot) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                widget.label,
                style: const TextStyle(
                    color: Color(0xff646464),
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    fontSize: 15),
              ),
              const SizedBox(
                height: 5,
              ),
              TextField(
                autofocus: false,
                controller: widget.controller,
                style: const TextStyle(fontSize: 12.0, height: 2.1, color: Colors.black),
                decoration: InputDecoration(
                  prefixIcon: Icon(widget.prefixIconData),
                  suffixIcon: GestureDetector(
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            // color: Colors.green
                          ),
                          width: 15,
                          child: widget.isSecret ?
                              GestureDetector(
                                onTap:() {
                                  setState(() {
                                    isVisible = isVisible ? false : true;
                                  });
                                },
                                child: Icon(isVisible ? Icons.visibility_off : Icons.visibility)
                              )
                              :  Icon(widget.suffixIconData))),
                  border: InputBorder.none,
                  errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.redAccent,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  hintText: widget.hintText,
                  errorText: snapshot.hasError ? '${snapshot.error}' : null,
                  filled: true,
                  fillColor: const Color.fromRGBO(255, 255, 255, 0.58),
                  contentPadding:
                  const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xffDCDCDC)),
                    borderRadius: BorderRadius.circular(6.0),
                  ),

                  enabledBorder: UnderlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                ),
                onChanged: widget.onChanged == null
                    ? null
                    : (val) => widget.onChanged!(val),
                onTap: widget.onTap,
                obscureText: widget.isSecret ? (isVisible ? true : false) : false ,
                readOnly: widget.isReadOnly
              ),
            ],
          );
        });
  }
}