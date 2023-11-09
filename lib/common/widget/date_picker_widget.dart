import 'package:community_app/common/spacing.dart';
import 'package:community_app/common/themeService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

DatePickerWidget({
  required TextEditingController textEditingController,
  required String hint,
  required Icon icon,
  DateTime? firstDate,
  DateTime? lastDate,
  DateTime? initialDate,
  context,
}) {
  return TextFormField(
    style: Get.textTheme.subtitle2,
    decoration: InputDecoration(
      hintText: hint,
      hintStyle: Get.textTheme.caption?.copyWith(fontSize: AppSpacings.s16, color: ThemeService.grayScalecon),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      suffixIcon: icon,
    ),
    controller: textEditingController,
    readOnly: true,
    onTap: () async {
      initialDate = textEditingController.text != "" ? DateTime.parse(textEditingController.text.toString()) : DateTime.now();
      DateTime? followUpPickedDate = await showDatePicker(
        context: context,
        initialDate: initialDate ?? DateTime.now(),
        firstDate: firstDate ?? DateTime(DateTime.now().year - 10),
        lastDate: lastDate ?? DateTime(DateTime.now().year + 10),
      );
      if (followUpPickedDate != null) {
        String formattedDate = DateFormat('yyyy-MM-dd').format(followUpPickedDate);
        textEditingController.text = formattedDate;
      }
    },
  );
}
