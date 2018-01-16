import 'dart:io';
import 'package:jaguar/jaguar.dart';

main(List<String> args) async {
  // Create SecurityContext from certificate and private key
  final security = new SecurityContext()
    ..useCertificateChain("bin/ssl/certificate.pem")
    ..usePrivateKey("bin/ssl/keys.pem");

  // Configure Jaguar with you securityContext
  final server = new Jaguar(securityContext: security);
  // Add your apis
  server.get('/hello', (_) => 'Hello');
  // Launch server
  await server.serve();
  print("Serving on ${server.resourceName} ...");
}
