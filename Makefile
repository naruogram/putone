
.PHONY: setup
setup:
	fvm install
	bundle install
	gem update cocoapods
	fvm flutter pub get
	flutter pub run build_runner build --delete-conflicting-outputs

.PHONY: refresh
setup:
	fvm flutter clean
	make setup
