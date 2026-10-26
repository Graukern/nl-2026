import std.stdio;

double average(const int[] scores)
{
    int total = 0;
    foreach (score; scores)
        total += score;
    return cast(double) total / scores.length;
}

void main()
{
    writeln(average([5, 4, 3, 5]));
}
