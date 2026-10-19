// 01_errors.zig — error set, error union, try, catch, if по error union
// Запуск: zig test 01_errors.zig   /   zig run 01_errors.zig
const std = @import("std");

// Слайд 4: error set перечисляет допустимые ошибки,
// E!T содержит либо значение типа T, либо ошибку из E.
const ParseError = error{
    Empty,
    InvalidDigit,
};

fn digit(text: []const u8) ParseError!u8 {
    if (text.len == 0) return error.Empty;
    if (text.len != 1 or
        text[0] < '0' or text[0] > '9')
        return error.InvalidDigit;
    return text[0] - '0';
}

// Слайд 5: try передает ошибку вызывающей функции.
fn twice(text: []const u8) ParseError!u16 {
    const n = try digit(text);
    return @as(u16, n) * 2;
}

// Слайд 7: !T позволяет компилятору вывести множество ошибок.
fn readDigit(s: []const u8) !u8 {
    return digit(s);
}

// Скелет: фрагменты §6 и §7 вынесены в отдельные функции,
// потому что в Zig нельзя объявлять два const n в одной области видимости.
fn recoveryDemo() void {
    const n = digit("") catch 0;

    const value = digit("x") catch |err| blk: {
        break :blk switch (err) {
            error.Empty => @as(u8, 0),
            error.InvalidDigit => @as(u8, 9),
        };
    };

    std.debug.print("n={d}, value={d}\n", .{ n, value });
}

fn branchDemo() void {
    if (digit("7")) |n| {
        std.debug.print("digit={d}\n", .{n});
    } else |err| {
        std.debug.print("error={s}\n",
            .{@errorName(err)});
    }
}

pub fn main() !void {
    // Слайд 5: эквивалентная обработка (скелетная переменная text).
    const text = "7";
    // Эквивалентная обработка:
    const n = digit(text) catch |err| {
        return err;
    };
    std.debug.print("catch: n={d}\n", .{n});

    // Слайд 6: catch восстанавливает выполнение.
    recoveryDemo();

    // Слайд 7: ветвление по error union.
    branchDemo();

    std.debug.print("twice(\"7\")={d}\n", .{try twice("7")});
    std.debug.print("readDigit(\"5\")={d}\n", .{try readDigit("5")});
}

test "digit: положительная и обе отрицательные ветви" {
    try std.testing.expectEqual(@as(u8, 7), try digit("7"));
    try std.testing.expectError(error.Empty, digit(""));
    try std.testing.expectError(error.InvalidDigit, digit("x"));
    try std.testing.expectError(error.InvalidDigit, digit("12"));
}

test "try передает ошибку вызывающей функции" {
    try std.testing.expectEqual(@as(u16, 14), try twice("7"));
    try std.testing.expectError(error.Empty, twice(""));
}

test "catch: эквивалентная обработка (§5)" {
    const text = "7";
    // Эквивалентная обработка:
    const n = digit(text) catch |err| {
        return err;
    };
    try std.testing.expectEqual(@as(u8, 7), n);
    try std.testing.expectError(error.Empty, twice(""));
}

test "catch: восстановление (§6)" {
    const n = digit("") catch 0;
    try std.testing.expectEqual(@as(u8, 0), n);

    const value = digit("x") catch |err| blk: {
        break :blk switch (err) {
            error.Empty => @as(u8, 0),
            error.InvalidDigit => @as(u8, 9),
        };
    };
    try std.testing.expectEqual(@as(u8, 9), value);
}

test "ветвление по error union (§7)" {
    if (digit("7")) |n| {
        try std.testing.expectEqual(@as(u8, 7), n);
    } else |_| {
        try std.testing.expect(false);
    }

    if (digit("")) |_| {
        try std.testing.expect(false);
    } else |err| {
        try std.testing.expectEqualStrings("Empty", @errorName(err));
    }

    try std.testing.expectEqual(@as(u8, 3), try readDigit("3"));
}
