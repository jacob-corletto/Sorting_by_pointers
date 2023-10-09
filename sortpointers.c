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
#include <stdio.h>
#include <iostream>

extern "C"{
  void sort_array(double* arr[], int size){
    double *temp;
    int swapped;

    for(int step = 0; step < size-1; ++step){
      swapped = 0;

      for (int i = 0; i < size-step-1; ++i){
        if (*arr[i] > *arr[i+1]){
          temp = arr[i];
          arr[i] = arr[i+1];
          arr[i+1] = temp;

          swapped =1;
        }
      }
      if (swapped ==0){
        break;
      }
    }
  }
}
