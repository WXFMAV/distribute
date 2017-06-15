#include<stdio.h>
#include<stdlib.h>
#include<math.h>

double gaussrand()
{
    static double V1, V2, S;
    static int phase = 0;
    double X;
     
int times = 0;
    if ( phase == 0 ) {
        do {
            double U1 = (double)rand() / RAND_MAX;
            double U2 = (double)rand() / RAND_MAX;
             
            V1 = 2 * U1 - 1;
            V2 = 2 * U2 - 1;
            S = V1 * V1 + V2 * V2;
             times ++;
        } while(S >= 1 || S == 0);
         
        X = V1 * sqrt(-2 * log(S) / S);
    } else
        X = V2 * sqrt(-2 * log(S) / S);
         
    phase = 1 - phase;
 printf("times = %d\n", times);
    return X;
}

int main()
{
   srand(2);
   for(int k = 0; k< 1000; k++){
        printf("%.2lf\n",gaussrand());
   }
   return 0;
}
