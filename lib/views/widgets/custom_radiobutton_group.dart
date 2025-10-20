import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utilities/colors.dart';

class DynamicRadioGroup extends StatefulWidget {
  final String title;
  final List<String> options;
  Color? backgroundColor;
  bool border;
  final String? initialValue;
  final ValueChanged<String?> onChanged; // <-- callback

  DynamicRadioGroup({
    super.key,
    required this.title,
    this.backgroundColor,
    this.border = false,
    required this.options,
    this.initialValue,
    required this.onChanged,
  });

  @override
  State<DynamicRadioGroup> createState() => _DynamicRadioGroupState();
}

class _DynamicRadioGroupState extends State<DynamicRadioGroup> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? primaryColor.withValues(alpha: .2), // replace with your `fourthColor`
        borderRadius: BorderRadius.circular(15),
        border: widget.border ? Border.all(color: primaryColor) :  null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.title.isEmpty ? const Gap(0) : Text(
            widget.title,
            style: GoogleFonts.poppins(
              fontSize: 15,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          ...widget.options.map((option) {
            return Theme(
              data: Theme.of(context).copyWith(
                unselectedWidgetColor: Colors.grey, // border color when unselected
              ),
              child: RadioListTile<String>(
                title: Text(
                  option,
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                controlAffinity: ListTileControlAffinity.leading,
                visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                value: option,
                contentPadding: EdgeInsets.zero,
                groupValue: _selectedValue,
                onChanged: (value) {
                  setState(() => _selectedValue = value);
                  widget.onChanged(value); // notify parent
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}


class DynamicTwoSideRadioGroup extends StatefulWidget {
  final String title;
  final List<String> options;
  Color? backgroundColor;
  bool border;
  final String? initialValue;
  final ValueChanged<String?> onChanged;
  final ValueChanged<String?>? onOtherChanged; // 👈 callback for "Others" text

  DynamicTwoSideRadioGroup({
    super.key,
    required this.title,
    this.backgroundColor,
    this.border = false,
    required this.options,
    this.initialValue,
    required this.onChanged,
    this.onOtherChanged,
  });

  @override
  State<DynamicTwoSideRadioGroup> createState() =>
      _DynamicTwoSideRadioGroupState();
}

class _DynamicTwoSideRadioGroupState extends State<DynamicTwoSideRadioGroup> {
  String? _selectedValue;
  final TextEditingController _otherController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
  }

  @override
  void dispose() {
    _otherController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 🔑 Responsive: decide how many columns
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = screenWidth < 400 ? 1 : 2;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? primaryColor.withValues(alpha: .1),
        borderRadius: BorderRadius.circular(15),
        border: widget.border ? Border.all(color: primaryColor) : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.title == "" ? const Gap(0) : Text(
            widget.title,
            style: GoogleFonts.poppins(
              fontSize: 15,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),

          GridView.count(
            crossAxisCount: crossAxisCount, // 👈 responsive
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: 4,
            mainAxisSpacing: 4,
            crossAxisSpacing: 12,
            children: widget.options.map((option) {
              return Theme(
                data: Theme.of(context).copyWith(
                  unselectedWidgetColor: Colors.grey,
                ),
                child: RadioListTile<String>(
                  title: Text(
                    option,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                  value: option,
                  contentPadding: EdgeInsets.zero,
                  groupValue: _selectedValue,
                  onChanged: (value) {
                    setState(() => _selectedValue = value);
                    widget.onChanged(value);
                  },
                ),
              );
            }).toList(),
          ),


          if (_selectedValue == "Others") ...[
            const SizedBox(height: 10),
            TextField(
              controller: _otherController,
              onChanged: widget.onOtherChanged,
              decoration: InputDecoration(
                hintText: "Others: please specify",
                hintStyle: GoogleFonts.poppins(fontSize: 14),
                contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ]
        ],
      ),
    );
  }
}
