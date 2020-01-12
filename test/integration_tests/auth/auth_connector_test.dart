import '../../../lib/src/10_auth/auth_connector.dart';
import '../../../lib/src/90_infra/faui_exception.dart';
import '../../../lib/src/90_model/faui_user.dart';
import 'package:test/test.dart';
import '../../util/auth_util.dart';
import '../../util/test_db.dart';

void main() {
  FauiUser user;
  setUp(() async {
    user = await AuthUtil.signIn();
  });

  tearDown(() async {
    await AuthUtil.deleteUser(user);
  });

  test('Register, sign-in, send reset, delete and delete', () async {
    // await AuthConnector.sendResetLink(apiKey: testDb.apiKey, email: user.email);
    await fauiDeleteUserIfExists(apiKey: testDb.apiKey, idToken: user.token);
    await fauiDeleteUserIfExists(apiKey: testDb.apiKey, idToken: user.token);
  });

  test('Refresh token', () async {
    var user2 = await fauiRefreshToken(apiKey: testDb.apiKey, user: user);

    expect(user2.userId, user.userId);
    expect(user2.email, user.email);
    expect(user2.token != null, true);
  });

  test('Registration fails if user exists', () async {
    try {
      await fauiRegisterUser(apiKey: testDb.apiKey, email: user.email);
      expect(true, false);
    } on FauiException catch (exception) {
      expect(
          FauiException.exceptionToUiMessage(exception)
              .contains("already registered"),
          true);
    }
  });

  test('Token validation', () async {
    FauiUser user2 =
        await fauiVerifyToken(apiKey: testDb.apiKey, token: user.token);

    expect(user2.email, user.email);
    expect(user2.userId, user.userId);

    await fauiDeleteUserIfExists(apiKey: testDb.apiKey, idToken: user.token);
  });
}