import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:snam/most_used/common_methods.dart';
import 'package:snam/most_used/constants.dart';

class CustomDropDown extends StatelessWidget {
  CustomDropDown({
    Key? key,
    required this.context,
    required this.items,
    required this.onChanged,
    this.selectedValue,
    this.hint,
    this.prefix,
    this.prefixSize = 30,
    this.focusNode,
    this.noBorder = false,
    this.isDense,
    this.labelFontSize = 17,
  }) : super(key: key);

  final BuildContext context;
  final List<String> items;
  final void Function(dynamic?) onChanged;
  final String? selectedValue;
  final String? hint;
  final Widget? prefix;
  final double? prefixSize;
  final FocusNode? focusNode;
  final double labelFontSize;

  //to change InputDecoration border and enabledBorder
  final bool noBorder;
  final bool? isDense;
  bool _hasFocus = false;

  @override
  Widget build(BuildContext context) {
    var sizeForPrefix = getRelativeWidth(prefixSize ?? 30);
    var prefixWithPadding = prefix == null
        ? null
        : Padding(
            padding: const EdgeInsetsDirectional.only(end: 10), child: prefix);
    return DropdownSearch<String>(
      maxHeight: _calculateHeight(items),
      dropdownButtonBuilder: (context) {
        return _hasFocus
            ? Icon(
                Icons.expand_more,
                color: kTextFieldIconColor,
              )
            : Icon(
                Icons.chevron_right,
                color: kTextFieldIconColor,
              );
      },
      onPopupDismissed: () => //workaround to detect closed menu
          _hasFocus = false,
      // validator: (v) => v == null ? "required field" : null,
      dropdownSearchDecoration: InputDecoration(
        isDense: isDense,
        hintText: hint,
        contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        // border: noBorder ? OutlineInputBorder() : UnderlineInputBorder(),
        enabledBorder: noBorder
            ? OutlineInputBorder(
                borderSide: BorderSide(color: kTextFieldIconColor))
            : UnderlineInputBorder(
                borderSide: BorderSide(color: kTextFieldIconColor)),
        prefixIcon: prefixWithPadding,
        hintStyle: TextStyle(fontFamily: kfontFamily),

        prefixIconConstraints: prefixSize != null
            ? BoxConstraints(
                maxHeight: prefixSize!,
                maxWidth: prefixSize!,
                minHeight: prefixSize!,
                minWidth: prefixSize!,
              )
            : null,
      ),
      dropdownSearchBaseStyle: txTextFieldLabelStyle.copyWith(
          fontSize: getRelativeWidth(labelFontSize)),
      mode: Mode.MENU,
      showSelectedItems: true,
      items: items,
      onChanged: onChanged,
      selectedItem: selectedValue,

      popupItemBuilder: (context, item, isSelected) => Container(
        padding: EdgeInsets.all(getRelativeWidth(20)),
        height: getRelativeWidth(60),
        alignment: Alignment.center,
        child: FittedBox(
          child: Text(
            item,
            style: TextStyle(
              fontSize: getRelativeWidth(16),
              fontFamily: kfontFamily,
              color: isSelected ? Colors.blue : Colors.black,
            ),
          ),
        ),
      ),

      positionCallback: (popupButtonObject, overlay) {
        //-- my code --
        //workaround to detect opened menu
        _hasFocus = true;
        //-- my code end --

        final decorationBox = _findBorderBox(popupButtonObject);

        double translateOffset = 0;
        if (decorationBox != null) {
          translateOffset =
              decorationBox.size.height - popupButtonObject.size.height;
        }

        // Get the render object of the overlay used in `Navigator` / `MaterialApp`, i.e. screen size reference
        final RenderBox overlay =
            Overlay.of(context)!.context.findRenderObject() as RenderBox;
        // Calculate the show-up area for the dropdown using button's size & position based on the `overlay` used as the coordinate space.

        //the box height
        double? itemsBoxHeight = _calculateHeight(items);
        if (itemsBoxHeight == null) itemsBoxHeight = 0;

        var leftPoint = popupButtonObject.size.bottomLeft(Offset.zero);
        var rightPoint = popupButtonObject.size.bottomRight(Offset.zero);
        //calculate rec first to postion of the box
        var rec = Rect.fromPoints(
          popupButtonObject
              .localToGlobal(leftPoint, ancestor: overlay)
              .translate(0, translateOffset),
          popupButtonObject.localToGlobal(rightPoint, ancestor: overlay),
        );

        // print('leftPoint: ${leftPoint}');
        // print('rightPoint: ${rightPoint}');

        bool isCloseToBottom =
            (itemsBoxHeight + rec.bottom) > overlay.size.height;
        if (isCloseToBottom) {
          //it is close so recalculate to draw from top
          leftPoint =
              popupButtonObject.size.topLeft(Offset(0, -itemsBoxHeight));
          rightPoint =
              popupButtonObject.size.topRight(Offset(0, -itemsBoxHeight));
          rec = Rect.fromPoints(
            popupButtonObject
                .localToGlobal(leftPoint, ancestor: overlay)
                .translate(0, translateOffset),
            popupButtonObject.localToGlobal(rightPoint, ancestor: overlay),
          );
        }

        print('rec: $rec');

        return RelativeRect.fromSize(
          rec,
          Size(overlay.size.width, overlay.size.height),
        );
      },
    );
  }

  RenderBox? _findBorderBox(RenderBox box) {
    RenderBox? borderBox;
    // print('_findBorderBox');
    box.visitChildren((child) {
      if (child is RenderCustomPaint) {
        borderBox = child;
      }
      // print('_findBorderBox visitChildren');
      final box = _findBorderBox(child as RenderBox);
      if (box != null) {
        borderBox = box;
      }
    });

    return borderBox;
  }

  double? _calculateHeight(List<String>? items) {
    if (items == null) return null;
    if (items.length == 1) return 60;
    if (items.length == 2) return 120;
    if (items.length == 3) return 180;
    if (items.length > 3) return 220;
  }
}
