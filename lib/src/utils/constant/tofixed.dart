String toFixed(double value, [int decimalPlace = 2]) {
  try {
    String originalNumber = value.toString();
    List<String> formattedNumber = originalNumber.split('.');
    if (formattedNumber[1].length > 2) {
      return "${formattedNumber[0]}.${formattedNumber[1].substring(0, decimalPlace)}";
    } else {
      return originalNumber;
    }
  } catch (_) {}
  return value.toString();
}


// if (formattedNumber.length > 1) {
//   String secondPart = formattedNumber[1];
//   if (secondPart.length > decimalPlace) {
//     secondPart = secondPart.substring(0, decimalPlace);
//   }
//   String result = '${formattedNumber[0]}.$secondPart';
//   // Use the 'result' variable in your code.
// } else {
//   // Handle the case when formattedNumber doesn't have enough characters.
//   // Maybe show an error message or use a default value.
// }
