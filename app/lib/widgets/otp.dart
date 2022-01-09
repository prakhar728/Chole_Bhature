import 'package:cholebhature/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpField extends StatefulWidget {
  void Function(String) function;


  OtpField({required this.function});

  @override
  _OtpFieldState createState() => _OtpFieldState();
}

class _OtpFieldState extends State<OtpField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: 6,
      inputFormatters: [
        LengthLimitingTextInputFormatter(6),
      ],
      style: TextStyle(color: Gray,),
      textAlign: TextAlign.center,
      cursorColor: Gray,
      keyboardType: TextInputType.number,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value){if(value!.length <= 6)return 'Enter OTP';else return null;},
      onChanged: widget.function,
      decoration: InputDecoration(
        label: Container(child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Text("OTP",style: TextStyle(color: Gray,fontSize: 22),textAlign: TextAlign.center,),
        ),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Gray,width: 1)
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Gray,width: 1)
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Gray,width: 1)
        ),
      ),
    );
  }
}
