void selectionsort(int x[], int n)
{
    for (int i = 0; i < n; i++)
    {
        int ind = min(x, n, i);
        swap(x, ind, i);
    }
}

void swap(int x[], int i, int j)
{
    int temp = x[i];
    x[i] = x[j];
    x[j] = temp;
}

int min(int x[], int n, int start)
{
    int ind = start;
    int mini = x[start];
    for (int i = start; i < n; i++)
    {
        if (x[i] < mini)
        {
            mini = x[i];
            ind = i;
        }
    }
    return ind;
}

int main()
{
    int n = 6;
    int x[] = {3, 6, 2, 9, 8, 10};
    selectionsort(x, n);
}
