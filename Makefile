.PHONY: \
    clean \
	generated \
	analyze \
	test \
	format \
	integration_test

clean:
	@fvm flutter clean && flutter pub get

generated:
	@fvm flutter pub run build_runner build --delete-conflicting-outputs

analyze:
	@fvm flutter analyze

test:
	@fvm flutter test --coverage && genhtml coverage/lcov.info -o coverage/html && open coverage/html/index.html

format:
	@fvm dart format . && dart fix --dry-run

integration_test:
	@fvm flutter test integration_test