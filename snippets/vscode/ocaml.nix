{
    let-lwt = {
        prefix = "letlwt";
        body = "let%lwt";
    };
    try-lwt = {
        prefix = "trylwt";
        body = [
            "try%lwt"
            "\t$1"
            "with _ -> ()"
        ];
    };
    comment = {
        prefix = "co";
        body = "(* $1 *)";
    };
    print = {
        prefix = "pr";
        body = "Printf.printf \"$1\\n\"$2;";
    };
    print-error = {
        prefix = "epr";
        body = "Printf.eprintf \"$1\\n\"$2;";
    };
    flush-std = {
        prefix = "fl";
        body = "Stdlib.flush stdout;";
    };
    then-else = {
        prefix = "then";
        body = [
            "then"
            "\t$1"
            "else"
        ];
    };
    match-with = {
        prefix = "with";
        body = [
            "with"
            "\t| $1"
        ];
        description = "with _ -> ...";
    };
    array = {
        prefix = "[|";
        body = "[| $1 |]";
    };
    lambda-function = {
        prefix = "fun";
        body = "(fun $1 -> $2)";
    };
    match-function = {
        prefix = "func";
        body = [
            "function"
            "| Ok _ -> ()"
            "| Error _ -> ()"
        ];
    };
}
