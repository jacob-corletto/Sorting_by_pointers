#!/bin/bash


#Author: Jacob Corletto
#Program name: Sort by Pointers

rm *.o
rm *.out

nasm -f elf64 -l asm_sort_director.lis -g -o director.o director.asm

nasm -f elf64 -l input.lis -g -o input.o inputarray.asm

nasm -f elf64 -l sortasm.lis -g -o sortasm.o sortasm.asm

g++ -c -m64 -Wall -g -o output.o outputarray.cpp -fno-pie -no-pie -std=c++20

g++ -c -m64 -Wall -g -o main-driver.o main.cpp -fno-pie -no-pie -std=c++20

g++ -m64 -g -o runx.out sortasm.o director.o main-driver.o input.o output.o -fno-pie -no-pie -std=c++20

./runx.out