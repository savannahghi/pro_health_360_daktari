.PHONY: generate
generate:
	flutter pub run build_runner build --delete-conflicting-outputs 

.PHONY: test
test:
	rm -rf coverage* && \
	flutter test --coverage test/ && \
	lcov --remove coverage/lcov.info 'lib/*.g.dart' -o coverage/lcov.info && \
            lcov --remove coverage/lcov.info 'lib/**/*.freezed.dart' -o coverage/lcov.info && \
            lcov --remove coverage/lcov.info 'lib/**/*.gr.dart' -o coverage/lcov.info && \
            lcov --remove coverage/lcov.info 'lib/infrastructure/repository/sqlite.dart' -o coverage/lcov.info && \
            lcov --remove coverage/lcov.info 'lib/presentation/communities/*.dart' -o coverage/lcov.info && \
            lcov --remove coverage/lcov.info 'lib/infrastructure/connectivity/*.dart' -o coverage/lcov.info && \
            genhtml -q -o coverage coverage/lcov.info && \
	google-chrome coverage/index.html

.PHONY: covTest
covTest:
	rm -rf coverage* && \
	flutter test test/ && \
	lcov --remove coverage/lcov.info 'lib/**/*.g.dart' -o coverage/lcov.info && \
    lcov --remove coverage/lcov.info 'lib/**/*.freezed.dart' -o coverage/lcov.info && \
	lcov --remove coverage/lcov.info 'lib/infrastructure/repository/sqlite.dart' -o coverage/lcov.info \
    lcov --remove coverage/lcov.info 'lib/**/*.gr.dart' -o coverage/lcov.info && \
    genhtml -q -o coverage coverage/lcov.info

.PHONY: run
run:
	flutter clean && flutter pub get && flutter analyze && flutter run

### Example
# make test-file this=<file-path>
###
.PHONY: test-file
test-file:
	rm -rf coverage* && \
	flutter test --coverage $(this) && lcov --remove coverage/lcov.info 'lib/**/*.g.dart' -o coverage/lcov.info && \
    lcov --remove coverage/lcov.info 'lib/**/*.freezed.dart' -o coverage/lcov.info && \
	lcov --remove coverage/lcov.info 'lib/infrastructure/repository/sqlite.dart' -o coverage/lcov.info \
    lcov --remove coverage/lcov.info 'lib/**/*.gr.dart' -o coverage/lcov.info && \
    genhtml -q -o coverage coverage/lcov.info && \
	google-chrome coverage/index.html