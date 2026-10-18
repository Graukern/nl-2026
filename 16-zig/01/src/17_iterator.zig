const std = @import("std");

const Counter = struct {
    current: usize,
    end: usize,

    fn next(self: *Counter) ?usize {
        if (self.current >= self.end) {
            return null;
        }

        const value = self.current;
        self.current += 1;
        return value;
    }
};

pub fn main() void {
    var counter = Counter{
        .current = 0,
        .end = 4,
    };

    while (counter.next()) |value| {
        std.debug.print("{d}\n", .{value});
    }
}
