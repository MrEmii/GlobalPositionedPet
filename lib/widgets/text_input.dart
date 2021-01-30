import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gpp/widgets/gppicons.dart';

import 'gppcolors.dart';

class TextInputComponent extends StatefulWidget {

  final String placeholder;
  final EdgeInsets padding;
  final TextAlign textAlign;
  final TextEditingController controller;
  final FormFieldValidator<String> validator;
  final TextInputType type;
  final bool passwordEnabled;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final bool filled;
  final Color fillColor;
  final TextStyle placeholderStyle;
  final TextStyle style;
  final EdgeInsets contentPadding;
  final InputBorder enabledBorder;
  final InputBorder border;
  final bool multiLine;
  final List<TextInputFormatter> inputFormatters;
  final bool readOnly;
  final FocusNode node;
  final TextInputAction action;
  final Function(String) onSubmit;
  final double width;
  final EdgeInsets margin;

  TextInputComponent({Key key, this.width, this.suffixIcon, this.action, this.onSubmit, this.node, this.readOnly = false, this.inputFormatters, this.prefixIcon, this.placeholder, this.padding, this.textAlign, this.controller, this.validator, this.type, this.passwordEnabled, this.filled, this.fillColor, this.placeholderStyle, this.border, this.enabledBorder, this.contentPadding, this.style, this.multiLine, this.margin});

  @override
  _TextInputComponentState createState() => _TextInputComponentState();
}

class _TextInputComponentState extends State<TextInputComponent> {
  final key = GlobalKey();

  bool hiddenPass = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: this.widget.padding ?? EdgeInsets.zero,
      width:  this.widget.width ?? 100,
      margin:  this.widget.margin ?? EdgeInsets.zero,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 12
          )
        ]
      ),
      child: TextFormField(
        key: key,
        focusNode: this.widget.node,
        textInputAction: this.widget.action,
        onFieldSubmitted: this.widget.onSubmit,
        controller: this.widget.controller,
        readOnly: this.widget.readOnly,
        textAlign: this.widget.textAlign ?? TextAlign.left,
        validator: this.widget.validator,
        inputFormatters: this.widget.inputFormatters,
        obscureText: (this.widget.passwordEnabled ?? false) ? this.hiddenPass : false,
        keyboardType: this.widget.type ?? TextInputType.text,
        maxLines: (this.widget.multiLine == null ? false : this.widget.multiLine) ? null : 1,
        style: this.widget.style ?? TextStyle(
          color: GPPColors.black96,
          fontSize: 14,
          fontWeight: FontWeight.w500
        ),
        decoration: InputDecoration(
          contentPadding: this.widget.contentPadding ?? EdgeInsets.only(left: 10),
          prefixIcon: this.widget.prefixIcon,
          suffixIcon: this.widget.passwordEnabled ?? false ? GestureDetector(
              onTap: (){
                setState(() {
                  this.hiddenPass = !this.hiddenPass;
                });
              },
              child: Icon( this.hiddenPass ? GPPIcons.eye_slash : GPPIcons.eye, color: Colors.black26, size: 18,),
            ) : widget.suffixIcon ?? null,
          enabledBorder: this.widget.enabledBorder ?? OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(const Radius.circular(10.0))
          ),
          border: this.widget.border ?? OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(const Radius.circular(10.0))
          ),
          filled: this.widget.filled ?? true,
          fillColor: this.widget.fillColor ?? Colors.white,
          hintText: this.widget.placeholder,
          hintStyle: this.widget.placeholderStyle ?? TextStyle(fontSize: 18, color: GPPColors.white18),
          alignLabelWithHint: true
        ),
      ),
    );
  }
}