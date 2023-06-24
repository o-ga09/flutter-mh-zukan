class Data {
  final int id;
  final String name;
  final String imgUrl;
  final List<String> types;

  Data({
    required this.id,
    required this.name,
    required this.imgUrl,
    required this.types,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    List<String> typesToList(dynamic types) {
      List<String> ret = [];
      for (int i = 0; i < types.length; i++) {
        ret.add(types[i]['type']['name']);
      }
      return ret;
    }

    return Data(
      id: json['id'],
      name: json['name'],
      types: typesToList(json['types']),
      imgUrl: json['sprites']['other']['official-artwork']['front_default'],
    );
  }
}

class UserData {
  final int id;
  final String name;
  final SettingData setting;

  UserData({
    required this.id,
    required this.name,
    required this.setting,
  });
}

class SettingData {
  final bool isMode;

  SettingData({
    required this.isMode,
  });
}