// 12_arraylist.zig — ArrayList увеличивает емкость, владение и указатели
// Запуск: zig test 12_arraylist.zig   /   zig run 12_arraylist.zig
const std = @import("std");

// Слайд 30: items содержит текущие элементы, capacity — размер хранилища.
fn demo() !void {
    const a = std.heap.page_allocator;
    var list: std.ArrayList(i32) = .empty;
    defer list.deinit(a);

    try list.append(a, 10);
    try list.append(a, 20);
    try list.appendSlice(a, &.{ 30, 40 });

    std.debug.print("len={d}\n", .{list.items.len});
    for (list.items) |item| std.debug.print("{d} ", .{item});
    std.debug.print("\n", .{});
}

pub fn main() !void {
    try demo();
}

test "ArrayList: append и appendSlice" {
    const a = std.testing.allocator;
    var list: std.ArrayList(i32) = .empty;
    defer list.deinit(a);

    try list.append(a, 10);
    try list.append(a, 20);
    try list.appendSlice(a, &.{ 30, 40 });

    try std.testing.expectEqual(
        @as(usize, 4), list.items.len);
    try std.testing.expectEqual(@as(i32, 10), list.items[0]);
    try std.testing.expectEqual(@as(i32, 40), list.items[3]);
}

test "ensureTotalCapacity и действительность указателей" {
    const a = std.testing.allocator;
    var list: std.ArrayList(i32) = .empty;
    defer list.deinit(a);

    try list.ensureTotalCapacity(a, 16);
    try list.append(a, 10);

    // После получения указателя:
    const ptr = &list.items[0];
    _ = ptr;
    // Рост, перемещение или удаление элемента
    // требуют заново получить нужный указатель.
    try list.append(a, 20);
    try std.testing.expectEqual(@as(i32, 20), list.items[1]);
}
