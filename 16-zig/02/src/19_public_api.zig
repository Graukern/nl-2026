// 19_public_api.zig — скелет: потребитель модуля mylib из §19.
// Запуск: zig build run-public   /   zig build test-all
const std = @import("std");

// Потребитель:
const lib = @import("mylib");
const IntStack = lib.Stack(i32, 8);

pub fn main() !void {
    var s: IntStack = .{};
    try s.push(42);
    std.debug.print("mylib.version={s}, top={d}\n",
        .{ lib.version, try s.pop() });
}

test "публичный интерфейс модуля mylib" {
    var s: IntStack = .{};
    try s.push(7);
    try std.testing.expectEqual(@as(i32, 7), try s.pop());
    try std.testing.expectEqualStrings("1.0.0", lib.version);
}
