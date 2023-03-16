import 'package:flutter/material.dart';

import 'g_text_field.dart';

class GDropDown extends StatelessWidget {
  final TextEditingController controller;
  final Stream<String> stream;
  final String hint;
  final List<String>? options;
  final Function? onChange;

  GDropDown({
    Key? key,
    required this.stream,
    required this.controller,
    this.hint = '', this.options, this.onChange
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GTextField(
      label: hint,
      stream: stream,
      controller: controller,
      isReadOnly: true,
      hintText: hint,
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return Column(
                children: List.generate(options?.length ?? 0,
                        (index) => Container(
                      padding: const EdgeInsets.only(left: 40),
                      child: ListTile(
                          onTap: () {
                            onChange != null ? onChange!(options![index] ?? '')  : (){};
                            controller.text = options![index] ?? '';
                            Navigator.of(context).pop();
                          },
                          title: Text(options![index] ?? '')),
                    )),
              );
            });
      },
    );
  }
}