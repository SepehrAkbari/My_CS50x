#include <cs50.h>
#include <stdio.h>

int main(void)
{
    long num = get_long("Number: ");
    long numCopy = num;

    int n = 0;
    int m = 0;
    int len = 0;
    int firstDig;
    int secondDig;

    if (numCopy != 0)
    {
        while (numCopy >= 100)
        {
            numCopy /= 10;
        }
        secondDig = numCopy;
        numCopy /= 10;
        firstDig = numCopy;
    }

    while (num > 0)
    {
        if (num > 0)
        {
            len++;
            int k = num % 10;
            num /= 10;
            n += k;
        }
        else
        {
            break;
        }

        if (num > 0)
        {
            len++;
            int p = num % 10;
            num /= 10;

            int b = p * 2;
            if (b > 9)
            {
                while (b > 0)
                {
                    m += b % 10;
                    b /= 10;
                }
            }
            else
            {
                m += b;
            }
        }
        else
        {
            break;
        }
    }
    int sum = n + m;

    if (sum % 10 == 0)
    {
        if ((len == 13 || len == 16) && firstDig == 4)
        {
            printf("VISA\n");
        }
        else if (len == 15 && (secondDig == 34 || secondDig == 37))
        {
            printf("AMEX\n");
        }
        else if (len == 16 && (secondDig == 51 || secondDig == 52 || secondDig == 53 || secondDig == 54 || secondDig == 55))
        {
            printf("MASTERCARD\n");
        }
        else
        {
            printf("INVALID\n");
        }
    }
    else
    {
        printf("INVALID\n");
    }
}
