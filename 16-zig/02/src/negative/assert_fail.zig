// negative/assert_fail.zig — намеренный сбой, НЕ входит в общий прогон
const std = @import("std");

// Скелет: точка входа и переменная items из контекста слайда.
pub fn main() void {
    const items = [_]u8{ 10, 20, 30 };
    std.debug.print("len={d}\n", .{items.len});

    // Только отдельная демонстрация:
    std.debug.assert(false);

    // Запуск:
    // zig run negative/assert_fail.zig

    std.debug.print("after assert (недостижимо)\n", .{});
}
