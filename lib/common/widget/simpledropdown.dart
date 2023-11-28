
import 'package:community_app/common/spacing.dart';
import 'package:community_app/common/themeService.dart';
import 'package:community_app/models/field_item_value_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

dropDwonWidget({
  required RxString selectedValue,
  required RxString selectedId,
  required String emptyTitle,
  required List<FieldItemValueModel> list,
  required RxBool isExpanded,
  Function? fun,
}) {
  return Obx(
        () => Container(
          padding: EdgeInsets.only(
            top: AppSpacings.s8,bottom: AppSpacings.s6
          ),
      decoration: BoxDecoration(
        border: Border.all(
          color: ThemeService.primaryColor,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSpacings.s16),
        child: ExpansionPanelList(
          animationDuration: const Duration(milliseconds: 300),
          expandedHeaderPadding: EdgeInsets.zero,
          children: [
            ExpansionPanel(
              headerBuilder: (context, isExpanded) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: AppSpacings.s12),
                        child: selectedValue.value != ""
                            ? Text(
                          selectedValue.value,
                          overflow: TextOverflow.fade,
                          style: Get.textTheme.bodyLarge!.copyWith(
                            fontSize: AppSpacings.s20,
                            color: ThemeService.black,
                          ),
                        )
                            : Text(
                          emptyTitle,
                          style: Get.textTheme.bodyLarge!.copyWith(
                            fontSize: AppSpacings.s20,
                            color: ThemeService.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
              canTapOnHeader: true,
              body: SizedBox(
                height: list.isEmpty
                    ? AppSpacings.s70
                    : list.length <= 2
                    ? AppSpacings.s150
                    : list.length == 3
                    ? AppSpacings.s200
                    : AppSpacings.s300,
                child: list.isEmpty
                    ? Center(
                  child: Text(
                    "No Data Found",
                    style: Get.textTheme.bodyMedium?.copyWith(
                      fontSize: AppSpacings.s15,
                      color: ThemeService.black.withOpacity(0.8),
                    ),
                  ),
                )
                    : ListView.separated(
                  shrinkWrap: true,
                  primary: true,
                  physics: const BouncingScrollPhysics(
                      parent: BouncingScrollPhysics()),
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        isExpanded.value = !isExpanded.value;
                        selectedValue.value = list[index].text ?? "";
                        selectedId.value = list[index].value.toString() ?? "";
                        if (fun != null) {
                          fun();
                        }
                      },
                      child: ListTile(
                        title: Text(
                          list[index].text ?? "",
                          style: Get.textTheme.bodyLarge?.copyWith(
                            fontSize: AppSpacings.s18,
                            color: ThemeService.black.withOpacity(0.8),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(
                    height: 1,
                    indent: AppSpacings.s10,
                    endIndent: AppSpacings.s10,
                  ),
                  itemCount: list.length,
                ),
              ),
              isExpanded: isExpanded.value,
            ),
          ],
          dividerColor: Colors.grey,
          expansionCallback: (panelIndex, isExpandeds) {
            isExpanded.value = !isExpanded.value;
          },
        ),
      ),
    ),
  );
}
