{
    shebang = {
        prefix = "sh";
        body = ["#!/usr/bin/env bash" "$1"];
    };
    if-statement = {
        prefix = "i";
        body = ["if [[ $1 ]]; then" "\t$2" "fi"];
    };
}
