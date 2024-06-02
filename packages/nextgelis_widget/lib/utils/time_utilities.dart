import 'package:intl/intl.dart';

class TimeUtilities {
  static String now() {
    var n = DateTime.now();
    var f = DateFormat('yyyy-MM-dd');
    return f.format(n);
  }
   
  static String toSimpleString(DateTime s) {
    var f = DateFormat('yyyy-MM-dd');
    return f.format(s);
  }

  static String toRangeString(String s, String f) {
    final b = DateTime.parse(s);
    final e = DateTime.parse(f);
    final t = DateFormat('dd').format(b);
    final c = DateFormat('dd MMMM', 'id_ID').format(e);
    return '$t - $c';
  }

  static String toColumnString(DateTime s) {
    var f = DateFormat('dd-MM-yyyy');
    return f.format(s);
  }

  static String toDate(String d) {
    var t = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(d);
    var x = DateTime.parse(t.toString());
    return DateFormat('dd MMMM yyyy', 'id_ID').format(x);
  }

  static String toSlashDate(String d) {
    var t = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(d);
    var x = DateTime.parse(t.toString());
    return DateFormat('dd/MMMM/yyyy', 'id_ID').format(x);
  }
}
