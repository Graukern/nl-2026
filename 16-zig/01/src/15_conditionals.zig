const std = @import("std");

pub fn main() void {
    const score: u8 = 84;

    if (score >= 60) {
        std.debug.print("Passed\n", .{});
    } else {
        std.debug.print("Failed\n", .{});
    }

    const level: u8 = 2;

    switch (level) {
        1 => std.debug.print("beginner\n", .{}),
        2 => std.debug.print("intermediate\n", .{}),
        3 => std.debug.print("advanced\n", .{}),
        else => std.debug.print("unknown\n", .{}),
    }
}
