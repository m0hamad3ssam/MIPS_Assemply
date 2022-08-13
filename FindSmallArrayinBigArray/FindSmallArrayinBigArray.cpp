find small array in bigger one
{
    int ar1[] = {7, 5, 3, 2, 4, 8, 0, 2, 4};
    int ar2[3] = {2, 4, 8};
    int foundLetters = 0, count = 0;
    for (int i = 0; i < sizeof(ar1) / sizeof(ar1[0]); i++)
    {
        if (ar1[i] == ar2[count])
        {
            count++;
            foundLetters++;
            if (foundLetters == (sizeof(ar2) / sizeof(ar2[0])))
            {
                cout << i - ((sizeof(ar2) / sizeof(ar2[0]))-1);
                return 0;
            }
        }
        else
        {
            count = 0;
            foundLetters = 0;
        }
    }
    cout << -1;
}

