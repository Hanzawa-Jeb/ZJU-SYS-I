#include <stdio.h>
#include <limits.h>

unsigned srl(unsigned x, int k)
{
    unsigned xsra = (int) x >> k;
    unsigned w = sizeof(int) << 3;
    unsigned u_max = -1;    
    /*To get the 1111...1*/
    unsigned mask = u_max << (w - k);
    unsigned mask = ~mask;  
    /*to get mask with k zeros and w-k ones, which can ignore the ones in xsra*/
    return mask & xsra;     
    /*the answer has get rid of the ones in the beginning, and the remaining ones keep unchanged.*/
}

int sra(int x, int k)
{
    unsigned xsrl = (unsigned) x >> k;
    unsigned w = sizeof(int) << 3;
    unsigned sign = x >> (w - 1);
    /*get the sign of variable x, if negative, it would be 111...1, else, then 000...0*/
    unsigned mask = -1;
    /*get the u_max*/
    mask = mask << (w - k);
    /*get 111...1000...0*/
    mask = mask & sign;
    /*determine whether we need the mask or not*/
    return mask | xsrl;
}