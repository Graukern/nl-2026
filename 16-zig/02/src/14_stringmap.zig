// 14_stringmap.zig — строковые ключи и время жизни: StringHashMap
// Запуск: zig test 14_stringmap.zig   /   zig run 14_stringmap.zig
const std = @import("std");

fn demo() !void {
    const a = std.heap.page_allocator;
    var scores = std.StringHashMap(u32)
        .init(a);
    defer scores.deinit();

    // Литералы живут достаточно долго:
    try scores.put("zig", 1);
    const entry = try scores.getOrPut("zig");
    if (!entry.found_existing)
        entry.value_ptr.* = 0;
    entry.value_ptr.* += 1;

    std.debug.print("zig -> {d}\n", .{scores.get("zig").?});
}

pub fn main() !void {
    try demo();
}

test "getOrPut: существующая или новая запись" {
    var scores = std.StringHashMap(u32)
        .init(std.testing.allocator);
    defer scores.deinit();

    try scores.put("zig", 1);
    const entry = try scores.getOrPut("zig");
    if (!entry.found_existing)
        entry.value_ptr.* = 0;
    entry.value_ptr.* += 1;

    try std.testing.expectEqual(
        @as(u32, 2), scores.get("zig").?);
    try std.testing.expect(scores.get("rust") == null);
    try std.testing.expectEqual(@as(u32, 1), scores.count());
}

test "сравнение содержимое строк, а не указателей" {
    const a = std.testing.allocator;
    var m = std.StringHashMap(u32).init(a);
    defer m.deinit();

    const key_in_literal: []const u8 = "zig";
    try m.put(key_in_literal, 7);
    try std.testing.expectEqual(
        @as(u32, 7), m.get("zig").?);
}
