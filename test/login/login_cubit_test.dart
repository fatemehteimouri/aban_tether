import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:aban_tether/src/features/login/domain/usecases/login_usecase.dart';
import 'package:aban_tether/src/features/login/domain/models/param_models/login_param.dart';
import 'package:aban_tether/src/features/login/domain/models/result_models/login_result.dart';
import 'package:aban_tether/src/features/login/domain/repositories/login_repository.dart';
import 'package:aban_tether/src/core/storage/token_storage.dart';

// Mock برای LoginRepo
class MockLoginRepo extends Mock implements LoginRepo {}

// Mock برای TokenStorage
class MockTokenStorage extends Mock implements TokenStorage {}

void main() {
  late LoginUseCase loginUseCase;
  late MockLoginRepo mockLoginRepo;
  late MockTokenStorage mockTokenStorage;

  setUp(() {
    mockLoginRepo = MockLoginRepo();
    mockTokenStorage = MockTokenStorage();
    loginUseCase = LoginUseCase(loginRepo: mockLoginRepo, tokenStorage: mockTokenStorage);
  });

  test('should save token when login is successful', () async {
    // Arrange
    final loginParam = LoginParam(email: 'test@example.com', password: '123456');
    final authToken = 'fake_token';

    // شبیه‌سازی پاسخ موفقیت‌آمیز از loginRepo
    when(mockLoginRepo.login(loginParam)).thenAnswer((_) async => LoginResult(authToken: authToken));

    // Act
    await loginUseCase.call(loginParam);

    // Assert
    verify(mockLoginRepo.login(loginParam)).called(1); // بررسی فراخوانی loginRepo
    verify(mockTokenStorage.saveToken(authToken)).called(1); // بررسی ذخیره توکن
  });

  test('should throw exception when login fails', () async {
    // Arrange
    final loginParam = LoginParam(email: 'test@example.com', password: '123456');
    final exception = Exception('Login failed');

    // شبیه‌سازی خطا از loginRepo
    when(mockLoginRepo.login(loginParam)).thenThrow(exception);

    // Act & Assert
    expect(() => loginUseCase.call(loginParam), throwsA(exception)); // بررسی انتقال خطا
  });
}