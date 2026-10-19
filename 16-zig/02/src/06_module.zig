// 06_module.zig — именованный импорт модуля
// Имя mathlib связывает build.zig с корневым файлом modules/math.zig.
// Запуск: zig build run-module
const std = @import("std");

const math = @import("mathlib");

pub fn main() !void {
    std.debug.print("mathlib.square(7)={d}\n", .{math.square(7)});
    std.debug.print("mathlib.square(12)={d}\n", .{math.square(12)});
}

test "именованный импорт" {
    try std.testing.expectEqual(@as(i32, 49), math.square(7));
}
