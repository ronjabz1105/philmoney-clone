import 'package:flutter/material.dart';

class ReceiverTextField extends StatelessWidget {
  TextEditingController textController;
  String hintText;
  bool isNumber;
  bool readOnly;
  VoidCallback? ontap;
  String suffixIcon;

  ReceiverTextField(
      {Key? key,
      required this.textController,
      required this.hintText,
      this.isNumber = false,
      this.readOnly = false,
      this.suffixIcon = "",
      this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: TextFormField(
        readOnly: readOnly,
        onTap: ontap,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        controller: textController,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: hintText,
          suffixIcon: suffixIcon == ''
              ? const Text('')
              : SizedBox(
                  height: 50,
                  width: 80,
                  child: Image(
                    fit: BoxFit.fill,
                    image: AssetImage(suffixIcon),
                  ),
                ),
        ),
      ),
    );
  }
}
