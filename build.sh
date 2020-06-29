echo "Building for android..."
flutter build apk --target-platform android-arm --split-per-abi
flutter build apk --target-platform android-x64 --split-per-abi
flutter build apk --target-platform android-arm64 --split-per-abi
echo "Done"