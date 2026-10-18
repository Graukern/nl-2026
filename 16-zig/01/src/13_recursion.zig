const std = @import("std");

fn factorial(n: u32) u32 {
    if (n <= 1) {
        return 1;
    }

    return n * factorial(n - 1);
}

pub fn main() void {
    const result = factorial(5);
    std.debug.print("factorial(5) = {d}\n", .{result});
}
