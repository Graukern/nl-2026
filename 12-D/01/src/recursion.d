import std.stdio;

ulong factorial(uint n)
{
    if (n <= 1) return 1;
    return n * factorial(n - 1);
}

void main()
{
    writeln("5! = ", factorial(5));
}
