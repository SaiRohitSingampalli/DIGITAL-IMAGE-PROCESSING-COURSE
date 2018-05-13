clc;
clear all;
a=imread('einstein.jpg');
[I, trans]=histogram_equalization(a);