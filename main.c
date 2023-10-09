//===========================License========================================================================
//Program name = "Sort by Pointers". This program will take in an array and store them in malloc. The program will then sort the array of pointers by value.
//Copyright (C) 2023 Jacob Corletto
//
//This file is part of the software program "Sort by Pointers"
//"Sort by Pointers" is free software: you can redistribute it and/or modify it under the terms of the GNU General Public
//License version 3 as published by the Free Software Foundation.
//This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY.
//warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
//A copy of the GNU General Public License v3 has been distributed with this software. If not found it is available here: 
//<https://www.gnu.org/licenses/>. The copyright holder may be contracted here: jacob.corletto@csu.fullerton.edu
//==========================================================================================================

#include "stdio.h"
using namespace std;

extern "C" {
  unsigned long* director();
}

int main() {
  printf("Welcome to a great program developed by Jacob Corletto \n");
  
  unsigned long* returnarray = director();

  int size = (int)returnarray[0];

  double** startptr = (double**)returnarray[1];

  printf("The main function recieved this array\n");

  for (int i = 0; i < size; i++ ){
    printf("%lf \n",*(startptr[i]));
  }

  printf("Main will keep these and send a zero to the operating system \n");

  return 0;
}