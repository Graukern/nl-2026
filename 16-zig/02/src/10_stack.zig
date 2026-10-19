// 10_stack.zig — пример: стек фиксированной емкости (обобщенная структура)
// Запуск: zig test 10_stack.zig   /   zig run 10_stack.zig
const std = @import("std");

// Слайд 24: T определяет тип элементов, capacity — размер массива.
pub fn Stack(comptime T: type,
    comptime capacity: usize) type
{
    return struct {
        const Self = @This();
        data: [capacity]T = undefined,
        len: usize = 0,

        // Методы на следующем слайде.
        pub fn push(self: *Self, value: T)
            error{Full}!void
        {
            if (self.len == capacity) return error.Full;
            self.data[self.len] = value;
            self.len += 1;
        }

        pub fn pop(self: *Self) error{Empty}!T {
            if (self.len == 0) return error.Empty;
            self.len -= 1;
            return self.data[self.len];
        }
    };
}

pub fn main() !void {
    // Слайд 26: один исходный код — разные типы.
    var ints: Stack(i32, 2) = .{};
    try ints.push(10);
    try ints.push(20);
    const top = try ints.pop(); // 20

    var flags: Stack(bool, 4) = .{};
    try flags.push(true);

    std.debug.print("top={d}, ints.len={d}\n", .{ top, ints.len });
    std.debug.print("flags.len={d}\n", .{flags.len});

    // Граница 1: переполнение (снова заполняем стек).
    try ints.push(30);
    if (ints.push(40)) |_| {
        std.debug.print("unexpected: стек не переполнился\n", .{});
    } else |err| {
        std.debug.print("push после заполнения: {s}\n", .{@errorName(err)});
    }
    while (ints.pop()) |_| {} else |err| {
        std.debug.print("pop пустого стека: {s}\n", .{@errorName(err)});
    }
}

test "порядок LIFO" {
    var s: Stack(i32, 4) = .{};
    try s.push(1);
    try s.push(2);
    try s.push(3);
    try std.testing.expectEqual(@as(i32, 3), try s.pop());
    try std.testing.expectEqual(@as(i32, 2), try s.pop());
    try std.testing.expectEqual(@as(i32, 1), try s.pop());
    try std.testing.expectEqual(@as(usize, 0), s.len);
}

test "граница: переполнение возвращает Full" {
    var s: Stack(i32, 2) = .{};
    try s.push(10);
    try s.push(20);
    try std.testing.expectError(error.Full, s.push(30));
    // Ошибочная операция оставляет стек без изменений.
    try std.testing.expectEqual(@as(usize, 2), s.len);
    try std.testing.expectEqual(@as(i32, 20), try s.pop());
}

test "граница: пустой стек возвращает Empty" {
    var s: Stack(bool, 4) = .{};
    try std.testing.expectError(error.Empty, s.pop());
    try s.push(true);
    try std.testing.expectEqual(true, try s.pop());
    try std.testing.expectError(error.Empty, s.pop());
}

test "специализации i32 и bool" {
    var ints: Stack(i32, 2) = .{};
    try ints.push(10);
    try ints.push(20);
    const top = try ints.pop(); // 20
    try std.testing.expectEqual(@as(i32, 20), top);

    var flags: Stack(bool, 4) = .{};
    try flags.push(true);
    try std.testing.expectEqual(true, try flags.pop());
}
