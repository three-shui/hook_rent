import 'package:hook_rent/page/home/tab_search/filter_bar/filter_bar_data.dart';
import 'package:scoped_model/scoped_model.dart';

class CityModel extends Model {
  GeneralType? _city;

  set city(GeneralType data) {
    _city = data;
    notifyListeners();
  }

  GeneralType get city => _city!;
}
