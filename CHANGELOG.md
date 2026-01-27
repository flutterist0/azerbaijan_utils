# Changelog

All notable changes to this project will be documented in this file.

---

## [2.1.0] - 2026-01-27

### Added

- **New Country Support**: Added validation rules for 4 new countries:
  - 🇬🇪 **Georgia (GE)**: Phone, identity (Personal Number), vehicle plates, postal codes
  - 🇦🇲 **Armenia (AM)**: Phone, identity (Social Card Number), vehicle plates, postal codes
  - 🇷🇺 **Russia (RU)**: Phone, identity (Passport), vehicle plates (Cyrillic), postal codes
  - 🇮🇷 **Iran (IR)**: Phone, identity (National Code), vehicle plates, postal codes
- Added support for major mobile operators in new countries:
  - Georgia: Magticom, Geocell, Beeline, Silknet
  - Armenia: Ucom, VivaCell-MTS, Beeline
  - Russia: МТС, МегаФон, Билайн
  - Iran: Hamrah-e Aval (MCI), Irancell, Rightel, TeleKish

### Changed

- Updated `rules.json` with comprehensive validation patterns for 6 countries total (AZ, TR, GE, AM, RU, IR)
- Improved phone operator detection logic for better accuracy across different number formats

---

## [2.0.5] - 2026-01-16

### 🚀 Major Architecture Change: Dynamic Rule Engine

The package has been completely refactored to support multiple countries via a configuration-driven approach using JSON assets.

#### Added

- **Multi-Country Support**: Added support for Turkey (TR) alongside Azerbaijan (AZ)
- **Dynamic Rules**: Logic is now loaded from `assets/rules.json`, allowing easier updates to Regex patterns without code changes
- **Initialization**: Added `Validati10.initialize()` method. This must be called (e.g., in `main.dart`) before using any validators
- **Custom Rules**: Added support for loading custom JSON rule files via the `customPath` parameter in initialization

#### Changed

- **Breaking Change**: All validation methods (e.g., `validatePhoneNumber`, `validateIdentity`) now require a `country` parameter (e.g., `country: 'AZ'`)
- **Breaking Change**: Helper methods like `getPhoneOperator` and `getVehicleRegion` now require the `country` parameter
- Refactored internal logic to parse and apply Regex patterns dynamically from JSON

#### Removed

- **Breaking Change**: Removed Dart Extension methods (e.g., `.isValidAzPhoneNumber`, `.isValidFIN`) because the country parameter is now mandatory and getters cannot accept arguments
- Removed hardcoded Regex patterns from Dart code to reduce bundle size and improve maintainability

---

## [1.0.0] - 2025-12-15

### Added

- Initial release of Validati10 package
- Phone number validation with support for all Azerbaijani mobile operators:
  - Azercell (50, 51, 55)
  - Bakcell (70, 77)
  - Nar Mobile (99)
  - Nakhtel (10)
  - Ulduz Mobile (60)
- FIN (personal identification number) validation
- Vehicle license plate validation with region code extraction
- Postal code validation (AZ format)
- Phone number formatting to standard format (`+994XXXXXXXXX`)
- Vehicle plate formatting (`XX-YY-ZZZ`)
- Postal code formatting (`AZ XXXX`)
- Mobile operator detection from phone numbers
- Region code extraction from vehicle plates
- Extension methods for convenient string validation
- Comprehensive documentation and examples
- Full test coverage

### Features

- Support for multiple phone number input formats
- Case-insensitive validation for FIN codes and vehicle plates
- Flexible input formats with automatic cleaning (spaces, dashes, etc.)
- Null-safe implementation

### Documentation

- Complete README with usage examples
- API reference documentation
- Code examples for all features
- Support for both Azerbaijani and English users