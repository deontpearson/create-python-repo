#!/usr/bin/env bash
echo -e "Installing pre-commit"
pip install "pre-commit >= 2.2.0, < 2.3" -q
echo -e "Done"
echo -e "Starting pre-commit checks"

# For PR-Merge Job
declare branch=$CHANGE_BRANCH;

# For Branch Job
if [ -z "$branch" ]
then
    declare branch=$BRANCH_NAME;
fi

# For Local
if [ -z "$branch" ]
then
    declare branch="HEAD";
fi

if [[ "$branch" == "master" ]]
then
    echo -e "nSkipping: In master branch"
    exit 0
fi

echo -e "Running for branch: $branch"
pre-commit run --from-ref origin/master --to-ref $branch -v
passed=$?

if [ $passed -eq 0 ]
then
    echo -e "\nSuccess: All pre-commit checks passed"
else
    echo -e "\nFailure: Some pre-commit checks failed"
    echo -e "\n======================================\n"
    echo -e "NOTE: Please ensure that you have pre-commit installed on your local machine\n\n"
fi

exit $passed
