import 'package:cholebhature/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


//EMAIL ------------------------------------------------------------------------------------------------------
class EmailField extends StatefulWidget {
  void Function(String) function;
  String label;
  EmailField({required this.function, required this.label});

  @override
  _EmailFieldState createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Gray),
      cursorColor: Gray,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => validateEmail(value),
      onChanged: widget.function,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
      label: Container(child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Text(widget.label,style: TextStyle(color: Gray,fontSize: 22),),
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

// function to validate password
String? validateEmail(String? value) {
  String pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  RegExp regex = RegExp(pattern);
  if (value == null || value.isEmpty || !regex.hasMatch(value))
    return 'Enter a valid email address';
  else
    return null;
}
//password textfield-----------------------------------------------------------------------------------------------------------------


class PassField extends StatefulWidget {
  void Function(String) function;
  String label;
  PassField({required this.function, required this.label});

  @override
  _PassFieldState createState() => _PassFieldState();
}

class _PassFieldState extends State<PassField> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _isObscure,
      style: TextStyle(color: Gray),
      cursorColor: Gray,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => validatePass(value),
      onChanged: widget.function,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        label: Container(child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Text(widget.label,style: TextStyle(color: Gray,fontSize: 22),),
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
        suffixIcon: IconButton(
          icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off,color: Gray,),
          onPressed: (){
            setState(() {
              _isObscure = !_isObscure;
            });
          },
        )
      ),
    );
  }
}

String? validatePass(String? value) {
  int? len = value?.length;
  if (value == null || len! <= 6)
    return 'Enter a valid password';
  else
    return null;
}

//Name Text Field -----------------------------------------------------------------------------------------------------------------------

class NameField extends StatefulWidget {
  void Function(String) function;
  String label;
  NameField({required this.function, required this.label});

  @override
  _NameFieldState createState() => _NameFieldState();
}

class _NameFieldState extends State<NameField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Gray),
      cursorColor: Gray,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value){if(value == null)return 'Enter name';else return null;},
      onChanged: widget.function,
      decoration: InputDecoration(
        label: Container(child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Text(widget.label,style: TextStyle(color: Gray,fontSize: 22),),
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

//Number Field--------------------------------------------------------------------------------------------------------------------------------------

class NumberField extends StatefulWidget {
  void Function(String) function;
  String label;
  NumberField({required this.function, required this.label});

  @override
  _NumberFieldState createState() => _NumberFieldState();
}

class _NumberFieldState extends State<NumberField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Gray),
      cursorColor: Gray,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.number,
      validator: (value){if(value == null)return 'Enter age';else return null;},
      onChanged: widget.function,
      decoration: InputDecoration(
        label: Container(child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Text(widget.label,style: TextStyle(color: Gray,fontSize: 22),),
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
