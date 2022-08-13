void bubbleSort(int x[], int n)
{
    for (int i = 0; i < n - 1; i++)
    {
        for (int j = 0; j < n - i - 1; j++)
        {
            if (x[j] > x[j + 1])
                swap(x, j, j + 1);
        }
    }
}

void swap(int x[], int i, int j)
{
    int temp = x[i];
    x[i] = x[j];
    x[j] = temp;
}
int main()
{
    int n = 6;
    int x[] = {3, 6, 2, 9, 8, 10};
    bubbleSort(x,n);
}
