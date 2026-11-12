#!/bin/bash
set -u

fail=0

for f in tests/*.txt; do
    # file argument: compare output, filename included
    mine=$(LC_ALL=C ./mywc "$f")
    real=$(LC_ALL=C wc "$f")
    if [ "$mine" != "$real" ]; then
        echo "FAIL (file)  $f"
        fail=1
    else
        echo "ok   (file)  $f"
    fi

    # stdin: no filename in either output
    mine=$(LC_ALL=C ./mywc < "$f")
    real=$(LC_ALL=C wc < "$f")
    if [ "$mine" != "$real" ]; then
        echo "FAIL (stdin) $f"
        fail=1
    else
        echo "ok   (stdin) $f"
    fi
done

exit $fail