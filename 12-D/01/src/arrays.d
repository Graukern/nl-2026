import std.stdio;

void main()
{
    int[] scores = [5, 4, 3];
    scores ~= 5;

    writeln("Grades: ", scores);
    writeln("Count: ", scores.length);
    writeln("First: ", scores[0]);
}
