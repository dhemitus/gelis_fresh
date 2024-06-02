import 'dart:async';
import 'package:gelis/modules/modules.dart';

List<Map<String, dynamic>> _wos = [
  {
    'id': '1',
    'serial': 'WO.042022.00089',
    'title': 'Sampling Air Limbah',
    'company': 'PT.Agie Nawawi Indonesia',
    'calendar': '10 - 12 Januari 2022',
    'contact': 'Bulan Sutara',
    'location': 'Site A Sorowako',
    'locate': '3 Titik',
    'type': 'water',
    'status':'approve'
  },
  {
    'id': '2',
    'serial': 'WO.042022.00090',
    'title': 'Sampling Air Limbah',
    'company': 'PT.Agie Nawawi Indonesia',
    'calendar': '10 - 12 Januari 2022',
    'contact': 'Bulan Sutara',
    'location': 'Site A Sorowako',
    'locate': '3 Titik',
    'type': 'air',
    'status':'checklist'
  },
  {
    'id': '3',
    'serial': 'WO.042022.00091',
    'title': 'Sampling Air Limbah',
    'company': 'PT.Agie Nawawi Indonesia',
    'calendar': '10 - 12 Januari 2022',
    'contact': 'Bulan Sutara',
    'location': 'Site A Sorowako',
    'locate': '3 Titik',
    'type': 'water',
    'status':'ongoing'
  },
  {
    'id': '4',
    'serial': 'WO.042022.00092',
    'title': 'Sampling Air Limbah',
    'company': 'PT.Agie Nawawi Indonesia',
    'calendar': '10 - 12 Januari 2022',
    'contact': 'Bulan Sutara',
    'location': 'Site A Sorowako',
    'locate': '3 Titik',
    'type': 'air',
    'status':'ongoing'
  },
  {
    'id': '5',
    'serial': 'WO.042022.00093',
    'title': 'Sampling Air Limbah',
    'company': 'PT.Agie Nawawi Indonesia',
    'calendar': '10 - 12 Januari 2022',
    'contact': 'Bulan Sutara',
    'location': 'Site A Sorowako',
    'locate': '3 Titik',
    'type': 'water',
    'status':'approve'
  },
  {
    'id': '6',
    'serial': 'WO.042022.00093',
    'title': 'Sampling Air Limbah',
    'company': 'PT.Agie Nawawi Indonesia',
    'calendar': '10 - 12 Januari 2022',
    'contact': 'Bulan Sutara',
    'location': 'Site A Sorowako',
    'locate': '3 Titik',
    'type': 'water',
    'status':'checklist'
  },
  {
    'id': '7',
    'serial': 'WO.042022.00093',
    'title': 'Sampling Air Limbah',
    'company': 'PT.Agie Nawawi Indonesia',
    'calendar': '10 - 12 Januari 2022',
    'contact': 'Bulan Sutara',
    'location': 'Site A Sorowako',
    'locate': '3 Titik',
    'type': 'water',
    'status':'checklist'
  },
  {
    'id': '8',
    'serial': 'WO.042022.00093',
    'title': 'Sampling Air Limbah',
    'company': 'PT.Agie Nawawi Indonesia',
    'calendar': '10 - 12 Januari 2022',
    'contact': 'Bulan Sutara',
    'location': 'Site A Sorowako',
    'locate': '3 Titik',
    'type': 'water',
    'status':'approve'
  },
  {
    'id': '9',
    'serial': 'WO.042022.00093',
    'title': 'Sampling Air Limbah',
    'company': 'PT.Agie Nawawi Indonesia',
    'calendar': '10 - 12 Januari 2022',
    'contact': 'Bulan Sutara',
    'location': 'Site A Sorowako',
    'locate': '3 Titik',
    'type': 'water',
    'status':'approve'
  },
];

class WoListRepository {
  List<WoItem>? _l;

  Future<List<WoItem>> loadWoList() async {
    return Future.delayed(
      const Duration(milliseconds: 300),
        () {
          _l = [];
          _wos.map((Map<String, dynamic> e) => _l!.add(WoItem.fromMap(e))).toList();
          return _l!;
        }
    );
  }

}
