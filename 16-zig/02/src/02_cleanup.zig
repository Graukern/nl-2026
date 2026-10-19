// 02_cleanup.zig — defer и errdefer освобождают ресурсы
// Запуск: zig run 02_cleanup.zig   /   zig test 02_cleanup.zig
const std = @import("std");

fn copyChecked(a: std.mem.Allocator,
    text: []const u8) ![]u8
{
    const buf = try a.dupe(u8, text);
    errdefer a.free(buf);
    if (buf.len == 0) return error.Empty;
    return buf;
}

pub fn main() !void {
    const a = std.heap.page_allocator;

    const owned = try copyChecked(a, "zig");
    defer a.free(owned);
    std.debug.print("owned={s}\n", .{owned});

    // Ожидаемый сбой: errdefer освобождает буфер,
    // вызывающий код получает ошибку.
    if (copyChecked(a, "")) |buf| {
        a.free(buf);
    } else |err| {
        std.debug.print("error={s}\n", .{@errorName(err)});
    }
}

test "успех: владение переходит вызывающему коду" {
    const a = std.testing.allocator;
    const owned = try copyChecked(a, "zig");
    defer a.free(owned);
    try std.testing.expectEqualStrings("zig", owned);
}

test "ошибка: errdefer освобождает буфер" {
    const a = std.testing.allocator;
    // std.testing.allocator сообщает об утечке, если бы
    // errdefer не сработал.
    try std.testing.expectError(error.Empty, copyChecked(a, ""));
}
