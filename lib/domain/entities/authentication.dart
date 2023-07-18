class Authentication {
  final String username;
  final String email;
  final String password;
  final bool isAdmin;
  final bool isPrinter;
  final String? qrId;
  final String id;
  final String createdAt;
  final String updatedAt;
  final int v;

  Authentication({
    required this.username,
    required this.email,
    required this.password,
    required this.isAdmin,
    required this.isPrinter,
    this.qrId,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });
}
