// ignore_for_file: depend_on_referenced_packages
import 'dart:typed_data';
import 'package:casale/generated/l10n.dart';
import 'package:casale/src/cubits/pos_cubit/pos_cubit.dart';
import 'package:casale/src/presentation/views/payment/widget/tlv_qr.dart';
import 'package:casale/src/presentation/widgets/circular_progress.dart';
import 'package:casale/src/utils/constant/tofixed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../../../../config/routes/app_router.dart';

class Print extends StatelessWidget {
  const Print({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PosCubit, PosState>(
      listener: (context, state) {},
      builder: (context, state) {
        PosCubit posCubit = PosCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            // backgroundColor: AppColors.orangeColor,
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  posCubit.clearCart();
                  Navigator.pushNamedAndRemoveUntil(
                      context, Routes.bottomNavigation, (route) => false);
                  posCubit.remaining = 0.00;
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
            shouldRepaint: true,
            onPrinted: (context) {
              posCubit.clearCart();
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.bottomNavigation,
                (route) => false,
              );
              posCubit.remaining = 0.00;
            },
            build: (format) => _generatePdf(format, posCubit, context),
            actions: const [],
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
      PdfPageFormat format, PosCubit posCubit, BuildContext context) async {
    // print('here print from print page ${posCubit.orderData}');
    // Data? orgData = posCubit.orgData?.data;
    final order = posCubit.orderData;
    final pdf = pw.Document(
        creator: 'ADHAM ELSHARKAWY',
        theme: pw.ThemeData(),
        version: PdfVersion.pdf_1_5,
        compress: true,
        author: 'Orgs Web');
    final font = await PdfGoogleFonts.iBMPlexSansArabicSemiBold();
    final orgLogo = await networkImage(order['logo']);

    pdf.addPage(pw.Page(
      margin: const pw.EdgeInsets.all(10),
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
            textWidget(order['orgTitle'] ?? 'No Data', 10, font),
            textWidget(
                '${S.current.branch} : ${order['branchTitel']}  ${S.current.address} : ${order['branchAddress']}',
                8,
                font),
            textWidget(' ${S.current.invoiceNumber} : #${order['orderNumber']}',
                8, font),
            pw.BarcodeWidget(
              data: order['orderNumber'],
              barcode: pw.Barcode.code128(),
              width: 100,
              height: 20,
            ),
            pw.SizedBox(height: 2),
            pw.Row(mainAxisAlignment: pw.MainAxisAlignment.end, children: [
              textWidget(
                  ' ${S.current.dateTime}: ${order['addOrdertime']}', 8, font),
            ]),

            order['orgVatRegistrationNumber'] == null
                ? pw.SizedBox()
                : pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.end,
                    children: [
                        pw.Spacer(),
                        textWidget(
                            '${S.current.taxNumber}   : ${order['orgVatRegistrationNumber']}',
                            8,
                            font),
                      ]),
            pw.Row(mainAxisAlignment: pw.MainAxisAlignment.end, children: [
              textWidget(
                '${S.current.phone} : ${order['phone']}',
                8,
                font,
              ),
            ]),
            pw.Container(
              constraints: const pw.BoxConstraints(maxWidth: double.infinity),
              child: pw.Text(
                '---------------------------------------------------------------------------------------------------------------------',
                maxLines: 1,
              ),
            ),
            pw.Row(mainAxisAlignment: pw.MainAxisAlignment.end, children: [
              textWidget(
                '${S.current.customer}: ${order['customerName'] ?? S.current.cashCusotomer}',
                8,
                font,
              ),
            ]),
            order['customerVatRegistrationNumber'] == null
                ? pw.SizedBox()
                : pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.end,
                    children: [
                        pw.Spacer(),
                        textWidget(
                            '${S.current.taxNumber}   : ${order['customerVatRegistrationNumber']}',
                            8,
                            font),
                      ]),
            order['customerPhone'] == null
                ? pw.SizedBox()
                : pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.end,
                    children: [
                        textWidget(
                            '${S.current.phone} : ${order['customerPhone']}',
                            8,
                            font),
                      ]),
            pw.SizedBox(height: 5),
            pw.Table(
                border: pw.TableBorder.symmetric(
                  outside: const pw.BorderSide(
                    style: pw.BorderStyle.dashed,
                  ),
                ),
                children: generateRows(font, order['cart'])),
            pw.SizedBox(height: 5),
            pw.Row(mainAxisAlignment: pw.MainAxisAlignment.end, children: [
              textWidget(order['totalOrder'], 8, font),
              pw.Spacer(),
              textWidget(S.current.total, 8, font),
            ]),
            pw.Row(mainAxisAlignment: pw.MainAxisAlignment.end, children: [
              textWidget(order['totalVat'], 8, font),
              pw.Spacer(),
              textWidget(S.current.tax, 8, font),
            ]),
            pw.Row(mainAxisAlignment: pw.MainAxisAlignment.end, children: [
              textWidget(order['totalOrderWithVat'], 8, font),
              pw.Spacer(),
              textWidget(S.current.totalPriceWithVat1, 8, font),
            ]),
            pw.Container(
              constraints: const pw.BoxConstraints(maxWidth: double.infinity),
              child: pw.Text(
                '---------------------------------------------------------------------------------------------------------------------',
                maxLines: 1,
              ),
            ),
            pw.Table(
                border: pw.TableBorder.symmetric(
                  outside: const pw.BorderSide(
                    style: pw.BorderStyle.none,
                  ),
                ),
                children: paymethodTable(font, order['selectedPaymethods'])),
            pw.Row(mainAxisAlignment: pw.MainAxisAlignment.end, children: [
              textWidget(toFixed(order['customerRemaining']), 8, font),
              pw.Spacer(),
              textWidget(S.current.remainingClient, 8, font),
            ]),
            // pw.Container(
            //   constraints: const pw.BoxConstraints(maxWidth: double.infinity),
            //   child: pw.Text(
            //     '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<',
            //     maxLines: 1,
            //   ),
            // ),
            pw.SizedBox(height: 2.5),
            pw.BarcodeWidget(
              data: QRTLV().tlv(
                  sellerName: order['orgTitle'],
                  vatRegistration: order['orgVatRegistrationNumber'],
                  dateTime: order['addOrdertime'],
                  totalOrderWithVat: order['totalOrderWithVat'],
                  vat: order['totalVat']),
              barcode: pw.Barcode.qrCode(),
              width: 70,
              height: 70,
            ),
            pw.SizedBox(height: 2.5),
            textWidget(' ${S.current.invoiceEndMessage}', 8, font),
          ],
        );
      },
    ));

    return pdf.save();
  }

  //generated items tabel
  List<pw.TableRow> generateRows(font, items) {
    List<pw.TableRow> rows = [];
    // Header row
    rows.add(
      pw.TableRow(
        decoration: const pw.BoxDecoration(),
        children: [
          textWidget(S.current.totalPriceWithVat, 6, font),
          textWidget(S.current.tax, 6, font),
          textWidget(S.current.unitPrice, 6, font),
          textWidget(S.current.quantity, 6, font),
          textWidget(S.current.products, 8, font),
        ],
      ),
    );
    for (var item in items) {
      rows.add(
        pw.TableRow(
          decoration: const pw.BoxDecoration(),
          children: [
            textWidget(toFixed(item.totalPriceWithVat), 6, font),
            textWidget(toFixed(item.vat), 6, font),
            // textWidget(
            //     toFixed(double.parse(item.units[item.selectedUnit].unitPrice))
            //         .toString(),
            //     6,
            //     font),
            textWidget(toFixed(double.parse(item.price)).toString(), 6, font),
            textWidget(item.quantity.toString(), 6, font),
            textWidget(item.arabicTitle, 6, font),
          ],
        ),
      );
    }
    return rows;
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

  //generated items tabel
  List<pw.TableRow> paymethodTable(font, paymethods) {
    List<pw.TableRow> rows = [];

    for (var paymethod in paymethods) {
      rows.add(
        pw.TableRow(
          children: [
            textWidget(toFixed(paymethod.value), 8, font),
            pw.Spacer(),
            textWidget(paymethod.arabicTitle, 8, font),
          ],
        ),
      );
    }
    return rows;
  }
}
