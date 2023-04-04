
import 'package:quick_pharma/Wedget/widget_common_text_field.dart';
import 'package:quick_pharma/util/styles.dart';

import '../util/ColorConstants.dart';
import '../util/app_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';

import '../utils/string_utils.dart';

class CustomCountryPicker extends StatefulWidget {
  Country? initialCountry;
  Function(Country) onChange;

  CustomCountryPicker(
      {Key? key, required this.initialCountry, required this.onChange})
      : super(key: key);

  @override
  State<CustomCountryPicker> createState() => _CustomCountryPickerState();
}

class _CustomCountryPickerState extends State<CustomCountryPicker> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        child: Row(
          children: [
            Image.asset(widget.initialCountry?.flag ?? "",
                height: 20, width: 20, fit: BoxFit.cover),
            Text(" +${widget.initialCountry?.dialCode}",
                style: textMedium.copyWith(color: ColorConstants.black)),
          ],
        ),
        onTap: () {
          showDialog(
              context: Get.context!,
              builder: (dialogContext) {
                return Dialog(
                  child: CountryPickerPopup(
                      initialCountry: widget.initialCountry,
                      onChange: widget.onChange),
                );
              });
        },
        behavior: HitTestBehavior.opaque,
      ),
    );
  }
}

class CountryPickerPopup extends StatefulWidget {
  Country? initialCountry;
  Function(Country) onChange;

  CountryPickerPopup(
      {Key? key, required this.initialCountry, required this.onChange})
      : super(key: key);

  @override
  State<CountryPickerPopup> createState() => _CountryPickerPopupState();
}

class _CountryPickerPopupState extends State<CountryPickerPopup> {
  late List<Country> filterList;

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filterList = countries;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(Get.context!).size.width / 2,
      padding: EdgeInsets.all(size_20),
      decoration: BoxDecoration(
          color: ColorConstants.white, borderRadius: BorderRadius.circular(size_20)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WidgetCommonTextField(
            textEditingController: searchController,
            textStyle: textMedium.copyWith(color: ColorConstants.black),
            inputType: TextInputType.text,
            inputAction: TextInputAction.search,
            prefixWidget: Icon(Icons.search_rounded, color: ColorConstants.gray50),
            paddingContainer: EdgeInsets.all(size_10),
            onTextChanged: () {
              onSearch();
            },
          ),
          SizedBox(
            height: size_10,
          ),
          Flexible(
              child: ListView.builder(
            itemCount: filterList.length,
            shrinkWrap: true,
            itemBuilder: (listContext, index) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: size_10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              filterList[index].flag,
                              height: 20,
                              width: 20,
                              fit: BoxFit.cover,
                            ),
                            // Text(filterList[index].flag,
                            //     style: AppText.textMedium
                            //         .copyWith(color: colorBlack)),
                            Expanded(
                              child: Text(filterList[index].name,
                                      style: textMedium
                                          .copyWith(color: ColorConstants.black))
                                  .marginSymmetric(horizontal: size_10),
                            ),
                            Text("+${filterList[index].dialCode}",
                                style: textMedium
                                    .copyWith(color: ColorConstants.black))
                          ],
                        ),
                      ),
                      onTap: () {
                        widget.onChange(filterList[index]);
                        Get.back();
                      },
                      behavior: HitTestBehavior.opaque,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: size_1,
                    decoration: BoxDecoration(color: ColorConstants.gray50),
                  )
                ],
              );
            },
          ))
        ],
      ),
    );
  }

  onSearch() {
    if (checkString(searchController.value.text.toString())) {
      setState(() {
        filterList = countries;
      });
    } else {
      List<Country> filterListCopy = [];

      // for (Country data in countries) {
      //   if (data.isSearchField) {
      //     filterListCopy.add(data);
      //   } else {
      //     if (data.code.contains(searchController.text.toString().trim()) ||
      //         data.name.toLowerCase().contains(
      //             searchController.text.toString().trim().toLowerCase()) ||
      //         "+${data.dialCode}"
      //             .contains(searchController.text.toString().trim())) {
      //       print(
      //           "object String Matched with data ${searchController.text.toString().trim()}");
      //       filterListCopy.add(data);
      //     }
      //   }
      // }

      setState(() {
        filterList = filterListCopy;
      });
    }
  }
}
