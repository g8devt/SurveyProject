import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../bloc/common/common_cubit.dart';
import '../../data/model/_model.dart';
import '../../utilities/_utils.dart';

List<PHLocation> _removeDuplicates(List<PHLocation> items) {
  List<PHLocation> uniqueItems = [];

  /// uniqueList
  var uniqueIDs = items.map((e) => e.region).toSet();

  /// list if UniqueID to remove duplicates
  for (var e in uniqueIDs) {
    uniqueItems.add(items.firstWhere((i) => i.region == e));
  }

  /// populate uniqueItems with equivalent original Batch items
  return uniqueItems;

  ///send back the unique items list
}


/// Default Picker -------------------------------------------------------------
class DefaultPicker extends StatelessWidget {
  const DefaultPicker({
    super.key,
    required this.items,
    required this.value,
    this.hint,
    this.hintSearch,
    required this.searchController,
    this.isEnabled = true,
    this.isHideDropdownSearchData = false,
    this.hasUnderline = false,
    this.hasFullBorder = false,
    this.buttonStylePadding,
    this.visible = true,
    this.margin = EdgeInsets.zero,
    this.onChanged,
  });

  final dynamic items;
  final String? value;
  final String? hint;
  final String? hintSearch;
  final TextEditingController searchController;
  final bool isEnabled;
  final bool isHideDropdownSearchData;
  final bool hasUnderline;
  final bool hasFullBorder;
  final EdgeInsets? buttonStylePadding;
  final bool visible;
  final EdgeInsets margin;
  final Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Visibility(
      visible: visible,
      child: Padding(
        padding: margin,
        child: DropdownButtonHideUnderline(
          child: Container(
            decoration: hasUnderline
                ? BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey, // Underline color
                  width: .5, // Underline thickness
                ),
              ),
            ) : hasFullBorder
                ? BoxDecoration(
              border: Border.all(color: Colors.grey, width: .5),
              borderRadius: BorderRadius.circular(15),
            )
                : null,
            child: DropdownButton2<String>(
              isExpanded: true,
              hint: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    hint ?? '',
                    style: GoogleFonts.poppins(
                        fontSize: 15,
                        // color: Theme.of(context).hintColor,
                        color: Colors.grey),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              // iconStyleData: IconStyleData(
              //   icon: Icon(
              //     Icons.keyboard,
              //     color: isEnabled ? Colors.black : Colors.grey.withValues(alpha: .5),
              //   ),
              // ),
              selectedItemBuilder: (BuildContext context) {
                return items.map<Widget>((item) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        item.value ?? '',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  );
                }).toList();
              },
              buttonStyleData: ButtonStyleData(
                padding: buttonStylePadding ?? const EdgeInsets.fromLTRB(14, 0, 14, 0),
                width: width,
                // decoration: BoxDecoration(
                //   color: Colors.white.withValues(alpha: .7),
                //   borderRadius: BorderRadius.circular(10),
                //   border: Border.all(
                //     color: Colors.grey,
                //   ),
                // ),
                elevation: 0,
              ),
              items: items,
              value: value,
              onChanged: onChanged,
              alignment: Alignment.center,
              dropdownStyleData: DropdownStyleData(
                maxHeight: height * .5,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                // offset: const Offset(5, 0),
                scrollbarTheme: ScrollbarThemeData(
                  radius: const Radius.circular(40),
                  thickness: WidgetStateProperty.all(6),
                  thumbVisibility: WidgetStateProperty.all(true),
                ),
              ),
              dropdownSearchData: isHideDropdownSearchData == true
                  ? null
                  : DropdownSearchData(
                searchController: searchController,
                searchInnerWidgetHeight: 60,
                searchInnerWidget: Container(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 4),
                  height: height * .08,
                  child: TextFormField(
                    expands: true,
                    maxLines: null,
                    controller: searchController,
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: hintSearch ?? '',
                      hintStyle: GoogleFonts.poppins(fontSize: 15),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 8,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                searchMatchFn: (item, searchValue) {
                  return item.value.toString().toUpperCase().contains(searchValue.toUpperCase());
                },
              ),

              /// This to clear the search value when you close the menu
              onMenuStateChange: (isOpen) {
                if (!isOpen) {
                  searchController.clear();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

/// Form Default Picker --------------------------------------------------------
class FormDefaultPicker extends StatefulWidget {
  const FormDefaultPicker({
    super.key,
    required this.item,
    required this.value,
    this.hint,
    this.hintSearch,
    this.isEnabled = true,
    this.isHideDropdownSearchData = false,
    this.visible = true,
    this.margin = EdgeInsets.zero,
    this.onChanged,
  });

  final List<String> item;
  final String? value;
  final String? hint;
  final String? hintSearch;
  final bool isEnabled;
  final bool isHideDropdownSearchData;
  final bool visible;
  final EdgeInsets margin;
  final Function(String?)? onChanged;

  @override
  State<FormDefaultPicker> createState() => _FormDefaultPickerState();
}

class _FormDefaultPickerState extends State<FormDefaultPicker> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.visible,
      child: Padding(
        padding: widget.margin,
        child: IgnorePointer(
          ignoring: widget.isEnabled ? false : true,
          child: DefaultPicker(
            items: widget.item
                .map((String item) => DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: widget.isEnabled ? Colors.black : Colors.grey,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ))
                .toList(),
            // value: widget.value,
            value: widget.item.contains(widget.value) ? widget.value : null,
            hint: widget.hint,
            hintSearch: widget.hintSearch,
            searchController: _controller,
            isEnabled: widget.isEnabled,
            isHideDropdownSearchData: widget.isHideDropdownSearchData,
            onChanged: widget.onChanged,
          ),
        ),
      ),
    );
  }
}
/// Region Picker --------------------------------------------------------------
class FormRegionPicker extends StatefulWidget {
  const FormRegionPicker({
    super.key,
    required this.value,
    this.hint = 'Rehiyon (Region)',
    this.isEnabled = true,
    this.isHideDropdownSearchData = false,
    this.hasUnderline = false,
    this.hasFullBorder = false,
    this.buttonStylePadding,
    this.visible = true,
    this.margin = EdgeInsets.zero,
    this.onChanged,
  });

  final String? value;
  final String? hint;
  final bool isEnabled;
  final bool isHideDropdownSearchData;
  final bool hasUnderline;
  final bool hasFullBorder;
  final EdgeInsets? buttonStylePadding;
  final bool visible;
  final EdgeInsets margin;
  final Function(String?)? onChanged;

  @override
  State<FormRegionPicker> createState() => _FormRegionPickerState();
}

class _FormRegionPickerState extends State<FormRegionPicker> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.visible,
      child: Padding(
        padding: widget.margin,
        child: BlocBuilder<RegionListCubit, List<PHLocation>?>(
          builder: (context, region) {
            return IgnorePointer(
              ignoring: widget.isEnabled ? false : true,
              child: DefaultPicker(
                items: _removeDuplicates(region!)
                    .map((PHLocation item) => DropdownMenuItem<String>(
                  value: item.region,
                  child: Text(
                    item.region!,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: widget.isEnabled ? Colors.black : Colors.grey,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ))
                    .toList(),
                value: widget.value,
                hint: widget.hint,
                hintSearch: 'Search for Region',
                isEnabled: widget.isEnabled,
                isHideDropdownSearchData: widget.isHideDropdownSearchData,
                hasUnderline: widget.hasUnderline,
                hasFullBorder: widget.hasFullBorder,
                buttonStylePadding: widget.buttonStylePadding,
                onChanged: widget.onChanged,
                searchController: _controller,
              ),
            );
          },
        ),
      ),
    );
  }
}

/// Province Picker ------------------------------------------------------------
class FormProvincePicker extends StatefulWidget {
  const FormProvincePicker({
    super.key,
    required this.value,
    this.hint = 'Probinsya (Province)',
    this.isEnabled = true,
    this.isHideDropdownSearchData = false,
    this.hasUnderline = false,
    this.hasFullBorder = false,
    this.buttonStylePadding,
    this.visible = true,
    this.margin = EdgeInsets.zero,
    this.onChanged,
  });

  final String? value;
  final String? hint;
  final bool isEnabled;
  final bool isHideDropdownSearchData;
  final bool hasUnderline;
  final bool hasFullBorder;
  final EdgeInsets? buttonStylePadding;
  final bool visible;
  final EdgeInsets margin;
  final Function(String?)? onChanged;

  @override
  State<FormProvincePicker> createState() => _FormProvincePickerState();
}

class _FormProvincePickerState extends State<FormProvincePicker> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.visible,
      child: Padding(
        padding: widget.margin,
        child: BlocBuilder<ProvinceListCubit, List<PHLocation>?>(
          builder: (context, province) {
            return IgnorePointer(
              ignoring: widget.isEnabled ? false : true,
              child: DefaultPicker(
                items: province!
                    .map((PHLocation item) => DropdownMenuItem<String>(
                  value: item.province,
                  child: Text(
                    item.province!,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: widget.isEnabled ? Colors.black : Colors.grey,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ))
                    .toList(),
                value: widget.value,
                hint: widget.hint,
                hintSearch: 'Search for Province',
                searchController: _controller,
                isEnabled: widget.isEnabled,
                isHideDropdownSearchData: widget.isHideDropdownSearchData,
                hasUnderline: widget.hasUnderline,
                hasFullBorder: widget.hasFullBorder,
                buttonStylePadding: widget.buttonStylePadding,
                onChanged: widget.onChanged,
              ),
            );
          },
        ),
      ),
    );
  }
}

/// City Picker ----------------------------------------------------------------
class FormCityPicker extends StatefulWidget {
  const FormCityPicker({
    super.key,
    required this.value,
    this.hint = 'Siyudad / Munisipyo (City / Municipality)',
    this.isEnabled = true,
    this.isHideDropdownSearchData = false,
    this.hasUnderline = false,
    this.hasFullBorder = false,
    this.buttonStylePadding,
    this.visible = true,
    this.margin = EdgeInsets.zero,
    this.onChanged,
  });

  final String? value;
  final String? hint;
  final bool isEnabled;
  final bool isHideDropdownSearchData;
  final bool hasUnderline;
  final bool hasFullBorder;
  final EdgeInsets? buttonStylePadding;
  final bool visible;
  final EdgeInsets margin;
  final Function(String?)? onChanged;

  @override
  State<FormCityPicker> createState() => _FormCityPickerState();
}

class _FormCityPickerState extends State<FormCityPicker> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.visible,
      child: Padding(
        padding: widget.margin,
        child: BlocBuilder<CityListCubit, List<PHLocation>?>(
          builder: (context, city) {
            return IgnorePointer(
              ignoring: widget.isEnabled ? false : true,
              child: DefaultPicker(
                items: city!
                    .map((PHLocation item) => DropdownMenuItem<String>(
                  value: item.city_municipality,
                  child: Text(
                    item.city_municipality!,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: widget.isEnabled ? Colors.black : Colors.grey,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ))
                    .toList(),
                value: widget.value,
                hint: widget.hint,
                hintSearch: 'Search for City/Municipality',
                searchController: _controller,
                isEnabled: widget.isEnabled,
                isHideDropdownSearchData: widget.isHideDropdownSearchData,
                hasUnderline: widget.hasUnderline,
                hasFullBorder: widget.hasFullBorder,
                buttonStylePadding: widget.buttonStylePadding,
                onChanged: widget.onChanged,
              ),
            );
          },
        ),
      ),
    );
  }
}

/// Barangay Picker ------------------------------------------------------------
class FormBarangayPicker extends StatefulWidget {
  const FormBarangayPicker({
    super.key,
    required this.value,
    this.hint = 'Barangay',
    this.isEnabled = true,
    this.isHideDropdownSearchData = false,
    this.hasUnderline = false,
    this.hasFullBorder = false,
    this.buttonStylePadding,
    this.visible = true,
    this.margin = EdgeInsets.zero,
    this.onChanged,
  });

  final String? value;
  final String? hint;
  final bool isEnabled;
  final bool isHideDropdownSearchData;
  final bool hasUnderline;
  final bool hasFullBorder;
  final EdgeInsets? buttonStylePadding;
  final bool visible;
  final EdgeInsets margin;
  final Function(String?)? onChanged;

  @override
  State<FormBarangayPicker> createState() => _FormBarangayPickerState();
}

class _FormBarangayPickerState extends State<FormBarangayPicker> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.visible,
      child: Padding(
        padding: widget.margin,
        child: BlocBuilder<BarangayListCubit, List<PHLocation>?>(
          builder: (context, barangay) {
            return IgnorePointer(
              ignoring: widget.isEnabled ? false : true,
              child: DefaultPicker(
                items: barangay!
                    .map((PHLocation item) => DropdownMenuItem<String>(
                  value: item.barangay,
                  child: Text(
                    item.barangay!,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: widget.isEnabled ? Colors.black : Colors.grey,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ))
                    .toList(),
                value: widget.value,
                hint: widget.hint,
                hintSearch: 'Search for Barangay',
                searchController: _controller,
                isEnabled: widget.isEnabled,
                isHideDropdownSearchData: widget.isHideDropdownSearchData,
                hasUnderline: widget.hasUnderline,
                hasFullBorder: widget.hasFullBorder,
                buttonStylePadding: widget.buttonStylePadding,
                onChanged: widget.onChanged,
              ),
            );
          },
        ),
      ),
    );
  }
}

/// Gender Picker --------------------------------------------------------------
class FormGenderPicker extends StatefulWidget {
  const FormGenderPicker({
    super.key,
    required this.value,
    this.hint = 'Choose Sex (Gender)',
    this.isEnabled = true,
    this.isHideDropdownSearchData = false,
    this.hasUnderline = false,
    this.buttonStylePadding,
    this.visible = true,
    this.margin = EdgeInsets.zero,
    this.onChanged,
  });

  final String? value;
  final String hint;
  final bool isEnabled;
  final bool isHideDropdownSearchData;
  final bool hasUnderline;
  final EdgeInsets? buttonStylePadding;
  final bool visible;
  final EdgeInsets margin;
  final Function(String?)? onChanged;

  @override
  State<FormGenderPicker> createState() => _FormGenderPickerState();
}

class _FormGenderPickerState extends State<FormGenderPicker> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.visible,
      child: Padding(
        padding: widget.margin,
        child: IgnorePointer(
          ignoring: widget.isEnabled ? false : true,
          child: DefaultPicker(
            items: genderList
                .map((String item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: widget.isEnabled ? Colors.black : Colors.grey,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ))
                .toList(),
            // value: widget.value,
            value: genderList.contains(widget.value) ? widget.value : null,
            hint: widget.hint,
            hintSearch: 'Search for Sex (Gender)',
            searchController: _controller,
            isEnabled: widget.isEnabled,
            isHideDropdownSearchData: widget.isHideDropdownSearchData,
            hasUnderline: widget.hasUnderline,
            buttonStylePadding: widget.buttonStylePadding,
            onChanged: widget.onChanged,
          ),
        ),
      ),
    );
  }
}

/// EmploymentType Picker --------------------------------------------------------------
class FormEmploymentTypePicker extends StatefulWidget {
  const FormEmploymentTypePicker({
    super.key,
    required this.value,
    this.hint = 'Select Employment Status',
    this.isEnabled = true,
    this.isHideDropdownSearchData = false,
    this.hasUnderline = false,
    this.buttonStylePadding,
    this.visible = true,
    this.margin = EdgeInsets.zero,
    this.onChanged,
  });

  final String? value;
  final String hint;
  final bool isEnabled;
  final bool isHideDropdownSearchData;
  final bool hasUnderline;
  final EdgeInsets? buttonStylePadding;
  final bool visible;
  final EdgeInsets margin;
  final Function(String?)? onChanged;

  @override
  State<FormEmploymentTypePicker> createState() => _FormEmploymentTypePickerState();
}

class _FormEmploymentTypePickerState extends State<FormEmploymentTypePicker> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.visible,
      child: Padding(
        padding: widget.margin,
        child: IgnorePointer(
          ignoring: widget.isEnabled ? false : true,
          child: DefaultPicker(
            items: genderList
                .map((String item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: widget.isEnabled ? Colors.black : Colors.grey,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ))
                .toList(),
// value: widget.value,
            value: genderList.contains(widget.value) ? widget.value : null,
            hint: widget.hint,
            hintSearch: 'Search for Employment Status',
            searchController: _controller,
            isEnabled: widget.isEnabled,
            isHideDropdownSearchData: widget.isHideDropdownSearchData,
            hasUnderline: widget.hasUnderline,
            buttonStylePadding: widget.buttonStylePadding,
            onChanged: widget.onChanged,
          ),
        ),
      ),
    );
  }
}

class FormApplicationCategoryPicker extends StatefulWidget {
  const FormApplicationCategoryPicker({
    super.key,
    required this.value,
    this.hint = 'Select Application Category',
    this.isEnabled = true,
    this.isHideDropdownSearchData = false,
    this.hasUnderline = false,
    this.buttonStylePadding,
    this.visible = true,
    this.margin = EdgeInsets.zero,
    this.onChanged,
  });

  final String? value;
  final String hint;
  final bool isEnabled;
  final bool isHideDropdownSearchData;
  final bool hasUnderline;
  final EdgeInsets? buttonStylePadding;
  final bool visible;
  final EdgeInsets margin;
  final Function(String?)? onChanged;

  @override
  State<FormApplicationCategoryPicker> createState() => _FormApplicationCategoryPickerState();
}

class _FormApplicationCategoryPickerState extends State<FormApplicationCategoryPicker> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.visible,
      child: Padding(
        padding: widget.margin,
        child: IgnorePointer(
          ignoring: widget.isEnabled ? false : true,
          child: DefaultPicker(
            items: genderList
                .map((String item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: widget.isEnabled ? Colors.black : Colors.grey,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ))
                .toList(),
// value: widget.value,
            value: genderList.contains(widget.value) ? widget.value : null,
            hint: widget.hint,
            hintSearch: 'Search for Application Category',
            searchController: _controller,
            isEnabled: widget.isEnabled,
            isHideDropdownSearchData: widget.isHideDropdownSearchData,
            hasUnderline: widget.hasUnderline,
            buttonStylePadding: widget.buttonStylePadding,
            onChanged: widget.onChanged,
          ),
        ),
      ),
    );
  }
}

/// Type Assistance Picker --------------------------------------------------------------
class FormTypeAssistancePicker extends StatefulWidget {
  const FormTypeAssistancePicker({
    super.key,
    required this.value,
    this.hint = 'Type of Assistance',
    this.isEnabled = true,
    this.isHideDropdownSearchData = false,
    this.hasUnderline = false,
    this.buttonStylePadding,
    this.visible = true,
    this.margin = EdgeInsets.zero,
    this.onChanged,
  });

  final String? value;
  final String hint;
  final bool isEnabled;
  final bool isHideDropdownSearchData;
  final bool hasUnderline;
  final EdgeInsets? buttonStylePadding;
  final bool visible;
  final EdgeInsets margin;
  final Function(String?)? onChanged;

  @override
  State<FormTypeAssistancePicker> createState() => _FormTypeAssistancePickerState();
}

class _FormTypeAssistancePickerState extends State<FormTypeAssistancePicker> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.visible,
      child: Padding(
        padding: widget.margin,
        child: IgnorePointer(
          ignoring: widget.isEnabled ? false : true,
          child: DefaultPicker(
            items: assistanceMedicalOptions
                .map((String item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: widget.isEnabled ? Colors.black : Colors.grey,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ))
                .toList(),
            // value: widget.value,
            value: assistanceMedicalOptions.contains(widget.value) ? widget.value : null,
            hint: widget.hint,
            hintSearch: 'Search for Type Assistance',
            searchController: _controller,
            isEnabled: widget.isEnabled,
            isHideDropdownSearchData: widget.isHideDropdownSearchData,
            hasUnderline: widget.hasUnderline,
            buttonStylePadding: widget.buttonStylePadding,
            onChanged: widget.onChanged,
          ),
        ),
      ),
    );
  }
}

/// Civil Status ---------------------------------------------------------------
class FormCivilStatusPicker extends StatefulWidget {
  const FormCivilStatusPicker({
    super.key,
    required this.value,
    this.hint = 'Select Civil Status',
    this.isEnabled = true,
    this.isHideDropdownSearchData = false,
    this.hasUnderline = false,
    this.hasFullBorder = false,
    this.buttonStylePadding,
    this.visible = true,
    this.margin = EdgeInsets.zero,
    this.onChanged,
  });

  final String? value;
  final String hint;
  final bool isEnabled;
  final bool isHideDropdownSearchData;
  final bool hasUnderline;
  final bool hasFullBorder;
  final EdgeInsets? buttonStylePadding;
  final bool visible;
  final EdgeInsets margin;
  final Function(String?)? onChanged;

  @override
  State<FormCivilStatusPicker> createState() => _FormCivilStatusPickerState();
}

class _FormCivilStatusPickerState extends State<FormCivilStatusPicker> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.visible,
      child: Padding(
        padding: widget.margin,
        child: IgnorePointer(
          ignoring: widget.isEnabled ? false : true,
          child: DefaultPicker(
            items: civilStatusList
                .map((String item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: widget.isEnabled ? Colors.black : Colors.grey,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ))
                .toList(),
            // value: widget.value,
            value: civilStatusList.contains(widget.value) ? widget.value : null,
            hint: widget.hint,
            hintSearch: 'Search for Civil Status',
            searchController: _controller,
            isEnabled: widget.isEnabled,
            hasFullBorder: widget.hasFullBorder,
            isHideDropdownSearchData: widget.isHideDropdownSearchData,
            hasUnderline: widget.hasUnderline,
            buttonStylePadding: widget.buttonStylePadding,
            onChanged: widget.onChanged,
          ),
        ),
      ),
    );
  }
}

//SCHOOL SECTOR
class FormSchoolSectorPicker extends StatefulWidget {
  const FormSchoolSectorPicker({
    super.key,
    required this.value,
    this.hint = 'Select School Sector',
    this.isEnabled = true,
    this.isHideDropdownSearchData = false,
    this.hasUnderline = false,
    this.buttonStylePadding,
    this.visible = true,
    this.margin = EdgeInsets.zero,
    this.onChanged,
  });

  final String? value;
  final String hint;
  final bool isEnabled;
  final bool isHideDropdownSearchData;
  final bool hasUnderline;
  final EdgeInsets? buttonStylePadding;
  final bool visible;
  final EdgeInsets margin;
  final Function(String?)? onChanged;

  @override
  State<FormSchoolSectorPicker> createState() => _FormSchoolSectorPickerState();
}

class _FormSchoolSectorPickerState extends State<FormSchoolSectorPicker> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.visible,
      child: Padding(
        padding: widget.margin,
        child: IgnorePointer(
          ignoring: widget.isEnabled ? false : true,
          child: DefaultPicker(
            items: schoolSectorList
                .map((String item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: widget.isEnabled ? Colors.black : Colors.grey,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ))
                .toList(),
            // value: widget.value,
            value: schoolSectorList.contains(widget.value) ? widget.value : null,
            hint: widget.hint,
            isEnabled: widget.isEnabled,
            hasUnderline: widget.hasUnderline,
            buttonStylePadding: widget.buttonStylePadding,
            onChanged: widget.onChanged,
            searchController: _controller,
          ),
        ),
      ),
    );
  }
}

/// Education Attainment -------------------------------------------------------
class FormEducAttainPicker extends StatefulWidget {
  const FormEducAttainPicker({
    super.key,
    required this.value,
    this.hint = 'Select Education Attainment',
    this.isEnabled = true,
    this.isHideDropdownSearchData = false,
    this.hasUnderline = false,
    this.buttonStylePadding,
    this.visible = true,
    this.margin = EdgeInsets.zero,
    this.onChanged,
  });

  final String? value;
  final String hint;
  final bool isEnabled;
  final bool isHideDropdownSearchData;
  final bool hasUnderline;
  final EdgeInsets? buttonStylePadding;
  final bool visible;
  final EdgeInsets margin;
  final Function(String?)? onChanged;

  @override
  State<FormEducAttainPicker> createState() => _FormEducAttainPickerState();
}

class _FormEducAttainPickerState extends State<FormEducAttainPicker> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.visible,
      child: Padding(
        padding: widget.margin,
        child: IgnorePointer(
          ignoring: widget.isEnabled ? false : true,
          child: DefaultPicker(
            items: educationAttainmentList
                .map((String item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: widget.isEnabled ? Colors.black : Colors.grey,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ))
                .toList(),
            // value: widget.value,
            value: educationAttainmentList.contains(widget.value) ? widget.value : null,
            hint: widget.hint,
            hintSearch: 'Search for Education Attainment',
            searchController: _controller,
            isEnabled: widget.isEnabled,
            isHideDropdownSearchData: widget.isHideDropdownSearchData,
            hasUnderline: widget.hasUnderline,
            buttonStylePadding: widget.buttonStylePadding,
            onChanged: widget.onChanged,
          ),
        ),
      ),
    );
  }
}
