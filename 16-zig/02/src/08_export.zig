// 08_export.zig — pub, export и extern решают разные задачи
// Запуск: zig run 08_export.zig -lc
// (-lc обязателен: extern abs требует libc, если его вызывать)
const std = @import("std");

// Доступ из другого Zig-файла:
pub fn square(x: i32) i32 {
    return x * x;
}

// Символ с C ABI:
export fn zig_add(a: i32, b: i32) i32 {
    return a + b;
}

// Внешняя реализация:
extern fn abs(x: c_int) c_int;

pub fn main() !void {
    std.debug.print("square(7)={d}\n", .{square(7)});
    std.debug.print("zig_add(2, 3)={d}\n", .{zig_add(2, 3)});

    // extern сам по себе не добавляет libc в команду линковки,
    // поэтому запускаем этот файл с ключом -lc:
    std.debug.print("abs(-42)={d}\n", .{abs(-42)});
}

test "pub-visible функция" {
    try std.testing.expectEqual(@as(i32, 49), square(7));
}

test "export имеет C calling convention" {
    try std.testing.expectEqual(@as(i32, 5), zig_add(2, 3));
}
