import 'dart:convert';
import 'dart:typed_data';

// Tag Length values
class QRTLV {
  BytesBuilder bytesBuilder = BytesBuilder();
  final Base64Encoder b64encoder = const Base64Encoder();
  tlv({
    required String sellerName,
    required String vatRegistration,
    required String dateTime,
    required String totalOrderWithVat,
    required String vat,
  }) {
    //sellerName
    bytesBuilder.addByte(1);
    List<int> sellerNameBytes = utf8.encode(sellerName);
    bytesBuilder.addByte(sellerNameBytes.length);
    bytesBuilder.add(sellerNameBytes);

    // 2 vat Registration Number
    bytesBuilder.addByte(2);
    List<int> vatRegistrationBytes = utf8.encode(vatRegistration);
    bytesBuilder.addByte(vatRegistration.length);
    bytesBuilder.add(vatRegistrationBytes);
    // 3 Date Time
    bytesBuilder.addByte(3);
    List<int> dateTimeBytes = utf8.encode(dateTime);
    bytesBuilder.addByte(dateTimeBytes.length);
    bytesBuilder.add(dateTimeBytes);
    // 4 Total with vat
    bytesBuilder.addByte(4);
    List<int> totalOrderWithVatBytes = utf8.encode(totalOrderWithVat);
    bytesBuilder.addByte(totalOrderWithVatBytes.length);
    bytesBuilder.add(totalOrderWithVatBytes);
    // 5 vat
    bytesBuilder.addByte(5);
    List<int> vatBytes = utf8.encode(vat);
    bytesBuilder.addByte(vatBytes.length);
    bytesBuilder.add(vatBytes);

    // Here we collect 5 paramter
    Uint8List qrCodeAsBytes = bytesBuilder.toBytes();
    return b64encoder.convert(qrCodeAsBytes);
  }
}
