%{
Haoyang Chen
ITP 168 - Spring 2016
Homework 10
chenhaoy@usc.edu

Revision History
Date     Changes    Programmer
--------------------------------
4/19/16  Original   Haoyang Chen
%}
function [L,U]=ludecomp(A)
%ludecomp Summary of this function goes here
%   Detailed explanation goes here
[row,col]=size(A);
if row>col
    error('The input matrix should not have bigger row than col!');
end
U=A;
L=eye(row);
[lowerR,lowerC]=size(L);
for i=1:row-1
    for j=i+1:row
        factor=-U(j,i)/U(i,i);
        temp1=U(i,i:end)*factor;
        U(j,i:end)=U(j,i:end)+temp1;
        
        temp=eye(lowerR,lowerC);
        temp2=temp(i,i:end)*factor;
        temp(j,i:end)=temp(j,i:end)+temp2;
        L=L*inv(temp);
    end  
end
end

