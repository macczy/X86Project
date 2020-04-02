#!/bin/bash
cc -m32 -std=c99 -c main.c
nasm -f elf32 longestseq.asm
cc -m32 -o prog main.o longestseq.o