// login Exception
class InvalidCredentialAuthException implements Exception {}

// register Exception
class WeakPasswordAuthException implements Exception {}

class EmailAlreadyInUseAuthException implements Exception {}

class InvalidEmailAuthException implements Exception {}


// other Exception
class GenericAuthException implements Exception {}

class UserNotLoggedInAuthException implements Exception {}
