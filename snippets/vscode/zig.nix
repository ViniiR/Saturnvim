{
    zig-format = {
        prefix = "zfmt";
        body = "// zig fmt: $1";
    };
    print-any = {
        prefix = "pr";
        body = "std.debug.print(\"{any}\\n\", .{$1});";
    };
    string = {
        prefix = "cu";
        body = "[]const u8";
    };
}
