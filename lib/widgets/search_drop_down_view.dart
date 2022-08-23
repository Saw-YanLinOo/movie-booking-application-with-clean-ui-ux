import 'package:flutter/material.dart';

import '../resources/dimens.dart';

class SearchDropDownView extends StatelessWidget {
  const SearchDropDownView({
    Key? key,
    required this.hint,
    required this.items,
  }) : super(key: key);

  final String hint;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SEARCH_PAGE_DROPDOWN_WIDTH,
      height: SEARCH_PAGE_DROPDOWN_HEIGHT,
      child: DropdownButtonFormField(
        onChanged: (String? value) {},
        hint: Text(
          hint,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.all(MARGIN_MEDIUM),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              MARGIN_SMALL,
            ),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
        ),
        items: items.map((e) {
          return DropdownMenuItem(value: e, child: Text(e));
        }).toList(),
      ),
    );
  }
}