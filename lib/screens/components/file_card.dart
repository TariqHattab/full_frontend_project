import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:snam/most_used/constants.dart';
import 'package:snam/most_used/common_methods.dart';

class FileCard extends StatefulWidget {
  final String title;
  final bool hasFileFromStart;
  final bool hasError;

  final void Function(bool isAdded)? tempSetDidAddFile;

  const FileCard(
      {Key? key,
      this.hasError = false,
      required this.hasFileFromStart,
      required this.title,
      Function(bool)? this.tempSetDidAddFile})
      : super(key: key);
  @override
  State<FileCard> createState() => _FileCardState();
}

class _FileCardState extends State<FileCard> {
  //this to indicate user uplaoded file
  bool fileAdded = false;

  File? file;
  @override
  Widget build(BuildContext context) {
    print('uploaded file value is : $file ');

    // double fileWidth = getRelativeWidth(kFileCardWidth);
    // double fileHieght = getRelativeWidth(kFileCardHieght);
    return GestureDetector(
      onTap: () {
        if (!widget.hasFileFromStart) {
          _selectFile();
        }
      },
      child: Container(
        width: getRelativeWidth(kFileCardWidth),
        height: getRelativeWidth(kFileCardHieght),
        // color: Colors.green,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: txInnerTitleStyle.copyWith(
                  fontSize: getRelativeWidth(11),
                  color: widget.hasError
                      ? krejectColor
                      : ksecondaryPrimaryTextColor),
            ),
            kminiVerticalSpace,
            Expanded(
              child: Card(
                elevation: getRelativeWidth(5),
                shadowColor:
                    widget.hasError ? krejectColor : kElevationShadowColor,
                // color: Colors.yellow,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(getRelativeWidth(15)),
                ),
                child: Container(
                  width: kFileCardWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(getRelativeWidth(15)),
                  ),
                  child: fileAdded || widget.hasFileFromStart
                      ? _buildHasFile()
                      : Icon(
                          Icons.add_rounded,
                          color: ksecondaryFillColor,
                          size: getRelativeWidth(60),
                        ),
                ),
              ),
            ),
            kminiVerticalSpace,
            buildPDFText(context,
                hasFile: widget.hasFileFromStart, isError: widget.hasError),
          ],
        ),
      ),
    );
  }

  Stack _buildHasFile() {
    return Stack(
      children: [
        Center(
          child: Icon(Icons.image,
              color: ksecondaryFillColor, size: getRelativeWidth(50)),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Container(
            // decoration: ,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(getRelativeWidth(15)),
                bottomLeft: Radius.circular(getRelativeWidth(15)),
              ),
              color: kfillColor,
            ),
            height: getRelativeWidth(30),
            alignment: Alignment.center,
            child: Text(
              'file_name.pdf',
              style: TextStyle(
                  color: kprimaryTextColor, fontSize: getRelativeWidth(11)),
            ),
          ),
        ),
      ],
    );
  }

  _setFile(String path) {
    setState(() {
      file = File(path);
      fileAdded = true;
      if (widget.tempSetDidAddFile != null) widget.tempSetDidAddFile!(true);
    });
  }

  _selectFile() async {
    final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowMultiple: false,
        allowedExtensions: ['pdf']);

    print(result);
    if (result == null) return;

    final path = result.files.single.path;
    if (path == null) return;

    _setFile(path);

    // file = File(path);

    print(file);
  }
}

class PDFModel {
  final String title;
  final bool hasFile;

  const PDFModel({required this.title, required this.hasFile});
}
