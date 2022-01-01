import 'package:jaguar/jaguar.dart';

main(List<String> args) async {
  // Create SecurityContext from certificate and private key
  final security = SecurityContext()
    ..useCertificateChain("bin/ssl/certificate.pem")
    ..usePrivateKey("bin/ssl/keys.pem");

  // Configure Jaguar with you securityContext
  final server = Jaguar(securityContext: security, port: 8081);
  // Add your apis
  server.get('/hello', (_) => 'Hello');
  server.log.onRecord.listen(print);
  // Launch server
  await server.serve(logRequests: true);
}
