const std = @import("std");

pub fn main() void {
    const a: i32 = 10;
    const b: i32 = 3;

    std.debug.print("a + b = {d}\n", .{a + b});
    std.debug.print("a - b = {d}\n", .{a - b});
    std.debug.print("a * b = {d}\n", .{a * b});
    std.debug.print("a > b = {}\n", .{a > b});
    std.debug.print("a == b = {}\n", .{a == b});

    const ready = true;
    const allowed = false;
    std.debug.print("ready and allowed = {}\n", .{ready and allowed});
}
