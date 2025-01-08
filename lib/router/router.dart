import 'package:sotuv/auth/login_page.dart';
import 'package:sotuv/page/dashboard_page.dart';
import 'package:sotuv/page/menu/client_page.dart';
import 'package:sotuv/page/menu/contract_page.dart';
import 'package:sotuv/page/menu/home_page.dart';
import 'package:sotuv/page/menu/monitoring_page.dart';

final routes = {
  '/login_page': (context) => const LoginPage(),
  '/dashboard_page': (context) => DashboardPage(),
  '/client_page': (context) => ClientPage(),
  '/home_page': (context) => HomePage(),
  '/contract_page': (context) => ContractPage(),
  '/monitoring_page': (context) => MonitoringPage(),
};
