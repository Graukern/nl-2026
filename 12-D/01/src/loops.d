import std.stdio;

void main()
{
    int[] scores = [5, 4, 3, 5];
    int total = 0;

    foreach (score; scores)
        total += score;

    writeln("Sum: ", total);
    for (int i = 0; i < 3; ++i)
        writeln("Step ", i);
}
