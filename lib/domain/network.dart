class Network {
  static const String domain = 'staging.dev.gelis-app.co.id';
  static const String path = '/gelis-api/mobile';
  static const String url = 'https://${Network.domain}${Network.path}';

  static const String approve = '${Network.url}/approve';
  static const String checklist = '${Network.url}/checklist';
  static const String ongoing = '${Network.url}/ongoing';
  static const String revision = '${Network.url}/revision';
  static const String revised = '${Network.url}/revised';
  static const String report = '${Network.url}/report';
  static const String calendar = '${Network.url}/calendar';
  static const String others = '${Network.url}/others';
  static const String data = '${Network.url}/data';
  static const String history = '${Network.url}/history';


  static const String login = '${Network.url}/user-token';
  static const String foto = '${Network.url}/wo-submit-foto';
  static const String map = '${Network.url}/wo-submit-hasil';
  static const String paramsupport = '${Network.url}/quotationParameterPendukung';
  static const String paramtest = '${Network.url}/quotationParameterPengujian';
  static const String plate = '${Network.url}/wo-update-hasil-bywadah';
  static const String status = '${Network.url}/wo-submit-status';

  static const String profile = '${Network.path}/user-me';
  static const String wolist = '${Network.path}/wo-list';
  static const String wodatelist = '${Network.path}/wo-list';
  static const String wodetail = '${Network.path}/wo-detail';
  static const String wosample = '${Network.path}/wo-input-data';
  static const String womember = '${Network.path}/wo-anggota';

  static Map<String, String> header = {
    'Content-Type': 'application/json; charset=utf-8'
  };

  static Map<String, String> tokenHeader(String s) {
     Map<String, String> header = Network.header;
    header.addAll({'Authorization': s});
    return header;
  }
}
