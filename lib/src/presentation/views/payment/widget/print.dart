// ignore_for_file: depend_on_referenced_packages

import 'dart:typed_data';

import 'package:casale/generated/l10n.dart';
import 'package:casale/src/cubits/pos_cubit/pos_cubit.dart';
import 'package:casale/src/domain/models/org_model.dart';
import 'package:casale/src/presentation/widgets/circular_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../../../config/routes/app_router.dart';
import '../../../../data/datasources/end_points.dart';

class Print extends StatelessWidget {
  const Print({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PosCubit, PosState>(
      listener: (context, state) {},
      builder: (context, state) {
//اسم المؤسسة التجاري.
// رقم التسجيل الضريبي للتاجر.
// وقت وتاريخ إنشاء الفاتورة.
// إجمالي قيمة الفاتورة.
// إجمالي قيمة الضريبة.

        PosCubit posCubit = PosCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            // backgroundColor: AppColors.orangeColor,
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, Routes.bottomNavigation, (route) => false);
                },
                icon: const Icon(Icons.arrow_back)),
            title: Text(
              S.current.printPage,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            // backgroundColor: AppColors.orangeColor,
          ),
          body: PdfPreview(
            build: (format) => _generatePdf(format, posCubit),
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            previewPageMargin: const EdgeInsets.all(30),
            // pdfPreviewPageDecoration:    ,
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
            dynamicLayout: true,
          ),
        );
      },
    );
  }

  Future<Uint8List> _generatePdf(
      PdfPageFormat format, PosCubit posCubit) async {
    // print('here print from print page ${posCubit.orderData}');
    Data? orgData = posCubit.orgData?.data;
    final order = posCubit.orderData;
    final pdf = pw.Document(
        creator: 'ADHAM ELSHARKAWY',
        theme: pw.ThemeData(),
        version: PdfVersion.pdf_1_5,
        compress: true,
        author: 'منشآت ويب لتقنية المعلومات');
    final font = await PdfGoogleFonts.iBMPlexSansArabicSemiBold();
    final orgLogo = await networkImage(
      cache: true,
      '${EndPoints.assetsUrl}${posCubit.orgData?.data?.logo}',
    );

    pdf.addPage(pw.Page(
      margin: const pw.EdgeInsets.all(15),
      pageFormat: format,
      build: (context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.center,
          children: [
            pw.Container(
              constraints: const pw.BoxConstraints(
                minWidth: 40,
                maxWidth: 60,
              ),
              child: pw.Image(orgLogo),
            ),
            textWidget(S.current.simpleTaxInvoice, 12, font),
            textWidget('رقم الفاتورة : #${order['orderNumber']}', 8, font),
            textWidget(order['orgTitle'] ?? 'No Data', 10, font),
            textWidget(' الفرع : ${order['branchTitel']}', 8, font),
            textWidget(' العنوان : ${order['branchAddress']}', 8, font),
            pw.BarcodeWidget(
              data: order['orderNumber'] ?? '0',
              barcode: pw.Barcode.code128(),
              width: 100,
              height: 30,
            ),
            pw.SizedBox(height: 2),
            pw.Row(mainAxisAlignment: pw.MainAxisAlignment.start, children: [
              pw.Spacer(),
              textWidget(
                  '${order['addOrdertime']} التاريخ / الوقت : ', 8, font),
            ]),
            pw.Row(mainAxisAlignment: pw.MainAxisAlignment.end, children: [
              pw.Spacer(),
              textWidget(
                  '${S.current.taxNumber}   : ${orgData?.vatNumber}', 8, font),
            ]),
            pw.SizedBox(height: 5),
            pw.Table(
                border: pw.TableBorder.symmetric(
                  outside: const pw.BorderSide(
                    style: pw.BorderStyle.dashed,
                  ),
                ),
                children: [
                  pw.TableRow(decoration: const pw.BoxDecoration(), children: [
                    textWidget(S.current.totalPriceWithVat, 6, font),
                    textWidget(S.current.tax, 6, font),
                    textWidget(S.current.unitPrice, 6, font),
                    textWidget(S.current.quantity, 6, font),
                    textWidget(S.current.products, 8, font),
                  ]),
                  pw.TableRow(decoration: const pw.BoxDecoration(), children: [
                    textWidget('2', 6, font),
                    textWidget('4', 6, font),
                    textWidget('2', 6, font),
                    textWidget('100', 6, font),
                    pw.Container(
                      width: 20,
                      child: textWidget('صنف 1', 8, font),
                    ),
                  ]),
                  pw.TableRow(decoration: const pw.BoxDecoration(), children: [
                    textWidget('2', 6, font),
                    textWidget('4', 6, font),
                    textWidget('2', 6, font),
                    textWidget('100', 6, font),
                    pw.Container(
                      width: 20,
                      child: textWidget('صنف 2', 8, font),
                    ),
                  ]),
                ]),
            pw.SizedBox(height: 5),
            pw.Row(mainAxisAlignment: pw.MainAxisAlignment.end, children: [
              textWidget('22.00', 8, font),
              pw.Spacer(),
              textWidget(S.current.total, 8, font),
            ]),
            pw.SizedBox(height: 5),
            pw.Row(mainAxisAlignment: pw.MainAxisAlignment.end, children: [
              textWidget('2.00', 8, font),
              pw.Spacer(),
              textWidget(S.current.tax, 8, font),
            ]),
            pw.SizedBox(height: 2),
            pw.Row(mainAxisAlignment: pw.MainAxisAlignment.end, children: [
              textWidget('24.00', 8, font),
              pw.Spacer(),
              textWidget(S.current.totalPriceWithVat, 8, font),
            ]),
            pw.SizedBox(height: 2.5),
            pw.Container(
              constraints: const pw.BoxConstraints(maxWidth: double.infinity),
              child: pw.Text(
                '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<',
                maxLines: 1,
              ),
            ),
            pw.SizedBox(height: 2.5),
            pw.BarcodeWidget(
              //search for how to hash qr-data
              // i want to hashing   ###qrData### and send it
              // ASXZhdi32YjYsdmKINmG2LjYp9mFINmF2YbYtNii2Kog2YjZitioAg8xMjM0NTY3ODkxMjM0NTYDCjIwMjMtMDktMzAEBTk3Ljc1BQUxMi43NQ
              data:
                  'ASXZhdi32YjYsdmKINmG2LjYp9mFINmF2YbYtNii2Kog2YjZitioAg8xMjM0NTY3ODkxMjM0NTYDCjIwMjMtMDktMzAEBTk3Ljc1BQUxMi43NQ',
              barcode: pw.Barcode.qrCode(),
              width: 70,
              height: 70,
            ),
          ],
        );
      },
    ));

    return pdf.save();
  }

  textWidget(
    String value,
    double fontSize,
    font,
  ) {
    return pw.Center(
      child: pw.Directionality(
        textDirection: pw.TextDirection.rtl,
        child: pw.Text(value,
            maxLines: 3,
            style: pw.TextStyle(
              font: font,
              fontSize: fontSize,
            )),
      ),
    );
  }
}
