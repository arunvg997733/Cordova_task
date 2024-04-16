import 'package:cordovatask/core/font_size/font_size.dart';
import 'package:cordovatask/view/widget/text_widget/text_widget.dart';
import 'package:flutter/material.dart';

String? checkFieldEmpty(String? fieldContent) {
  //<-- add String? as a return type
  if (fieldContent == null || fieldContent.isEmpty) {
    return "Field is mandatory";
  }
  return null;
}

String? checkFieldEmailIsValid(String? fieldContent) {
  if (fieldContent == null) {
    return 'null';
  }
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern);
  final result = (regex.hasMatch(fieldContent)) ? true : false;
  if (result) {
    return null;
  } else {
    return "Email is not valid";
  }
}

String? checkFieldPhoneNumberIsValid(String? fieldContent) {
  if (fieldContent == null) {
    return 'null';
  }
  RegExp regExp = RegExp(r'^[6-9]\d{9}$');
  final result = regExp.hasMatch(fieldContent);
  // if (fieldContent.length == 10) {
  //   return null;
  // }
  if (result) {
    return null;
  } else {
    return 'Please enter 10 digit number';
  }
}

String? checkFieldPasswordIsValid(String? fieldContent) {
  if (fieldContent == null) {
    return 'null';
  }
  if (fieldContent.length >= 6) {
    return null;
  } else {
    return 'Minimum 6 Charaters is required';
  }
}

showDialogWidget(
    {required BuildContext context,
    required String title,
    required Function function}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: LinearBorder.none,
        title: textWidget(text: title, size: mediumFont),
        actions: [
          TextButton(
            child: textWidget(
              text: 'No',
              size: mediumFont,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: textWidget(
              text: 'Yes',
              size: mediumFont,
            ),
            onPressed: () {
              function();
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

// String dateTimeConvert(DateTime dateTime) {
//   String formattedDate = DateFormat('dd-MM-yyyy  hh:mm a').format(dateTime);
//   return formattedDate;
// }

// String timeConvert(DateTime dateTime) {
//   String formattedDate = DateFormat('hh:mm a').format(dateTime);
//   return formattedDate;
// }

// String dateConvert(DateTime dateTime) {
//   String formattedDate = DateFormat('dd-MM-yyyy').format(dateTime);
//   return formattedDate;
// }
