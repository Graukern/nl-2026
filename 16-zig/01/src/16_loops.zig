const std = @import("std");

pub fn main() void {
    var i: u8 = 0;

    while (i < 3) : (i += 1) {
        std.debug.print("while: {d}\n", .{i});
    }

    const numbers = [_]i32{ 10, 20, 30 };

    for (numbers, 0..) |number, index| {
        std.debug.print("for: [{d}] = {d}\n", .{ index, number });
    }
}
