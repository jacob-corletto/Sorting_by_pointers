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
//==========================================================================================================
//Author information
//   Author name: Jacob Corletto
//   Author email: Jacob.corletto@csu.fullerton.edu
//
//Program information
//   Program name: Sort by Pointers
//   Program languages: Main function in C; Director in asm; sort in C; outputarray in C; inputarray in asm;
//   Date program began: Oct, 1, 2023
//   Date of last update: Oct, 9, 2023
//   Comments reorganized: Oct, 9, 2023
//   Files in the program: Inputarray.asm, director.asm, outputarray.c, sortpointers.c, main.c, r.sh
//
//Purpose
//   The intent of this program is to demonstrate how to order an array of pointers without moving the 
//   pointers themselves.
//
//This file
//   File name: inputarray.asm
//   Language: X86-64
//   Syntax: Ubuntu 
//==========================================================================================================
#include <stdio.h>
#include <iostream>

extern "C"{
  void swap(double** a, double** b){
    double temp = **a;
    **a = **b;
    **b = temp;
  }
  void sort_array(double* arr[], int size){
    int swapped;

    for(int step = 0; step < size-1; ++step){
      swapped = 0;

      for (int i = 0; i < size-step-1; ++i){
        if (*arr[i] > *arr[i+1]){
          swap(&arr[i], &arr[i+1]);

          swapped =1;
        }
      }
      if (swapped ==0){
        break;
      }
    }
  }
}
