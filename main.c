/*jacob corletto
  CWID: 888466117
  Copyright 2023

*/


#include "stdio.h"
#include <iostream>
// #include "outputarray.c"
using namespace std;

extern "C" {
  unsigned long* director();
}

// int main() {
//   double sum = 0.0;
//   cout<<("Welcome to a great program developed by Jacob Corletto \n");
  
//   sum = director();

//   cout<<("NUMBERS");
//   cout<<("Main will keep these and send a zero to the operating system \n");

//   return 0;
// }

int main() {
  printf("Welcome to a great program developed by Jacob Corletto \n");
  
  unsigned long* returnarray = director();

  int size = (int)returnarray[0];

  double** startptr = (double**)returnarray[1];

  printf("The main function recieved this array\n");

  for (int i = 0; i < size; i++ ){
    printf("%lf \n",*(startptr[i]));
  }

  printf("NUMBERS");
  printf("Main will keep these and send a zero to the operating system \n");

  return 0;
}