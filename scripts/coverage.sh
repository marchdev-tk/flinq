pub global activate coverage

dart --disable-service-auth-codes --enable-vm-service=8111 --pause-isolates-on-exit ../test/flinq_test.dart &
nohup pub global run coverage:collect_coverage --port=8111 --out=coverage.json --wait-paused --resume-isolates

pub global run coverage:format_coverage --lcov --in=coverage.json --out=lcov.info --packages=.packages --report-on=lib

bash <(curl -s https://codecov.io/bash)
