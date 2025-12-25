import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hexcolor/hexcolor.dart';

const secureStorage = FlutterSecureStorage();
 List<String> genders(BuildContext context) => ['male', 'female'];

final ipAddress = "http://192.168.1.6:8000";
final baseURL = "$ipAddress/api";
final ip = ipAddress;

final defaultColor = HexColor('#2BB7C3');
final secondaryColor = HexColor('#2D2F31');

