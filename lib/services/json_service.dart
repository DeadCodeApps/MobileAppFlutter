import 'dart:convert';

Map<String, dynamic> parseToJson(bodyBytes) {
  return json.decode(utf8.decode(bodyBytes));
}
