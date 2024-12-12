import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constants {
  static String lang = dotenv.env['LANGUAGE'] ?? "en";
  static String token = dotenv.env['APP_TOKEN']!;
  static String locationId = dotenv.env['LOCATION_ID']!;
  static String businessId = dotenv.env['BUSINESS_ID']!;
}
