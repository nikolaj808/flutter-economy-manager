import 'package:shared_preferences/shared_preferences.dart';

class Month {

  Future<bool> getChange() async {
    int currentMonth = DateTime.now().month;
    final prefs = await SharedPreferences.getInstance();
    final date = prefs.getInt('date');
    if (date == null) {
      prefs.setInt('date', currentMonth);
      return false;
    }
    else if (date != currentMonth){
      prefs.setInt('date', currentMonth);
      return true;
    }
    return false;
  }

  Future<String> getMonth() async {
    final prefs = await SharedPreferences.getInstance();
    final date = prefs.getInt('date');
    switch (date) {
      case 1:
        {
          return 'JANUARY';
        }
        break;

      case 2:
        {
          return 'FEBRUARY';
        }
        break;

      case 3:
        {
          return 'MARCH';
        }
        break;

      case 4:
        {
          return 'APRIL';
        }
        break;

      case 5:
        {
          return 'MAY';
        }
        break;

      case 6:
        {
          return 'JUNE';
        }
        break;

      case 7:
        {
          return 'JULY';
        }
        break;

      case 8:
        {
          return 'AUGUST';
        }
        break;

      case 9:
        {
          return 'SEPTEMBER';
        }
        break;

      case 10:
        {
          return 'OCTOBER';
        }
        break;

      case 11:
        {
          return 'NOVEMBER';
        }
        break;

      case 12:
        {
          return 'DECEMBER';
        }
        break;

      default:
        {
          return 'ERROR';
        }
    }
  }

}