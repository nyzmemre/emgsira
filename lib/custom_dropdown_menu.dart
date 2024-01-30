import 'package:flutter/material.dart';


class CustomDropdownMenu extends StatefulWidget {
  const CustomDropdownMenu({super.key, required this.list, required this.initialSelection, this.enabled, this.hintText});
  final List<String> list;
  final String initialSelection;
  final bool? enabled;
  final String? hintText;


  @override
  State<CustomDropdownMenu> createState() => _DropdownMenuExampleState();
}

class _DropdownMenuExampleState extends State<CustomDropdownMenu> {

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: widget.initialSelection,
      hintText: widget.hintText,
      enabled: widget.enabled ?? true,
      onSelected:(value) {
        // This is called when the user selects an item.

      },
      dropdownMenuEntries: widget.list.map<DropdownMenuEntry<String>>((String value)
      {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}