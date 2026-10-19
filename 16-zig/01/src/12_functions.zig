const std = @import("std");

fn add(a: i32, b: i32) i32 {
    return a + b;
}

fn greet(name: []const u8) void {
    std.debug.print("Hello, {s}!\n", .{name});
}

pub fn main() void {
    const result = add(5, 7);

    std.debug.print("result = {d}\n", .{result});
    greet("Zig");
}
