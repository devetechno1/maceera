import 'dart:convert';

import '../app_config.dart';
import '../data_model/popup_banner_model.dart';
import 'api-request.dart';

Future<List<PopupBannerModel>> fetchBannerpopupData() async {
  const String url = '${AppConfig.BASE_URL}/banners-popup';

  try {
    final response = await ApiRequest.get(url: url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      print('Popup Banner Response: ${jsonEncode(data)}');
      return (data['data'] as List<dynamic>?)
          ?.map((e) => PopupBannerModel.fromMap(e as Map<String, dynamic>))
          .toList() ?? [];
    } else {
      print('Failed to load popup banner, status code: ${response.statusCode}');
      return [];
    }
  } catch (e) {
    print('Error fetching popup banner: $e');
    return [];
  }
}
