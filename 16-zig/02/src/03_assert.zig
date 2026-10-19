// 03_assert.zig — assert фиксирует инвариант
// Запуск: zig test 03_assert.zig   /   zig run 03_assert.zig
// Намеренно ложный assert вынесен в negative/assert_fail.zig
const std = @import("std");

fn average(sum: u32, count: u32) u32 {
    std.debug.assert(count > 0);
    return sum / count;
}

test "average" {
    try std.testing.expectEqual(
        @as(u32, 5), average(10, 2));
    try std.testing.expectEqual(
        @as(u32, 0), average(0, 1));
}

pub fn main() !void {
    std.debug.print("average(10, 2)={d}\n", .{average(10, 2)});
    std.debug.print("average(9, 3)={d}\n", .{average(9, 3)});

    // Намеренный сбой показываем отдельно:
    // zig run negative/assert_fail.zig
}
