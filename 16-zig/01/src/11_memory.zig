const std = @import("std");

pub fn main() !void {
    const allocator = std.heap.page_allocator;

    const memory = try allocator.alloc(u8, 10);
    defer allocator.free(memory);

    @memset(memory, 0);

    memory[0] = 42;
    memory[1] = 7;

    std.debug.print("len = {d}\n", .{memory.len});
    std.debug.print("values = {d}, {d}\n", .{ memory[0], memory[1] });
}
