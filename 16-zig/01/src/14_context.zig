const std = @import("std");

const Counter = struct {
    value: i32,

    fn next(self: *Counter) i32 {
        self.value += 1;
        return self.value;
    }
};

pub fn main() void {
    var counter = Counter{ .value = 0 };

    std.debug.print("{d}\n", .{counter.next()});
    std.debug.print("{d}\n", .{counter.next()});
    std.debug.print("{d}\n", .{counter.next()});
}
