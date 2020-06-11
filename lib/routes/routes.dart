import 'package:flutter/material.dart';

import 'package:patrimoniopolitico/main.dart';
import 'package:patrimoniopolitico/pages/add_politico_page.dart';
import 'package:patrimoniopolitico/pages/single_item_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {

  return <String, WidgetBuilder>{
    'home'           : (BuildContext context) => MyHomePage(),
    'single_item': (BuildContext context)  => SingleItemPage(),
    'add_politico': (BuildContext context) => AddPoliticoPage(),
  };
}