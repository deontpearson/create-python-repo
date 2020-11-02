[![python](https://img.shields.io/badge/python-3.7-informational)](https://docs.python.org/3/)
[![pip-tools](https://img.shields.io/badge/pip--tools-enabled-informational)](https://github.com/jazzband/pip-tools)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen)](https://github.com/pre-commit/pre-commit)
[![black](https://img.shields.io/badge/code%20style-black-000000.svg)](https://github.com/psf/black)
[![pytest](https://img.shields.io/badge/pytest-disabled-red)](https://docs.pytest.org/en/latest/)

# {{repo}}

- charts - Helm charts
- [kubernetes](./kubernetes/README.md) - Adhoc kubernetes YAML files
- metadata - Files used during the repo creation process.
- scripts - Scripts for repo admin
- [{{project}}](./{{project}}/README.md) - All the python code
- [tests](./tests/README.md) - All the integration test code

## Getting Started
Getting started on development in this repo

### Setup your virtual environment
You will have 2 choices here depending on whether you use pyenv-virtualenv or virtualenv

- Using pyenv-virtualenv:

```bash
pyenv virtualenv 3.7.9 $(basename "$PWD")
echo $(basename "$PWD") >| .python-version
```

- Using virtualenv:
```bash
virtualenv -p python3 venv
source venv/bin/activate
```

### Install dependencies
```bash
pip install pip-tools # this repo uses pip-tools
make install # updates syncs the requirements.in with requirements.txt
pre-commit install # installs pre-commit into the virtual env
```

> **Note:** If you have already set up the environment, and just want to update your dependencies:
> ```bash
> make init
> ```

>**Note:** If you want to run the pre-commits without committing to a branch:
> ```bash
> pre-commit run
> ```

### Updating requirements
> **Warning:** You should not be editting the .txt files directly

In order to change requirements you must edit the corresponding .in file (e.g: requirements.in) and then run the following command.

```bash
make update # generate the .txt files
make deps # ensure the dependencies are installed
```
