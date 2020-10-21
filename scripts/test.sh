#!/usr/bin/env bash

# Install test requirements
echo -e "Installing Test Dependencies"
pip install -r tests/requirements.txt -q
echo -e "Done"
echo -e "Starting Tests"

pytest tests/                   \
--cov-config .coveragerc        \
--cov=ads_bff                   \
--cov-report html               \
--cov-report term               \
--cov-report xml                \
--no-cov-on-fail                \
--cov-fail-under=98             \
$@

passed=$?

if [ $passed -eq 0 ]
then
    echo -e "\nTo view the HTML coverage report: open htmlcov/index.html\n"
fi


exit $passed
