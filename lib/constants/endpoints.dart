class Endpoints {
  Endpoints._();
  // static const String baseUrl = 'https://peanut.ifxdb.com/docs/clientcabinet/index.html';

  // static const String login = 'api/login';
  // static const String register = 'api/register';

  //* This is for hfrs
  static const String hfrsBaseUrl =
      'https://hfrs.taytaypalawan.net/barangay/mobile/';

  // Reports Endpoints
  static const String displayHousehold = 'reports/display-household';
  static const String displayFamily = 'reports/display-family';
  static const String displayIndiv = 'reports/display-indiv';

  // others Endpoints
  static const String fetchAuditTrail = 'others/audit_trail';

  //! Dont put api key on the client side. Do it on the server side
  //! This is just for testing purposes
  //! and should not be used in production
  // https://reqres.in/signup
  static const String apiKey =
      String.fromEnvironment('API_KEY', defaultValue: 'reqres-free-v1');

  static const String peanutUrl = 'https://peanut.ifxdb.com/api/';
  static const int receiveTimeout = 15000;
  static const int connectionTimeout = 30000;
  
  static const String peanutLogin =
      'ClientCabinetBasic/IsAccountCredentialsCorrect';
  static const String peanutRegister = '';

  static const String peanutAccount =
      'ClientCabinetBasic/GetAccountInformation';
  static const String peanutLastFourNumber =
      'ClientCabinetBasic/GetLastFourNumbersPhone';
  static const String peanutTrade = 'ClientCabinetBasic/GetOpenTrades';
}
