const std = @import("std");

pub fn main(init: std.process.Init) !void {
    const io = init.io;
    const cwd = std.Io.Dir.cwd();

    {
        const file = try cwd.createFile(io, "example.txt", .{
            .truncate = true,
        });
        defer file.close(io);

        try file.writeStreamingAll(io, "Hello, Zig!");
    }

    {
        const file = try cwd.openFile(io, "example.txt", .{});
        defer file.close(io);

        var buffer: [64]u8 = undefined;
        const bytes_read = try file.readPositionalAll(io, &buffer, 0);

        std.debug.print(
            "File content: {s}\n",
            .{buffer[0..bytes_read]},
        );
    }
}
