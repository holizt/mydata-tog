import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final IconData? icon;
  final TextEditingController? controller;
  final TextInputType? textType;
  final bool isRead;
  final Function()? onTap;
  final Function(String)? onChange;
  final List<TextInputFormatter>? inputFormatter;
  final String? sufixText;
  final bool isText;
  const CustomTextField({
    Key? key,
    this.label,
    this.icon,
    this.controller,
    this.isRead = false,
    this.isText = false,
    this.textType,
    this.onTap,
    this.onChange,
    this.inputFormatter,
    this.sufixText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      child: TextField(
        onTap: onTap,
        onChanged: onChange,
        controller: controller,
        keyboardType: textType,
        readOnly: isRead,
        maxLines: 1,
        inputFormatters: inputFormatter,
        style: Theme.of(context).textTheme.subtitle1!,
        decoration: InputDecoration(
          hintText: label,
          hintStyle: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(color: Colors.black54, height: 1.5),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          suffixIcon: (isText == false)
              ? Padding(
                  padding: const EdgeInsets.all(10),
                  child: Icon(
                    icon,
                    color: Colors.grey,
                  ),
                )
              : null,
          suffixText: sufixText,
          suffixStyle: Theme.of(context).textTheme.subtitle1!,
        ),
      ),
    );
  }
}
