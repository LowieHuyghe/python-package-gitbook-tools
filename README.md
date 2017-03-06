
# Python Package GitBook Tools

Easy tools for using GitBook for Python Packages.
Especially comes in handy when using CI.


## Installation

1. `cd` into your project directory
2. Add the project as a submodule:

 ```bash
git submodule add git@github.com:LowieHuyghe/python-package-gitbook-tools.git bin/gitbook
```


## Usage

### Install
Install the GitBook's command line interface on your system when necessary:
```bash
./bin/gitbook/install.sh
```
> Note: This is will come in handy when publishing the book using CI for example.

### Serve
Preview and serve your book using:
```bash
./bin/gitbook/serve.sh
```

### Build
Build the static website using:
```bash
./bin/gitbook/build.sh
```

### Publish
Publish the book to the given repository and branch:
```bash
./bin/gitbook/publish.sh git@github.com:LowieHuyghe/python-package-gitbook-tools.git gh-pages
```
