
.PHONY: setup
setup:
	fvm install
	fvm flutter pub get
	fvm flutter pub run build_runner build --delete-conflicting-outputs

# .PHONY: refresh
# setup:
# 	fvm flutter clean
# 	make setup
