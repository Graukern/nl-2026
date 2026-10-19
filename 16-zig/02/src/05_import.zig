// 05_import.zig — @import("math.zig") возвращает тип контейнера файла
// Запуск: zig run 05_import.zig   /   zig test 05_import.zig
const std = @import("std");

// 05_import.zig
const math = @import("modules/math.zig");
const square = math.square;
const result = square(7);

pub fn main() !void {
    std.debug.print("square(7)={d}\n", .{result});
}

test "импорт файла как пространства имен" {
    try std.testing.expectEqual(@as(i32, 49), square(7));
    try std.testing.expectEqual(@as(i32, 0), math.square(0));
    // Псевдоним не меняет видимость исходного объявления:
    try std.testing.expect(@hasDecl(math, "square"));
}
