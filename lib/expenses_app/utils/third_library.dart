import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final numberFormat = NumberFormat('###.0#', 'en_US');
final dateFormat = DateFormat.yMMMMEEEEd();
final _uuid = Uuid();


String getUuid(){
  return _uuid.v4().toString();
}

