const std = @import("std");

pub fn main(init: std.process.Init) !void {
    const io = init.io;

    var stdin_buffer: [256]u8 = undefined;
    var stdin_reader = std.Io.File.stdin().reader(io, &stdin_buffer);
    const stdin = &stdin_reader.interface;

    var stdout_buffer: [256]u8 = undefined;
    var stdout_writer = std.Io.File.stdout().writer(io, &stdout_buffer);
    const stdout = &stdout_writer.interface;

    try stdout.print("Enter your name: ", .{});
    try stdout.flush();

    const name = try stdin.takeDelimiter('\n') orelse return;

    try stdout.print("Hello, {s}!\n", .{name});
    try stdout.flush();
}
