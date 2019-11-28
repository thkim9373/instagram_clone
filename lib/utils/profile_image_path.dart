import 'dart:convert';

String getProfileImgPath(String userName) {
  final encoder = AsciiEncoder();
  List<int> codes = encoder.convert(userName);
  int sum = 0;
  codes.forEach((code) => sum += code);

  final imgNum = sum % 900;

  return "https://picsum.photos/id/$imgNum/30/30";
}
