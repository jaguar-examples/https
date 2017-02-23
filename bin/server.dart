import 'dart:io';
import 'package:jaguar/jaguar.dart';

import 'package:https/api.dart';

main(List<String> args) async {

  final ea = new JaguarExampleApi();

  /// provide you ssl certificate to jaguar with password if needed
  SecurityContext security = new SecurityContext()
    ..useCertificateChain("bin/ssl/cert.pem")
    ..usePrivateKey("bin/ssl/key.pem", password: "jaguarPass");

  /// Configure Jaguar with you securityContext
  Jaguar configuration = new Jaguar(multiThread: true, securityContext: security);

  /// add your apis
  configuration.addApi(ea);
  // ..more apis

  /// launch server
  print("Serve on ${configuration.resourceName}");
  await configuration.serve();
}
