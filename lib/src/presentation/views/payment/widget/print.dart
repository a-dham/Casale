// ignore_for_file: depend_on_referenced_packages

import 'dart:typed_data';

import 'package:casale/generated/l10n.dart';
import 'package:casale/src/presentation/widgets/circular_progress.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class Print extends StatelessWidget {
  const Print({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          S.current.printPage,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        // backgroundColor: AppColors.orangeColor,
      ),
      body: PdfPreview(
        build: (format) => _generatePdf(format),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        pageFormats: const {
          "80mm": PdfPageFormat.roll80,
          "57mm": PdfPageFormat.roll57,
          "A4": PdfPageFormat.a4,
        },
        initialPageFormat: PdfPageFormat.roll80,
        allowPrinting: true,
        allowSharing: false,
        pdfFileName: 'invoice',
        canChangePageFormat: true,
        canChangeOrientation: false,
        canDebug: false,
        loadingWidget: const CustomeCircularProgress(),
        useActions: true,
      ),
    );
  }

  Future<Uint8List> _generatePdf(PdfPageFormat format) async {
    final pdf = pw.Document(
        theme: pw.ThemeData(),
        version: PdfVersion.pdf_1_5,
        compress: true,
        author: 'منشآت ويب لتقنية المعلومات');
    final font = await PdfGoogleFonts.iBMPlexSansArabicSemiBold();

    pdf.addPage(
      pw.Page(
        margin: const pw.EdgeInsets.all(15),
        pageFormat: format,
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            children: [
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Directionality(
                    textDirection: pw.TextDirection.rtl,
                    child: pw.Text('منشآت ويب ',
                        style: pw.TextStyle(
                          font: font,
                          fontSize: 18,
                        )),
                  ),
                ],
              ),
              pw.SizedBox(height: 5),
              pw.Directionality(
                textDirection: pw.TextDirection.rtl,
                child: pw.Text('متجر سكاكا',
                    style: pw.TextStyle(
                      font: font,
                      fontSize: 15,
                    )),
              ),
              pw.Row(mainAxisAlignment: pw.MainAxisAlignment.center, children: [
                pw.Directionality(
                  textDirection: pw.TextDirection.rtl,
                  child: pw.Text('رقم الفاتورة : #2225255',
                      style: pw.TextStyle(
                        font: font,
                        fontSize: 10,
                      )),
                ),
              ]),
              pw.BarcodeWidget(
                data: '21698554525',
                barcode: pw.Barcode.code128(),
                width: 100,
                height: 30,
              ),
              pw.SizedBox(height: 10),
              pw.Row(mainAxisAlignment: pw.MainAxisAlignment.end, children: [
                pw.Directionality(
                  textDirection: pw.TextDirection.rtl,
                  child: pw.Text(' التاريخ : 01/05/2023',
                      style: pw.TextStyle(
                        font: font,
                        fontSize: 8,
                      )),
                ),
                pw.Spacer(),
                pw.Directionality(
                  textDirection: pw.TextDirection.rtl,
                  child: pw.Text(' العنوان : سكاكا',
                      style: pw.TextStyle(
                        font: font,
                        fontSize: 8,
                      )),
                ),
              ]),
              pw.SizedBox(height: 5),
              pw.Row(mainAxisAlignment: pw.MainAxisAlignment.end, children: [
                pw.Directionality(
                  textDirection: pw.TextDirection.rtl,
                  child: pw.Text(' الوقت : 15525',
                      style: pw.TextStyle(
                        font: font,
                        fontSize: 8,
                      )),
                ),
                pw.Spacer(),
                pw.Directionality(
                  textDirection: pw.TextDirection.rtl,
                  child: pw.Text(' الرقم الضريبي : 025154544',
                      style: pw.TextStyle(
                        font: font,
                        fontSize: 8,
                      )),
                ),
              ]),
              pw.SizedBox(height: 10),
              pw.Row(mainAxisAlignment: pw.MainAxisAlignment.end, children: [
                pw.Directionality(
                  textDirection: pw.TextDirection.rtl,
                  child: pw.Text('الأصناف',
                      style: pw.TextStyle(
                        font: font,
                      )),
                ),
              ]),
              pw.SizedBox(height: 5),
              pw.Table(border: pw.TableBorder.all(width: 1), children: [
                pw.TableRow(decoration: const pw.BoxDecoration(), children: [
                  pw.Center(
                    child: pw.Directionality(
                      textDirection: pw.TextDirection.rtl,
                      child: pw.Text('السعر',
                          style: pw.TextStyle(
                            font: font,
                          )),
                    ),
                  ),
                  pw.Center(
                    child: pw.Directionality(
                      textDirection: pw.TextDirection.rtl,
                      child: pw.Text('العدد',
                          style: pw.TextStyle(
                            font: font,
                          )),
                    ),
                  ),
                  pw.Center(
                    child: pw.Directionality(
                      textDirection: pw.TextDirection.rtl,
                      child: pw.Text('الأسم',
                          style: pw.TextStyle(
                            font: font,
                          )),
                    ),
                  ),
                ]),
                pw.TableRow(decoration: const pw.BoxDecoration(), children: [
                  pw.Center(
                    child: pw.Directionality(
                      textDirection: pw.TextDirection.rtl,
                      child: pw.Text('100',
                          style: pw.TextStyle(
                            font: font,
                          )),
                    ),
                  ),
                  pw.Center(
                    child: pw.Directionality(
                      textDirection: pw.TextDirection.rtl,
                      child: pw.Text(
                        '10',
                        style: pw.TextStyle(
                          font: font,
                        ),
                      ),
                    ),
                  ),
                  pw.Center(
                    child: pw.Directionality(
                      textDirection: pw.TextDirection.rtl,
                      child: pw.Text('صنف تست',
                          style: pw.TextStyle(
                            font: font,
                          )),
                    ),
                  ),
                ]),
              ]),
              pw.SizedBox(height: 10),
              pw.Row(mainAxisAlignment: pw.MainAxisAlignment.end, children: [
                pw.Directionality(
                  textDirection: pw.TextDirection.rtl,
                  child: pw.Text('200',
                      style: pw.TextStyle(
                        font: font,
                        fontSize: 8,
                      )),
                ),
                pw.Spacer(),
                pw.Directionality(
                  textDirection: pw.TextDirection.rtl,
                  child: pw.Text('الإجمالي',
                      style: pw.TextStyle(
                        font: font,
                        fontSize: 8,
                      )),
                ),
              ]),
              pw.SizedBox(height: 5),
              pw.Row(mainAxisAlignment: pw.MainAxisAlignment.end, children: [
                pw.Directionality(
                  textDirection: pw.TextDirection.rtl,
                  child: pw.Text('40',
                      style: pw.TextStyle(
                        font: font,
                        fontSize: 8,
                      )),
                ),
                pw.Spacer(),
                pw.Directionality(
                  textDirection: pw.TextDirection.rtl,
                  child: pw.Text('الخصم',
                      style: pw.TextStyle(
                        font: font,
                        fontSize: 8,
                      )),
                ),
              ]),
              pw.SizedBox(height: 5),
              pw.Row(mainAxisAlignment: pw.MainAxisAlignment.end, children: [
                pw.Directionality(
                  textDirection: pw.TextDirection.rtl,
                  child: pw.Text('20',
                      style: pw.TextStyle(
                        font: font,
                        fontSize: 8,
                      )),
                ),
                pw.Spacer(),
                pw.Directionality(
                  textDirection: pw.TextDirection.rtl,
                  child: pw.Text('الضريبة',
                      style: pw.TextStyle(
                        font: font,
                        fontSize: 8,
                      )),
                ),
              ]),
              pw.SizedBox(height: 5),
              pw.Row(mainAxisAlignment: pw.MainAxisAlignment.end, children: [
                pw.Directionality(
                  textDirection: pw.TextDirection.rtl,
                  child: pw.Text('250',
                      style: pw.TextStyle(
                        font: font,
                        fontSize: 8,
                      )),
                ),
                pw.Spacer(),
                pw.Directionality(
                  textDirection: pw.TextDirection.rtl,
                  child: pw.Text('الإجمالي شامل الضريبة',
                      style: pw.TextStyle(
                        font: font,
                        fontSize: 8,
                      )),
                ),
              ]),
              pw.SizedBox(height: 20),
              pw.BarcodeWidget(
                data: 'https://github.com/a-dham',
                barcode: pw.Barcode.qrCode(),
                width: 70,
                height: 70,
              ),
            ],
          );
        },
      ),
    );

    return pdf.save();
  }
}
