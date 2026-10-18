const std = @import("std");

pub fn main() void {
    const result = blk: {
        const a = 10;
        const b = 20;

        break :blk a + b;
    };

    std.debug.print("result = {d}\n", .{result});
}
