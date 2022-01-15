import 'package:firstapp_fiftychanllenge/app/di.dart';
import 'package:flutter/material.dart';

import 'app/my_app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();

  runApp(MyApp());
}
