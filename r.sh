#===========================License========================================================================
#Program name = "Sort by Pointers". This program will take in an array and store them in malloc. The program will then sort the array of pointers by value.
#Copyright (C) 2023 Jacob Corletto
#
#This file is part of the software program "Sort by Pointers"
#"Sort by Pointers" is free software: you can redistribute it and/or modify it under the terms of the GNU General Public
#License version 3 as published by the Free Software Foundation.
#This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY.
#warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
#A copy of the GNU General Public License v3 has been distributed with this software. If not found it is available here: 
#<https:#www.gnu.org/licenses/>. The copyright holder may be contracted here: jacob.corletto@csu.fullerton.edu
#==========================================================================================================

rm *.o
rm *.out

nasm -f elf64 -l director.lis -g -o director.o director.asm

nasm -f elf64 -l input.lis -g -o input.o inputarray.asm

g++ -c -m64 -Wall -g -o output.o outputarray.c -fno-pie -no-pie -std=c++20

g++ -c -m64 -Wall -g -o main-driver.o main.c -fno-pie -no-pie -std=c++20

g++ -c -m64 -Wall -g -o sortpointers.o sortpointers.c -fno-pie -no-pie -std=c++20

g++ -m64 -g -o run.out director.o main-driver.o input.o output.o sortpointers.o -fno-pie -no-pie -std=c++20

./run.out