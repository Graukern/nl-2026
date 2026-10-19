// 09_generics.zig — обобщения: comptime-параметры и инстанцирование
// Запуск: zig run 09_generics.zig   /   zig test 09_generics.zig
// Ограничения comptime (§23) вынесены в negative/generic_fail.zig
const std = @import("std");

// Слайд 20: тип как параметр времени компиляции.
fn Box(comptime T: type) type {
    return struct {
        value: T,
    };
}

// Слайд 21: параметром может быть и число, известное при компиляции.
fn Buffer(comptime T: type,
    comptime capacity: usize) type
{
    return struct {
        data: [capacity]T,
    };
}

// Слайд 22: явный параметр T и вывод типа через anytype.
fn max(comptime T: type, a: T, b: T) T {
    return if (a > b) a else b;
}

fn identity(value: anytype) @TypeOf(value) {
    return value;
}

pub fn main() !void {
    // Слайд 21: инстанцирование и создание значения.
    const IntBox = Box(i32);
    const x = IntBox{ .value = 42 };
    const y = Box(bool){ .value = true };

    const Small = Buffer(u8, 16);
    const Large = Buffer(u8, 64);
    const small = Small{ .data = undefined };
    const large = Large{ .data = undefined };

    // Слайд 22: обобщенная функция.
    const n = max(i32, 7, 12);
    const ok = identity(true);

    std.debug.print("x={d}, y={}\n", .{ x.value, y.value });
    std.debug.print("sizeOf(Small)={d}, sizeOf(Large)={d}\n",
        .{ @sizeOf(Small), @sizeOf(Large) });
    std.debug.print("max(i32, 7, 12)={d}, identity(true)={}\n",
        .{ n, ok });
    _ = small;
    _ = large;
}

test "Box: обобщенный тип и значение этого типа" {
    const IntBox = Box(i32);
    const x = IntBox{ .value = 42 };
    const y = Box(bool){ .value = true };
    try std.testing.expectEqual(@as(i32, 42), x.value);
    try std.testing.expectEqual(true, y.value);
    // Типы специализаций различаются: i32 и bool — разные структуры.
    try std.testing.expect(@TypeOf(x) != @TypeOf(y));
}

test "Buffer: capacity меняет тип массива" {
    const Small = Buffer(u8, 16);
    const Large = Buffer(u8, 64);
    try std.testing.expectEqual(@as(usize, 16), @sizeOf(Small));
    try std.testing.expectEqual(@as(usize, 64), @sizeOf(Large));
    try std.testing.expect(Small != Large);
}

test "обобщенная функция и anytype" {
    try std.testing.expectEqual(@as(i32, 12), max(i32, 7, 12));
    try std.testing.expectEqual(@as(u8, 3), max(u8, 1, 3));
    try std.testing.expectEqual(true, identity(true));
    try std.testing.expectEqual(@as(i32, -5), identity(@as(i32, -5)));
}
