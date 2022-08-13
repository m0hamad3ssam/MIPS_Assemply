void strcpy(char x[], char y[])
{
    int i = 0;
    while ((x[i] = y[i]) != '\0') /* copy & test byte */
        i += 1;
}
