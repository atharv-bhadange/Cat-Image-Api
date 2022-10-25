import 'package:cat_api/services/api_service.dart';
import 'package:flutter/widgets.dart';

import '../model/image_model.dart';

class CatImageProvider extends ChangeNotifier {
  final _service = ApiService();
  late Cat _cat;
  Cat get getCat => _cat;
  bool isLoading = false;
  Future<void> getAllCats() async {
    isLoading = true;
    notifyListeners();

    final res = await _service.getData();
    _cat = res;

    isLoading = false;
    notifyListeners();
  }
}
