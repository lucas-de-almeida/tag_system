import 'dart:ui';
import 'package:cnpj_cpf_helper/cnpj_cpf_helper.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:flutter/services.dart';
import 'package:cnpj_cpf_formatter/cnpj_cpf_formatter.dart';
import 'package:email_validator/email_validator.dart';
import 'package:tag_system/utils/app_localizations.dart';

class DefaultInput extends StatefulWidget {
  final List<TextInputFormatter> formatters;
  final String labelText;
  final IconData icon;
  final TextInputType inputType;
  final TextEditingController inputController;
  final String hintText;
  final bool isPassword;
  final String Function(String) validator;
  final void Function(String) onSaved;
  final void Function(String) onChanged;
  final void Function(String) onSubmited;
  final void Function() onEditComplete;

//Construtor padrao.
  DefaultInput({
    Key key,
    this.formatters,
    this.labelText,
    this.icon,
    this.inputType,
    @required this.inputController,
    this.hintText,
    @required this.validator,
    this.onSaved,
    this.onChanged,
    this.onSubmited,
    this.onEditComplete,
    this.isPassword = false,
  }) : super(key: key);

  DefaultInput.nameAndLastName({
    Key key,
    this.formatters,
    @required this.labelText,
    this.icon = Icons.person_outline,
    this.inputType = TextInputType.text,
    @required this.inputController,
    this.hintText,
    this.validator = _nameAndLastName,
    this.onSaved,
    this.onChanged,
    this.onSubmited,
    this.onEditComplete,
    this.isPassword = false,
  }) : super(key: key);

  static String _nameAndLastName(String value) {
    if (value.length < 3) {
      return 'REGISTER_NAME_MIN_ERROR';
    } else if (value.length > 40) {
      return 'REGISTER_NAME_MAX_ERROR';
    } else {
      return null;
    }
  }

  DefaultInput.cpf({
    Key key,
    this.labelText,
    this.icon = Icons.check_box_outline_blank,
    this.inputType = TextInputType.number,
    @required this.inputController,
    this.hintText,
    this.validator = _cpfValidator,
    this.onSaved,
    this.onChanged,
    this.onSubmited,
    this.onEditComplete,
    this.isPassword = false,
  })  : this.formatters = [
          CnpjCpfFormatter(
            eDocumentType: EDocumentType.CPF,
          )
        ],
        super(key: key);

  static String _cpfValidator(String value) {
    if (CnpjCpfBase.isCpfValid(value)) {
      return null;
    }
    return 'REGISTER_CPF_ERROR';
  }

  DefaultInput.cep({
    Key key,
    this.labelText,
    this.icon,
    this.inputType = TextInputType.number,
    @required this.inputController,
    this.hintText,
    @required this.validator,
    this.onSaved,
    this.onChanged,
    this.onSubmited,
    this.onEditComplete,
    this.isPassword = false,
  })  : this.formatters = [
          MaskTextInputFormatter(
              mask: '#####-###', filter: {"#": RegExp(r'[0-9]')})
        ],
        super(key: key);

  DefaultInput.email({
    Key key,
    this.formatters,
    this.labelText = 'E-mail',
    this.icon = Icons.mail,
    this.inputType = TextInputType.emailAddress,
    @required this.inputController,
    this.hintText,
    this.validator = _emailValidator,
    this.onSaved,
    this.onChanged,
    this.onSubmited,
    this.onEditComplete,
    this.isPassword = false,
  }) : super(key: key);

  static String _emailValidator(String value) {
    if (EmailValidator.validate(value)) {
      return null;
    }
    return 'INPUT_EMAIL_ERROR';
  }

  DefaultInput.cellPhone({
    Key key,
    this.labelText,
    this.icon = Icons.call,
    this.inputType = TextInputType.number,
    @required this.inputController,
    this.hintText,
    this.validator = _cellPhone,
    this.onSaved,
    this.onChanged,
    this.onSubmited,
    this.onEditComplete,
    this.isPassword = false,
  })  : this.formatters = [
          MaskTextInputFormatter(
              mask: '(###) # ####-####', filter: {"#": RegExp(r'[0-9]')})
        ],
        super(key: key);

  static String _cellPhone(String value) {
    if (!(value.length < 17)) {
      return null;
    }
    return 'REGISTER_PHONE_ERROR';
  }

  DefaultInput.password({
    Key key,
    this.formatters,
    this.labelText,
    this.icon,
    this.inputType,
    @required this.inputController,
    this.hintText,
    @required this.validator,
    this.onSaved,
    this.onChanged,
    this.onSubmited,
    this.onEditComplete,
    this.isPassword = true,
  }) : super(key: key);

  @override
  _DefaultInputState createState() => _DefaultInputState();
}

class _DefaultInputState extends State<DefaultInput> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.inputType ?? TextInputType.text,
      inputFormatters: widget.formatters ?? [],
      obscureText: widget.isPassword ? isObscure : false,
      decoration: InputDecoration(
        fillColor: Colors.grey,
        filled: true,
        hintText: widget.hintText,
        suffixIcon: widget
                .isPassword //Se for password utiliza um IconButton, se não usa um ícone normal.
            ? IconButton(
                icon: Icon(isObscure ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                })
            : Icon(
                widget.icon,
                color: Colors.grey[300],
              ),
        border: InputBorder.none,
        labelText: widget.labelText,
        labelStyle: TextStyle(
          fontSize: 14,
          fontFamily: 'Roboto-Medium.ttf',
        ),
      ),
      controller: widget.inputController,
      validator: (String value) {
        final key = widget.validator(value);
        if (key != null) {
          return AppLocalizations.of(context).translate(key);
        }
        return null;
      },
      onSaved: widget.onSaved,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onSubmited,
      onEditingComplete: widget.onEditComplete,
    );
  }
}
