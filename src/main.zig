const std = @import("std");
const detect = @import("ci-detect").detect;

pub fn main() !void {
    const w = std.io.getStdOut().writer();
    try w.print("{}\n", .{detect()});
}
