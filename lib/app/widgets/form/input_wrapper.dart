import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idb/app/config.dart';
import 'package:idb/app/constants/types.dart';
import 'package:idb/app/services/l.dart';
import 'package:idb/app/services/ts.dart';
import 'package:idb/app/widgets/layout/bh.dart';
import 'package:idb/app/widgets/layout/empty.dart';

/// If regex passed for validation, also should pass regexError and store not null
/// Validation will be done on every onChanged
/// minLength and maxLength works if store not null
class InputWrapper extends StatefulWidget {
  final Map<String, dynamic>? formData;
  final String name;
  final dynamic errors;
  final bool autofocus;
  final String initialValue;
  final bool isPassword;
  final bool isValidateEmpty;
  final String labelText;
  final String hintText;
  final bool isObscured;
  final int maxLines;
  final FocusNode? focusNode;
  final SetErrorCallback? setError;
  final Function? onChanged;
  final RegExp? regex;
  final String? regexError;
  final int? minLength;
  final int? maxLength;
  final IStore? store; // MobX store that implements interface IStore
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final bool enableInteractiveSelection;
  final IconData? prefixIcon;
  final IconData? suffixIcon;

  // void onTapExample(BuildContext context, TextEditingController controller){}
  final Function? onTap;
  final ValueChanged<String>? onFieldSubmitted;

  const InputWrapper({
    Key? key,
    this.formData,
    required this.name,
    this.errors,
    this.autofocus = false,
    this.initialValue = '',
    this.labelText = '',
    this.hintText = '',
    this.isValidateEmpty = true,
    this.isObscured = false,
    this.isPassword = false,
    this.maxLines = 1,
    this.focusNode,
    this.setError,
    this.onChanged,
    this.regex,
    this.regexError,
    this.minLength,
    this.maxLength,
    this.store,
    this.onTap,
    this.textInputAction,
    this.textInputType,
    this.enableInteractiveSelection = true,
    this.prefixIcon,
    this.suffixIcon,
    this.onFieldSubmitted,
  }) : super(key: key);

  @override
  _InputWrapperState createState() => _InputWrapperState();
}

// Errors are combined from Mobx state that come via props
// and local errors via setState
class _InputWrapperState extends State<InputWrapper> {
  final _controller = TextEditingController();
  FocusNode _focusNode = FocusNode();
  bool _hasFocus = false;

  // For password field with internal state
  bool _isObscured = false;
  int? _maxLines;

  @override
  void initState() {
    super.initState();

    if (widget.focusNode != null) _focusNode = widget.focusNode!;

    _focusNode.addListener(() {
      setState(() {
        _hasFocus = _focusNode.hasFocus;
      });
    });

    Timer.run(() {
      setState(() {
        _controller.text = widget.initialValue;

        if (widget.isObscured) _isObscured = widget.isObscured;

        if (widget.isPassword) {
          // Obscured fields can not be multilines
          _maxLines = 1;
          _isObscured = true;
        }
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  bool get _isActive {
    if (_hasFocus) return true;
    if (_controller.text.trim().isNotEmpty) return true;
    return false;
  }

  bool get _hasError {
    if (_error != null) {
      return true;
    }
    return false;
  }

  String? get _error {
    if (widget.errors == null) {
      return null;
    }
    var l = widget.errors[widget.name];
    if (l == null) {
      return null;
    }

    return l[0];
  }

  // Should always return null
  // Set errors to Mobx state
  String? _onValidate(String? value) {
    if (widget.setError == null) {
      return null;
    }

    if (widget.isValidateEmpty) {
      if (value!.trim().isEmpty) {
        widget.setError!(widget.name, 'This field may not be blank.');
        return null;
      }
    }

    return null;
  }

  void _onChanged(String value) {
    if (widget.store != null) {
      widget.store!.setError(widget.name, null);
    }

    bool hasError = false;

    if (widget.regex != null && widget.regexError != null && widget.store != null) {
      if (value.isNotEmpty && !widget.regex!.hasMatch(value)) {
        hasError = true;
        widget.store!.setError(widget.name, widget.regexError);
      }
    }

    if (widget.minLength != null && widget.store != null && !hasError) {
      if (value.trim().length < widget.minLength!) hasError = true;
    }

    if (widget.maxLength != null && widget.store != null && !hasError) {
      if (value.trim().length > widget.maxLength!) hasError = true;
    }

    TextSelection prevSelection = _controller.selection;
    _controller.selection = prevSelection;

    if (widget.onChanged != null) {
      widget.onChanged!(value);
    }
  }

  void _onSaved(String? value) {
    widget.formData![widget.name] = value;
  }

  Widget _wInputField() {
    return TextFormField(
      autofocus: widget.autofocus,
      scrollPadding: EdgeInsets.all(L.v(30)),
      controller: _controller,
      focusNode: _focusNode,
      textInputAction: widget.textInputAction,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: Ts.text16(Config.grayColor),
        focusColor: Colors.transparent,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
      ),
      validator: _onValidate,
      onSaved: _onSaved,
      keyboardType: widget.textInputType,
      obscureText: _isObscured,
      onChanged: _onChanged,
      maxLines: _maxLines ?? widget.maxLines,
      enableInteractiveSelection: widget.enableInteractiveSelection,
      cursorColor: Config.primaryColor,
      onTap: () {
        if (widget.onTap != null) {
          widget.onTap!(context, _controller);
        }
      },
      onFieldSubmitted: widget.onFieldSubmitted,
      style: Ts.text16(Config.blackColor),
    );
  }

  Widget _wErrorText() {
    if (!_hasError) {
      return Empty();
    }

    return Padding(
      padding: EdgeInsets.only(top: L.v(5)),
      child: Text(
        _error!,
        style: Ts.text14(Config.redColor),
      ),
    );
  }

  Widget _wPrefix() {
    if (_isActive && !_hasError) {
      if (widget.prefixIcon != null) {
        return Padding(
          padding: EdgeInsets.only(left: L.v(20), right: L.v(15)),
          child: Icon(
            widget.prefixIcon,
            size: L.v(24),
            color: Config.primaryColor,
          ),
        );
      }

      return BH(L.v(20));
    }

    if (widget.prefixIcon != null) {
      return Padding(
        padding: EdgeInsets.only(left: L.v(20), right: L.v(15)),
        child: Icon(
          widget.prefixIcon,
          size: L.v(24),
          color: Config.grayColor,
        ),
      );
    }

    return BH(L.v(20));
  }

  Widget _wSuffix() {
    if (widget.isPassword) {
      IconData icon = _isObscured ? CupertinoIcons.eye_slash : CupertinoIcons.eye;

      var color = _isActive ? Config.primaryColor : Config.grayColor;
      if (_hasError) color = Config.redColor;

      return IconButton(
        onPressed: () => setState(() {
          _isObscured = !_isObscured;
        }),
        constraints: BoxConstraints(),
        icon: Icon(icon, color: color),
        iconSize: L.v(24),
      );
    }

    if (_isActive && !_hasError) {
      if (widget.suffixIcon != null) {
        return Padding(
          padding: EdgeInsets.only(left: L.v(15), right: L.v(20)),
          child: Icon(
            widget.suffixIcon,
            size: L.v(24),
            color: Config.primaryColor,
          ),
        );
      }

      return BH(L.v(20));
    }

    if (widget.suffixIcon != null) {
      return Padding(
        padding: EdgeInsets.only(left: L.v(15), right: L.v(20)),
        child: Icon(
          widget.suffixIcon,
          size: L.v(24),
          color: Config.grayColor,
        ),
      );
    }

    return BH(L.v(20));
  }

  Color get _contColor {
    Color color = Colors.white;
    if (!_hasError && !_isActive) color = Config.grayColor.withOpacity(0.1);
    return color;
  }

  Color get _contBorderColor {
    if (_hasError) return Config.redColor;
    if (_isActive) return Config.primaryColor;
    return Colors.transparent;
  }

  Widget _wCont() {
    return Container(
      decoration: BoxDecoration(
        color: _contColor,
        borderRadius: BorderRadius.circular(L.v(10)),
        border: Border.all(color: _contBorderColor, width: L.v(1)),
      ),
      child: Row(
        children: [
          _wPrefix(),
          Expanded(child: _wInputField()),
          _wSuffix(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _wCont(),
        _wErrorText(),
      ],
    );
  }
}
