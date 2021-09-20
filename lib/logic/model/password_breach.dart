class PasswordBreach {
  final bool isBreached;

  final int breachesCount;
  final String hashSuffix;

  PasswordBreach(this.isBreached, this.breachesCount, this.hashSuffix);

  factory PasswordBreach.empty() => PasswordBreach(false, 0, 'Loading');
}
