#!/bin/bash
cc -m64 -std=c99 -c main.c
nasm -f elf64 longestseq.asm
cc -m64 -o prog main.o longestseq.o
