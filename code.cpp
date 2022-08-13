#include <iostream>
#include <string>
using namespace std;

void strcpy(char x[], char y[])
{
    int i = 0;
    while ((x[i] = y[i]) != '\0') /* copy & test byte */
        i += 1;
}

int fact(int n)
{
    if (n < 1)
        return (1);
    else
        return (n * fact(n - 1));
}

// { /* Some C code to compute the length of a string */
//     {
//         char *str, *p; // Declare pointers to strings
//         // These are 32 bit numbers (addresses).
//         int ct;
//         str = "Cary Price";
//         ct = 0;
//         p = str;
//         while (*p != '\0')
//         {
//             p++;
//             ct++;
//         }
//     }
//     // OR
//     {
//         char *str; // Declare pointers to strings
//         // These are 32 bit numbers (addresses).
//         int ct = 0;
//         str = "Cary Price";
//         while (*(str + ct) != '\0')
//         {
//             {
//                 ct++;
//             }
//         }
//     }
// }

// convert a temperature in Fahrenheit to Celsius:
float f2c(float fahr)
{
    return ((5.0 / 9.0) * (fahr - 32.0));
}

// midterm2015Q4
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

// midterm2016Q2_2
int max(int *array, int size)
{
    int maximum = array[0];
    for (int i = 1; i < size; i++)
        if (array[i] > maximum)
            maximum = array[i];
    return maximum;
}

// Task 2.1
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

// Task 2.2
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

// Assignment 1
// find small array in bigger one
// {
//     int ar1[] = {7, 5, 3, 2, 4, 8, 0, 2, 4};
//     int ar2[3] = {2, 4, 8};
//     int foundLetters = 0, count = 0;
//     for (int i = 0; i < sizeof(ar1) / sizeof(ar1[0]); i++)
//     {
//         if (ar1[i] == ar2[count])
//         {
//             count++;
//             foundLetters++;
//             if (foundLetters == (sizeof(ar2) / sizeof(ar2[0])))
//             {
//                 cout << i - ((sizeof(ar2) / sizeof(ar2[0]))-1);
//                 return 0;
//             }
//         }
//         else
//         {
//             count = 0;
//             foundLetters = 0;
//         }
//     }
//     cout << -1;
// }
