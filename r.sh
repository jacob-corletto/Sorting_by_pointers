#!/bin/bash


#Author: Floyd Holliday
#Program name: Basic Float Operations

rm *.o
rm *.out

nasm -f elf64 -l director.lis -g -o director.o director.asm

nasm -f elf64 -l input.lis -g -o input.o inputarray.asm

g++ -c -m64 -Wall -g -o output.o outputarray.cpp -fno-pie -no-pie -std=c++20

g++ -c -m64 -Wall -g -o main-driver.o main.cpp -fno-pie -no-pie -std=c++20

g++ -c -m64 -Wall -g -o sortpointers.o sortpointers.cpp -fno-pie -no-pie -std=c++20

g++ -m64 -g -o run.out director.o main-driver.o input.o output.o sortpointers.o -fno-pie -no-pie -std=c++20

./run.out