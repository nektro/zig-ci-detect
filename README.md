# zig-ci-detect

Detect what kind of CI environment the program is in

Adapted from https://github.com/npm/ci-detect

## Usage
> `pub fn detect() ?CI`

The main function of this package. If it detects that the program is running in one of the registered environments, it will return an enum value of the type `CI` with the tag in accordance with the system.

> `CI`

An enum of all the detectable CI/CD systems.

## License
MIT
