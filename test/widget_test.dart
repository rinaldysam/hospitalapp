// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:valbury/helper/validation_helper.dart';

void main() {
  test('Valid Email Test', () {
    // Valid Emails
    expect(ValidationHelper.isEmailValid('example@email.com'), true);
    expect(ValidationHelper.isEmailValid('user.name@example.co.id'), true);
    expect(ValidationHelper.isEmailValid('test1234@example-mail.com'), true);
  });

  test('Validasi Nomor Telepon', () {
    // Valid Phone Number
    expect(ValidationHelper.isPhoneNumberValid('081234567890'), true);
    expect(ValidationHelper.isPhoneNumberValid('0856789123456'), true);
    expect(ValidationHelper.isPhoneNumberValid('0812345678901'), true);

    // Invalid Phone Number
    expect(ValidationHelper.isPhoneNumberValid(''), false);
    expect(ValidationHelper.isPhoneNumberValid('12345'), false);
    expect(ValidationHelper.isPhoneNumberValid('087a1b2c345'), false);
  });
}
