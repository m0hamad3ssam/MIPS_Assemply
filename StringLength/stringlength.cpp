    {
        char *str, *p; // Declare pointers to strings
        // These are 32 bit numbers (addresses).
        int ct;
        str = "Cary Price";
        ct = 0;
        p = str;
        while (*p != '\0')
        {
            p++;
            ct++;
        }
    }
    // OR
    {
        char *str; // Declare pointers to strings
        // These are 32 bit numbers (addresses).
        int ct = 0;
        str = "Cary Price";
        while (*(str + ct) != '\0')
        {
            ct++;
        }
    }
