import std.stdio;

double average(const int[] grades)
{
    assert(grades.length > 0, "empty list");
    int total = 0;
    foreach (grade; grades)
        total += grade;
    return cast(double) total / grades.length;
}

int maximum(const int[] grades)
{
    assert(grades.length > 0, "empty list");
    int best = grades[0];
    foreach (grade; grades)
        if (grade > best) best = grade;
    return best;
}

void main()
{
    int[] grades = [5, 4, 3, 5, 4];
    double avg = average(grades);
    writeln("Grades: ", grades);
    writeln("Average grade: ", avg);
    writeln("Maximum: ", maximum(grades));
    writeln(avg >= 4.5 ? "High result" : "could be better");
}
