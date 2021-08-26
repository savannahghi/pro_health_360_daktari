[![Release](https://img.shields.io/badge/Version-^1.0.0-success.svg?style=for-the-badge)](https://shields.io/)
[![Maintained](https://img.shields.io/badge/Maintained-Actively-informational.svg?style=for-the-badge)](https://shields.io/)
[![Release](https://img.shields.io/badge/Coverage-100-success.svg?style=for-the-badge)](https://shields.io/)

# AfyaMoja

### Project prerequisites

1. The **AfyaMoja** app runs on Flutter version 2.2.3 **stable channel**. To check the flutter version and channel installed in your machine run `flutter --version`.

2. To switch from another channel of Flutter to the stable channel run `flutter channel stable`.

3. To install Flutter version 2.2.3 run `flutter version v2.2.3`.

Looks like we are done with the prerequisites :-)

### How to setup and run bewell-professional

1. Clone the project by running `git clone https://github.com/savannahghi/AfyaMoja.git` or download the code
2. `cd AfyaMoja`
3. Run `flutter pub get`
4. You can now run the app on an attached device or emulator

## How to setup and run unit, widget and integration tests locally

### Unit Tests

To run unit and widget tests, you will require to install `lcov` by running `sudo apt-get install lcov` in the terminal. Finally, run the following commands in the terminal:

1. From the root folder, run `flutter test --coverage test/`

2. Run `genhtml -o coverage coverage/lcov.info`

3. To view the coverage, open the html file generated at `coverage/index.html` with your preferred browser.

### Integration tests

To run integration tests, ensure that you have an emulator running. See instructions on how to [run an emulator](https://flutter.dev/docs/get-started/install/linux#set-up-the-android-emulator).

1. Then run `flutter drive --target=test_driver/app.dart`

## Dart & Flutter Version

- Dart 2: >= 2.12
- Flutter: >=2.2.3

## Developing & Contributing

First off, thanks for taking the time to contribute!

Be sure to check out detailed instructions on how to contribute to this project [here](https://github.com/savannahghi/AfyaMoja/blob/main/CONTRIBUTING.md) and go through out [Code of Conduct](https://github.com/savannahghi/AfyaMoja/blob/main/CODE_OF_CONDUCT.md).

GPG Signing:
As a contributor, you need to sign your commits. For more details check [here](https://docs.github.com/en/github/authenticating-to-github/managing-commit-signature-verification/signing-commits)

## License

This library is distributed under the MIT license found in the [LICENSE](https://github.com/savannahghi/AfyaMoja/blob/main/LICENSE) file.
