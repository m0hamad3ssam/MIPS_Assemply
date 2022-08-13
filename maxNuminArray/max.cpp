// midterm2016Q2_2
int max(int *array, int size)
{
    int maximum = array[0];
    for (int i = 1; i < size; i++)
        if (array[i] > maximum)
            maximum = array[i];
    return maximum;
}
