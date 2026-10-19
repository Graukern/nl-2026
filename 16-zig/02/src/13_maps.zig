// 13_maps.zig — карта с числовыми ключами: AutoHashMap
// Запуск: zig test 13_maps.zig   /   zig run 13_maps.zig
const std = @import("std");

fn demo() !void {
    const a = std.heap.page_allocator;
    var ages = std.AutoHashMap(u32, u8)
        .init(a);
    defer ages.deinit();

    try ages.put(101, 20);
    try ages.put(101, 21);

    std.debug.print("101 -> {d}\n", .{ages.get(101).?});
    std.debug.print("contains(999)={}\n", .{ages.get(999) != null});

    var it = ages.iterator();
    while (it.next()) |entry| {
        std.debug.print("{d}: {d}\n",
            .{ entry.key_ptr.*, entry.value_ptr.* });
    }
}

pub fn main() !void {
    try demo();
}

test "put заменяет значение, get возвращает ?V" {
    var ages = std.AutoHashMap(u32, u8)
        .init(std.testing.allocator);
    defer ages.deinit();

    try ages.put(101, 20);
    try ages.put(101, 21);

    try std.testing.expectEqual(
        @as(u8, 21), ages.get(101).?);
    try std.testing.expect(ages.get(999) == null);
    try std.testing.expect(ages.contains(101));
    try std.testing.expect(!ages.contains(999));
    try std.testing.expectEqual(@as(u32, 1), ages.count());
}

test "обход не задает сортировку" {
    const a = std.testing.allocator;
    var m = std.AutoHashMap(u32, u8).init(a);
    defer m.deinit();

    try m.put(1, 10);
    try m.put(2, 20);
    try std.testing.expectEqual(@as(u32, 2), m.count());

    _ = m.remove(2);
    try std.testing.expectEqual(@as(u32, 1), m.count());
}
