import 'package:mysql1/mysql1.dart';
class MySQL{
  static String host = 'localhost',
                user = 'root',
                password = '1234',
                db = 'ptc';
  static int port = 3306;
  MySQL();

  Future<MySqlConnection> getConnection()async{
    var setting =  ConnectionSettings(
      host: host,
      user: user,
      password: password,
      port: port,
      db: db
    );
    return await MySqlConnection.connect(setting);
  }
}