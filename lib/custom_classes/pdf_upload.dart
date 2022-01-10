import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:snam/dialogs/delete_pdf_dialog.dart';
import 'package:snam/most_used/common_methods.dart';
import 'package:snam/most_used/constants.dart';

import 'package:path/path.dart' as p;

class PdfUploadField extends StatefulWidget {
  const PdfUploadField(
      {Key? key,
      required this.context,
      required this.title,
      required this.filesNumber})
      : super(key: key);

  final BuildContext context;
  final String title;
  final int filesNumber;

  @override
  State<PdfUploadField> createState() => _PdfUploadFieldState();
}

class _PdfUploadFieldState extends State<PdfUploadField> {
  List<File> files = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: txPDFFormTextStyle,
              ),
              GestureDetector(
                onTap: () => _selectFile(),
                child: Row(
                  children: [
                    Text(
                      tr(context).upload,
                      style: txPDFFormUploadTextStyle,
                    ),
                    kminiHorizontalSpace,
                    getImgAsset(imgName: 'upload', size: 20),
                  ],
                ),
              )
            ],
          ),
          Divider(
            thickness: 1,
            height: 28,
          ),
          Wrap(
            // alignment: WrapAlignment.start,
            runSpacing: 10,
            children: [
              for (var i = 0; i < files.length; i++) ...[
                _pdfUploadButton(file: files[i], onDelete: _confirmDelete),
                kminiHorizontalSpace
              ]
            ],
          )
        ],
      ),
    );
  }

  _pdfUploadButton(
      {required File file, required void Function(File file) onDelete}) {
    var fileName = p.basename(file.path);

    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: kBorderColor),
          borderRadius: BorderRadius.circular(25)),
      padding: const EdgeInsetsDirectional.only(start: 3, end: 10),
      height: 37,
      // width: 103,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 30,
            height: 37,
            child: IconButton(
                padding: const EdgeInsets.all(0),
                splashRadius: 17,
                onPressed: () {
                  //delete file
                  onDelete(file);
                },
                icon: getImgAsset(imgName: 'red_close', size: 16)),
          ),
          ksmallHorizontalSpace,
          Container(
            constraints: BoxConstraints(maxWidth: 100),
            child: Text(
              fileName,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }

  _selectFile() async {
    final result = await FilePicker.platform.pickFiles(
        type: FileType.custom, allowMultiple: true, allowedExtensions: ['pdf']);

    print(result);
    if (result == null) return;
    final paths = result.paths;

    setState(() {
      //loop to filter null values
      for (var path in paths) {
        if (path == null) {
          continue;
        }

        files.add(File(path));
      }
    });

    print(files);
  }

  void _confirmDelete(File file) async {
    var shouldDelete = await showDialog(
        context: context, builder: (context) => DeletePDFDialog());

    if (shouldDelete == true) {
      _deleteFile(file);
    }
  }

  void _deleteFile(File file) {
    // print(files);
    setState(() {
      files.remove(file);
    });
    // print(files);
  }
}
