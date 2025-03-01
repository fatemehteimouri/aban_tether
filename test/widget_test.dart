import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:aban_tether/src/features/login/presentation/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:aban_tether/src/features/login/presentation/bloc/login_cubit.dart';
import 'package:aban_tether/src/features/login/domain/usecases/login_usecase.dart';
import 'package:mockito/mockito.dart';

// Mock برای LoginUseCase
class MockLoginUseCase extends Mock implements LoginUseCase {}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Login and navigate to home', (WidgetTester tester) async {
    // Mock LoginUseCase
    final mockLoginUseCase = MockLoginUseCase();



    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(loginUseCase: mockLoginUseCase),
          child: const LoginScreen(),
        ),
      ),
    );

    // وارد کردن ایمیل و رمز عبور
    await tester.enterText(find.byType(TextFormField).at(0), 'test@example.com');
    await tester.enterText(find.byType(TextFormField).at(1), 'password123');

    // کلیک روی دکمه‌ی Submit
    await tester.tap(find.text('Submit'));
    await tester.pumpAndSettle();

    // بررسی ناوبری به صفحه‌ی خانه
    expect(find.text('Home Page'), findsOneWidget);
  });

  testWidgets('Show error message when login fails', (WidgetTester tester) async {
    // Mock LoginUseCase
    final mockLoginUseCase = MockLoginUseCase();

    // شبیه‌سازی خطای API
    when(mockLoginUseCase.call(any)).thenThrow(Exception('Login failed'));

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(loginUseCase: mockLoginUseCase),
          child: const LoginScreen(),
        ),
      ),
    );

    // وارد کردن ایمیل و رمز عبور
    await tester.enterText(find.byType(TextFormField).at(0), 'test@example.com');
    await tester.enterText(find.byType(TextFormField).at(1), 'wrongpassword');

    // کلیک روی دکمه‌ی Submit
    await tester.tap(find.text('Submit'));
    await tester.pumpAndSettle();

    // بررسی نمایش پیام خطا
    expect(find.text('Login failed'), findsOneWidget);
  });
}