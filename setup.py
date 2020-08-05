from setuptools import find_packages, setup

with open("version") as fp:
    version = fp.read().strip()

with open("requirements.txt") as fd:
    requirements = [dependency.strip() for dependency in fd]

with open("README.md") as f:
    README = f.read()

dev_require = ["pre-commit >= 2.2.0, < 2.3", "flake8", "mypy", "black"]

setup(
    name="{{project}}",
    version=version,
    author="{{author}}",
    author_email="{{email}}",
    packages=find_packages(
        where=".", exclude=["*.tests", "*.tests.*", "tests.*", "tests"]
    ),
    package_data={},
    scripts=[],
    description="{{description}}",
    long_description=README,
    long_description_content_type="text/markdown",
    include_package_data=True,
    install_requires=requirements,
    extras_require={"dev": dev_require},
    classifiers=[
        "Intended Audience :: Takealot Developers",
        "Natural Language :: English",
        "Programming Language :: Python :: 3.8",
    ],
    entry_points={"console_scripts": []},
)
