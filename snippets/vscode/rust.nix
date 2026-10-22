{
    debug-macro = {
        prefix = "db";
        body = "dbg!($1);";
    };
    todo-macro = {
        prefix = "td";
        body = "todo!($1);";
    };
    async-fn = {
        prefix = "asf";
        body = [
            "async fn $1($2)$3 {"
            "\t$4"
            "}"
        ];
    };
    template-string = {
        prefix = "ts";
        body = "\"{}\"";
    };
    lambda = {
        prefix = "la";
        body = [
            "|$1| {"
            "\t$2"
            "}"
        ];
    };
    ok-err = {
        prefix = "okerr";
        body = [
            "Ok($1) => {$2},"
            "Err($3) => {$4},"
        ];
    };
}
