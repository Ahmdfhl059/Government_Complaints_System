import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/i18n/date_picker_i18n.dart';
import 'package:flutter_radio_group/flutter_radio_group.dart';
import 'package:government_complaints_system/utils/constants.dart';
import 'package:intl/intl.dart';

class CustomTextFormFiled extends StatefulWidget {
  final TextEditingController controller;
  final dynamic borderColor;
  final dynamic iconColor;
  final TextInputType type;
  final dynamic label;
  final dynamic onSubmit;
  final dynamic onChange;
  final dynamic onTap;
  final dynamic validate;
  final dynamic prefix;
  final bool isPassword;
  final bool readOnly;
  final bool border;
  final String? hintText;

  const CustomTextFormFiled({
    super.key,
    this.label,
    required this.controller,
    required this.type,
    this.prefix,
    this.onSubmit,
    this.onChange,
    this.validate,
    this.onTap,
    this.isPassword = false,
    this.borderColor,
    this.iconColor,
    this.readOnly = false,
    this.border = true,
    this.hintText,
  });

  @override
  CustomTextFormFiledState createState() => CustomTextFormFiledState();
}

class CustomTextFormFiledState extends State<CustomTextFormFiled> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.readOnly,
      controller: widget.controller,
      keyboardType: widget.type,
      onFieldSubmitted: widget.onSubmit,
      onChanged: widget.onChange,
      onTap: widget.onTap,
      validator: widget.validate,
      obscureText: _obscureText,
      cursorColor: widget.borderColor,
      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: _togglePasswordVisibility,
                child: Icon(
                  _obscureText
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
              )
            : null,
        prefixIcon: Icon(widget.prefix),
        labelText: widget.label,
        prefixIconColor: widget.iconColor,
        enabledBorder: widget.border
            ? OutlineInputBorder(
                borderSide: BorderSide(color: widget.borderColor),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              )
            : UnderlineInputBorder(
                borderSide: BorderSide(color: widget.borderColor),
              ),
        focusedBorder: widget.border
            ? OutlineInputBorder(
                borderSide: BorderSide(color: widget.borderColor),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              )
            : UnderlineInputBorder(
                borderSide: BorderSide(color: widget.borderColor),
              ),
      ),
    );
  }
}

class DefaultButton extends StatelessWidget {
  final double width;
  final double height;
  final Color background;
  final String text;
  final double fontSize;
  final VoidCallback onPress;

  const DefaultButton({
    super.key,
    required this.background,
    this.width = double.infinity,
    this.height = 50.0,
    required this.text,
    this.fontSize = 20,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(5),
      ),
      child: MaterialButton(
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(style: BorderStyle.none),
        ),
        onPressed: onPress,
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}

class DefaultText extends StatelessWidget {
  final String text;
  final dynamic overflow;
  final dynamic maxLines;
  final TextStyle? style;

  const DefaultText({
    super.key,
    required this.text,
    this.overflow,
    this.maxLines,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      maxLines: maxLines,
      style: style ?? Theme.of(context).textTheme.bodyMedium,
      // TextStyle(color: color, fontSize: size, fontWeight: fontWeight),
    );
  }
}

class DefaultTextButton extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final dynamic onPressed;
  final dynamic fontWeight;
  final dynamic textDecoration;
  final dynamic overflow;
  final dynamic maxLines;

  const DefaultTextButton({
    super.key,
    required this.text,
    required this.color,
    required this.size,
    required this.onPressed,
    this.fontWeight,
    this.textDecoration,
    this.overflow,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      child: Text(
        text,
        overflow: overflow,
        maxLines: maxLines,
        style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: fontWeight,
          decoration: textDecoration,
          decorationColor: defaultColor,
        ),
      ),
    );
  }
}

Future navigateTo(BuildContext context, Widget screen) {
  return Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return screen;
      },
    ),
  );
}

void navigatePop(BuildContext context, bool isSuccess) {
  Navigator.pop(context, isSuccess);
}

void navigateAndFinish(BuildContext context, Widget screen) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return screen;
        },
      ),
      (route) => false,
    );

class DefaultIconButton extends StatefulWidget {
  final Function onPressed;
  final Icon icon;
  final double size;
  final dynamic color;

  const DefaultIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.size = 35,
    this.color,
  });

  @override
  State<DefaultIconButton> createState() => _DefaultIconButtonState();
}

class _DefaultIconButtonState extends State<DefaultIconButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          widget.onPressed();
        });
      },
      icon: widget.icon,
      style: ButtonStyle(
        iconSize: WidgetStatePropertyAll(widget.size),
        iconColor: WidgetStatePropertyAll(widget.color),
      ),
    );
  }
}

class DatePicked extends StatefulWidget {
  const DatePicked({super.key});

  @override
  State<DatePicked> createState() => _DatePickedState();
}

String selectDate = '';

class _DatePickedState extends State<DatePicked> {
  DateTime datePicked = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      radius: 15,
      onTap: () async {
        datePicked = (await DatePicker.showSimpleDatePicker(
          context,
          backgroundColor: Theme.of(context).datePickerTheme.backgroundColor,
          lastDate: DateTime.now(),
          initialDate: DateTime.now(),
          pickerMode: DateTimePickerMode.date,
          dateFormat: "yyyy-MM-dd",
          locale: DateTimePickerLocale.en_us,
          looping: false,
          titleText: 'Select_Date',
          cancelText: 'Cancel',
          confirmText: 'Ok',
          textColor: Theme.of(context).datePickerTheme.dividerColor,
        ))!;
        selectDate = DateFormat('yyyy-MM-dd').format(datePicked);
        print(selectDate);
        setState(() {});
      },
      child: Container(
        padding: EdgeInsets.all(15),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.fromBorderSide(BorderSide(color: defaultColor)),
        ),
        child: DefaultText(
          text: selectDate.isEmpty ? 'birthday' : selectDate.toString(),
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }
}

class DefaultListTile extends StatelessWidget {
  final String textTitle;
  final dynamic textSubTitle;
  final dynamic subTitle;
  final dynamic overflowSubTitle;
  final dynamic maxLinesSubTitle;
  final dynamic leading;
  final dynamic trailing;
  final dynamic onTap;

  const DefaultListTile({
    super.key,
    required this.textTitle,
    this.textSubTitle,
    this.leading,
    this.trailing,
    this.overflowSubTitle,
    this.maxLinesSubTitle,
    this.onTap,
    this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minTileHeight: 70,

      onTap: onTap,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: defaultColor),
      ),
      leading: leading,
      title: DefaultText(
        text: textTitle,
        style:TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),
      ),
      subtitle: DefaultText(
              text: textSubTitle,
              style: TextStyle(fontSize: 16,color: secondaryColor.withValues(alpha: 0.6)),
            ),
      trailing: trailing,
      iconColor: Theme.of(context).iconTheme.color,
    );
  }
}

class DefFlutterRadioGroup extends StatelessWidget {
  final Key radiokey;
  final List<String> titles;
  final String? label;
  final Function(int?)? onChanged;
  final RGOrientation orientation;
  final TextStyle? titleStyle;
  final TextStyle? labelStyle;

  const DefFlutterRadioGroup({
    super.key,
    required this.radiokey,
    required this.titles,
    this.label,
    this.onChanged,
    required this.orientation,
    required this.titleStyle,
    required this.labelStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: FlutterRadioGroup(
        key: radiokey,
        titles: titles,
        label: label,
        activeColor: secondaryColor,
        orientation: orientation,
        titleStyle: titleStyle ?? Theme.of(context).textTheme.bodyMedium!,
        labelStyle: labelStyle ?? Theme.of(context).textTheme.bodyMedium!,
        onChanged: onChanged,
      ),
    );
  }
}

class DefContainer extends StatelessWidget {
  final Widget child;

  const DefContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).cardColor,
      ),
      child: child,
    );
  }
}
//
// String? local;
//
// class Local extends StatelessWidget {
//   const Local({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<LocaleCubit, LocaleState>(
//       builder: (context, state) {
//         if (state is ChangeLocaleState) {
//           return Padding(
//             padding: const EdgeInsets.all(10),
//             child: DropdownButton<String>(
//               dropdownColor: Theme.of(context).primaryColor,
//               iconEnabledColor: secondaryColor,
//               borderRadius: BorderRadius.circular(15),
//               underline: Center(),
//               value: state.locale.languageCode,
//               icon: Icon(Icons.keyboard_arrow_down),
//               items: ['العربية', 'English'].map((String items) {
//                 return DropdownMenuItem<String>(
//                   value: items=='العربية'?'ar':'en',
//                   child: DefaultText(
//                     text: items,
//                     style: Theme.of(context).textTheme.bodyLarge,
//                   ),
//                 );
//               }).toList(),
//               onChanged: (String? newValue) {
//                 if (newValue != null) {
//                   local = newValue;
//                   print(local);
//                   BlocProvider.of<LocaleCubit>(
//                     context,
//                   ).changeLanguage(newValue);
//                 }
//               },
//             ),
//           );
//         } else {
//           return SizedBox();
//         }
//       },
//     );
//   }
// }

class DefDropdownButton<T> extends StatefulWidget {
  final String hintText;
  final List<T> items;
  final String Function(T) itemAsString;
  final ValueChanged<T?>? onChanged;

  const DefDropdownButton({
    super.key,
    required this.hintText,
    required this.items,
    required this.itemAsString,
    this.onChanged,
  });

  @override
  State<DefDropdownButton<T>> createState() => _DefDropdownButtonState<T>();
}

class _DefDropdownButtonState<T> extends State<DefDropdownButton<T>> {
  T? selectedItem;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<T>(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: defaultColor, width: 2),
        ),
      ),
      hint: Text(widget.hintText),
      value: selectedItem,
      items: widget.items.map((item) {
        return DropdownMenuItem<T>(
          value: item,
          child: Text(widget.itemAsString(item)),
        );
      }).toList(),
      onChanged: widget.items.isEmpty
          ? null
          : (value) {
        setState(() {
          selectedItem = value;
        });
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
      },
      dropdownStyleData: DropdownStyleData(
        maxHeight: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
