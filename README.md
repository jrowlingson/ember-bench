# ember-bench

A simple tool for benchmarking various ember-cli commands.

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

```
======================
 ember bench (0.0.1)
======================
ember-cli: 3.20.0
node: 12.18.3
os: linux x64
cpu: Intel(R) Core(TM) i7-9700K CPU @ 3.60GHz
cpu cores: 8
cpu threads: 8
mem: 16313584kB

1.a: ember --version (n=5)

	real	user	sys
	⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻
	1.26	1.48	0.13
	1.27	1.45	0.16
	1.26	1.48	0.09
	1.27	1.45	0.15
	1.26	1.44	0.15
	⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻
	1.26	1.46	.13

2.a: ember b (n=3, before_each: rm -rf node_modules dist && yarn)

	real	user	sys
	⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻
	3.49	4.21	0.33
	3.48	4.17	0.40
	3.45	3.98	0.38
	⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻
	3.47	4.12	.37

2.b: ember b (n=5, before_all: ember b)

	real	user	sys
	⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻
	3.48	4.20	0.34
	3.45	4.15	0.38
	3.45	4.08	0.44
	3.49	4.13	0.43
	3.43	4.18	0.36
	⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻
	3.46	4.14	.39
```

### Options

* Version info
`--version` or `-v`
