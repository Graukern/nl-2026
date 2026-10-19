// 11_arrays.zig — массив хранит элементы в значении, срез представляет часть массива
// Запуск: zig run 11_arrays.zig   /   zig test 11_arrays.zig
const std = @import("std");

// Слайд 28: массив.
fn demoArray() void {
    var a = [_]i32{ 10, 20, 30 };
    a[1] = 25;

    var total: i32 = 0;
    for (a) |value| total += value;

    std.debug.print("len={d}, sum={d}\n",
        .{ a.len, total }); // 3, 65
}

// Слайд 29: срез.
fn demoSlice() void {
    var a = [_]i32{ 10, 20, 30 };
    const view: []i32 = a[1..3];
    view[0] = 99;
    // a == { 10, 99, 30 }

    const read_only: []const i32 = view;
    std.debug.print("first={d}\n",
        .{read_only[0]});
}

pub fn main() !void {
    demoArray();
    demoSlice();
}

test "размер входит в тип, [_] выводит длину" {
    var a = [_]i32{ 10, 20, 30 };
    a[1] = 25;
    try std.testing.expectEqual(@as(usize, 3), a.len);
    try std.testing.expectEqual(@as(i32, 25), a[1]);

    var total: i32 = 0;
    for (a) |value| total += value;
    try std.testing.expectEqual(@as(i32, 65), total);

    const fixed: [3]i32 = .{ 1, 2, 3 };
    try std.testing.expectEqual(@as(usize, 3), fixed.len);
}

test "срез: границы и запрет изменения через []const" {
    var a = [_]i32{ 10, 20, 30 };
    const view: []i32 = a[1..3];
    try std.testing.expectEqual(@as(usize, 2), view.len);
    view[0] = 99;
    // a == { 10, 99, 30 }
    try std.testing.expectEqual(@as(i32, 10), a[0]);
    try std.testing.expectEqual(@as(i32, 99), a[1]);
    try std.testing.expectEqual(@as(i32, 30), a[2]);

    const read_only: []const i32 = view;
    try std.testing.expectEqual(@as(i32, 99), read_only[0]);
}
