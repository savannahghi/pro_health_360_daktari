import 'dart:io';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:prohealth360_daktari/application/redux/actions/faqs/fetch_pdf_action.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';

class DocumentContentPage extends StatefulWidget {
  const DocumentContentPage({
    required this.pdfTitle,
    required this.pdfUrl,
  });

  final String pdfTitle;
  final String pdfUrl;
  @override
  State<DocumentContentPage> createState() => _DocumentContentPageState();
}

class _DocumentContentPageState extends State<DocumentContentPage> {
  bool _isLoading = true;
  late File _pdfDocument;

  Future<void> _loadFile() async {
    // Load the pdf file from the internet
    _pdfDocument = await FetchPDFAction.loadNetwork(
      widget.pdfUrl,
      context,
    );

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadFile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.pdfTitle),
      body: _isLoading
          ? const Center(child: PlatformLoader())
          : PDFView(
              filePath: _pdfDocument.path,
              autoSpacing: false,
            ),
    );
  }
}
