int mult(int a1, int a2)
{
    int temp = 0;
    while (a2 > 0)
    {
        temp += a1;
        --a2;
    }
    return temp;
}
