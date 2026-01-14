# Changelog

All notable changes to this project will be documented in this file.

## [1.0.0] - 2026-01-14

### Added
- Initial release of Azerbaijan Validator package
- Phone number validation with support for all Azerbaijani mobile operators
  - Azercell (50, 51, 55)
  - Bakcell (70, 77)
  - Nar Mobile (99)
  - Nakhtel (10)
  - Ulduz Mobile (60)
- FIN (personal identification number) validation
- Vehicle license plate validation with region code extraction
- Postal code validation (AZ format)
- Phone number formatting to standard format (+994XXXXXXXXX)
- Vehicle plate formatting (XX-YY-ZZZ)
- Postal code formatting (AZ XXXX)
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