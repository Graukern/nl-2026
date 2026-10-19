// deps/math_pkg/build.zig — вложенный пакет публикует модуль "math"
const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    _ = b.addModule("math", .{
        .root_source_file = b.path("math.zig"),
        .target = target,
        .optimize = optimize,
    });
}
