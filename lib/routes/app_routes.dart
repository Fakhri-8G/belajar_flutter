import 'package:belajar_flutter/form/form_page.dart';
import 'package:belajar_flutter/kasir/index.dart';
import 'package:belajar_flutter/list/detailScreen.dart';
import 'package:belajar_flutter/list/grid.dart';
import 'package:belajar_flutter/list/instagram.dart';
import 'package:belajar_flutter/pages/form_eskul.dart';
import 'package:belajar_flutter/pages/input_form.dart';
import 'package:belajar_flutter/row_column/ColumnWidget.dart';
import 'package:belajar_flutter/row_column/Latihan1.dart';
import 'package:belajar_flutter/row_column/Latihan2.dart';
import 'package:belajar_flutter/row_column/RowColumnWidget.dart';
import 'package:belajar_flutter/row_column/RowWidget.dart';
import 'package:belajar_flutter/pages/form_page.dart';
import 'package:flutter/material.dart';
import 'package:belajar_flutter/list/list-screen.dart';
import 'package:belajar_flutter/pages/home_page.dart';
import 'package:belajar_flutter/pages/about_page.dart';

class AppRoutes {
  static const home = '/';
  static const listScreen = '/list-screen';
  static const detailScreen = '/detail-screen';
  static const grid = '/grid';
  static const instagram = '/instagram';
  static const columnWidget  = '/column-widget';
  static const latihan1 = '/latihan1';
  static const latihan2 = '/latihan2';
  static const rowColumnWidget = '/row-column-widget';
  static const rowWidget = '/row-widget';
  static const form = '/form';
  static const formPage = '/form-page';
  static const inputPage = '/input-page';
  static const eskulPage = '/form-eskul-page';
  static const kasirIndexPage = '/index-page';
  // static const  = '/';
  static const about = '/about';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => HomePage(),
    listScreen: (context) => ListScreen(),
    // detailScreen: (context) => ArticleDetailScreen(data: data),
    grid: (context) => GridProductPage(),
    instagram: (context) => Instagram(),
    columnWidget: (context) => ColumnWidget(),
    latihan1: (context) => Latihan1(),
    latihan2: (context) => Latihan2(),
    rowColumnWidget: (context) => RowColumnWidget(),
    rowWidget: (context) => RowWidget(),
    form: (context) => Formpage(),
    formPage: (context) => FormPage(),
    inputPage: (context) => BelajarForm(),
    eskulPage: (context) => FormEskul(),
    kasirIndexPage: (context) => KasirIndexPage(),
    about: (context) => AboutPage(),
  };
}
