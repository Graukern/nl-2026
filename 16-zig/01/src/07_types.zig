const std = @import("std");

pub fn main() void {
    const age: u8 = 20;
    const temperature: f64 = 23.5;
    const active: bool = true;

    const numbers = [_]i32{ 10, 20, 30 };
    const slice: []const i32 = numbers[0..2];

    const nickname: ?[]const u8 = "Zig";

    std.debug.print("age = {d}\n", .{age});
    std.debug.print("temperature = {d:.1}\n", .{temperature});
    std.debug.print("active = {}\n", .{active});
    std.debug.print("array = {any}\n", .{numbers});
    std.debug.print("slice = {any}\n", .{slice});
    std.debug.print("optional = {s}\n", .{nickname.?});
}
