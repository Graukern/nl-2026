// 16_wordcount.zig — общий пример: частоты слов (все четыре блока лекции)
// Запуск: zig run 16_wordcount.zig   /   zig test 16_wordcount.zig
const std = @import("std");

pub fn main() !void {
    // Скелет: в конспекте переменная a уже объявлена выше.
    const a = std.heap.page_allocator;

    var counts = std.StringHashMap(u32).init(a);
    defer counts.deinit();

    const words = [_][]const u8{
        "zig", "code", "zig",
    };
    for (words) |word| {
        const e = try counts.getOrPut(word);
        if (!e.found_existing) e.value_ptr.* = 0;
        e.value_ptr.* += 1;
    }
    // counts.get("zig").? == 2

    // Выводим выбранные ключи явно, чтобы результат
    // не зависел от порядка итерации хеш-таблицы.
    std.debug.print("zig={d}, code={d}\n",
        .{ counts.get("zig").?, counts.get("code").? });
}

test "частоты слов" {
    const a = std.testing.allocator;

    var counts = std.StringHashMap(u32).init(a);
    defer counts.deinit();

    const words = [_][]const u8{
        "zig", "code", "zig",
    };
    for (words) |word| {
        const e = try counts.getOrPut(word);
        if (!e.found_existing) e.value_ptr.* = 0;
        e.value_ptr.* += 1;
    }
    // counts.get("zig").? == 2
    try std.testing.expectEqual(
        @as(u32, 2), counts.get("zig").?);
    try std.testing.expectEqual(
        @as(u32, 1), counts.get("code").?);
    try std.testing.expectEqual(@as(u32, 2), counts.count());
}
