#include <stdio.h>
typedef unsigned float_bits;
float float_negate(float f);

int main()
{
    printf("%f\n", float_negate(32.0));
    printf("%f\n", float_negate(-12.8));
    printf("%f\n", float_negate(0.0));
    return 0;
}

float float_negate(float f)
{
    float_bits bits = (float_bits)f;
    unsigned sign = bits >> 31;
    unsigned exp = bits >> 23 & 0xFF;
    unsigned frac = bits & 0x7FFFFF;
    if (exp == 0xFF && frac != 0)
    /*f is NaN, directly return.*/
    {
        return f;
    }
    else 
    {
        unsigned mask = 1;
        mask = mask << 31;
        /*create the mask of 10000...*/
        return (float)(mask ^ bits);
        /*the MSB would be converted to it's complement of one, and others remain unchanged.*/
    }
}