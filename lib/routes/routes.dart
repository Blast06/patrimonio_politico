import 'package:flutter/material.dart';

import 'package:patrimoniopolitico/main.dart';
import 'package:patrimoniopolitico/single_item_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {

  return <String, WidgetBuilder>{
    '/'           : (BuildContext context) => MyHomePage(),
    'single_item': (BuildContext context) => SingleItemPage(),
  };
}