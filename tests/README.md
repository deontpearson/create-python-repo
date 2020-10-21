# Unit Tests - WIP

## Running unit rests

The unit tests are automatically run as part of the Jenkins CI Pipeline. However, if you wish to run them yourself, then follow the guide below

### Step 1: Install requirements

```bash
pip install -e .[test]
```

### Step 2: Run the tests

Use any of the following options to run the tests

#### Step 2a: Run all of the tests

```bash
./scripts/test.sh
```

This will include a coverage report. If you wish to view an in depth code coverage report (which shows each line of code and its coverage state) then open the generated HTML report using

```bash
open coverage_html_report/index.html
```

#### Step 2b: Run a test file / folder

```bash
pytest tests/{path-to-the-folder-or-file}
```

#### Step 2c: Run a specific test category (marker)

```bash
pytest -m {marker}
```

You can look at the **markers** section in the [setup.cfg](../setup.cfg) file for a list of the possible markers
