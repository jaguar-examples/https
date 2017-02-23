library api;

import 'dart:async';

import 'package:jaguar/jaguar.dart';

part 'api.g.dart';

@Api(path: '/')
class ExampleApi {

  @Route(path: '/', methods: const ['GET'])
  String api() => "It works";
}
