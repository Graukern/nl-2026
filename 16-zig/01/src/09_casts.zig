const std = @import("std");

pub fn main() void {
    const small: u8 = 42;
    const wide: u32 = small;

    const signed_value: i32 = 100;
    const narrow: u8 = @intCast(signed_value);

    const integer: i32 = 25;
    const real: f64 = @floatFromInt(integer);

    const pi: f64 = 3.99;
    const truncated: i32 = @intFromFloat(pi);

    std.debug.print("wide = {d}\n", .{wide});
    std.debug.print("narrow = {d}\n", .{narrow});
    std.debug.print("real = {d:.1}\n", .{real});
    std.debug.print("truncated = {d}\n", .{truncated});
}
