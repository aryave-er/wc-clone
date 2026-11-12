# wc-clone

C clone of `wc` that counts lines, words and bytes from files or stdin.

## Build

```
make
```

Needs a C compiler (`gcc` or `clang`) and `make`.

## Usage

```
./mywc file.txt
cat file.txt | ./mywc
```

Output format: lines, words, bytes, then the filename if one was given.


## Tests

```
make test
```

The test script runs both `./mywc` and the system `wc` on each file in `tests/` and compares the output, for both file arguments and stdin.