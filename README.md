# ember-bench

A simple tool for benchmarking various ember-cli commands.

## Prerequisites

You will need the following things properly installed on your computer.

* [Git](https://git-scm.com/)
* [Yarn](https://classic.yarnpkg.com/en/) (optional if using npm)
* [Node.js](https://nodejs.org/) (with npm)
* [Ember CLI](https://ember-cli.com/)

### Installation

```sh
/bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/jrowlingson/ember-bench/master/install.sh)"
```

### Usage

```sh
cd /your/project/root
ember-bench
```

#### Sample Output

The following is the result of running:

```zsh
% ember new test-bench && cd test-bench && yarn
% ember-bench
```

```sh
======================
 ember bench (0.0.1)
======================

git repo: test-bench
git branch: master
git commit: d15dc15
ember-cli: 3.20.0
node: 12.18.3
os: linux x64
cpu: Intel(R) Core(TM) i7-9700K CPU @ 3.60GHz
cpu cores: 8
cpu threads: 8
mem: 16313584kB

1.a: ember --version (n=5)

        real    user    sys
        ⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻
        1.34    1.54    0.12
        1.29    1.52    0.11
        1.28    1.48    0.13
        1.30    1.56    0.09
        1.29    1.49    0.14
        ⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻
        1.30    1.51    .11

2.a: ember b (n=3, before_each: rm -rf node_modules dist && yarn)

        real    user    sys
        ⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻
        6.33    13.97   0.99
        3.58    4.20    0.33
        3.55    4.24    0.41
        ⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻
        4.48    7.47    .57

2.b: ember b (n=5, before_all: ember b)

        real    user    sys
        ⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻
        3.55    4.18    0.42
        3.54    4.24    0.37
        3.51    4.21    0.36
        3.53    4.06    0.39
        3.54    4.14    0.35
        ⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻
        3.53    4.16    .37
```

### Options

* `--help|-h`: print usage info
* `--version|-v`: version info
* `--npm|-n`: use `npm` (default `yarn`)

### Notes

This tool currently assumes the usage of `yarn`. You may specify the `--npm` option to use `npm` instead.

Supports Linux and macOS (a PR for Windows support would be welcome!).
