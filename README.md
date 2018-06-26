# mktemp.bash

![Build status](https://gitlab.com/le-garff-yoann/mktemp.bash/badges/master/build.svg)

C's `stdlib::mktemp` like written in pure Bourne again shell.

## Specification

It try to follow the `stdlib::mktemp` specification available [here](https://linux.die.net/man/3/mktemp) as much as possible plus creating the temporary file.

## Install me

```bash
bpkg install le-garff-yoann/mktemp.bash
```

## Use me

```bash
. mktemp.bash

bmktemp /tmp/tmp.XXXXXX # create and print /tmp/tmp.g20Jxn to &1
```

## Test me

```
bpkg install lehmannro/assert.sh

bash test.sh
```
