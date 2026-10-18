const std = @import("std");

const global_value: i32 = 100;

pub fn main() void {
    const x: i32 = 10;
    var counter: i32 = 0;

    {
        const y: i32 = 20;
        counter += 1;
        std.debug.print("inside: x={d}, y={d}\n", .{ x, y });
    }

    std.debug.print("global={d}\n", .{global_value});
    std.debug.print("x={d}, counter={d}\n", .{ x, counter });
}
