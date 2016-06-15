%{
Haoyang Chen
ITP 168 - Spring 2016
Homework 11
chenhaoy@usc.edu

Revision History
Date     Changes    Programmer
--------------------------------
4/23/16  Original   Haoyang Chen
%}
function [dText,key]=freqsubdecyph(word)
%freqsubdecyph Summary of this function goes here
%   Detailed explanation goes here
[row,col]=size(word);
if row~=1
    error('Input text should only be one row!');
end
word=upper(word);
str='ABCDEFGHIJKLMNOPQRSTUVWXYZ';
occ=0;
maxOcc=0;
maxStr=1;
for i=1:length(str)
    for j=1:length(word)
        if strcmp(str(i),word(j))
            occ=occ+1;
        end
    end
%     fprintf('%d\n',occ);
    if occ>maxOcc
        maxOcc=occ;
        maxStr=i;
    end
    occ=0;
end
key=str;
key(1:27-maxStr)=str(maxStr:end);
key(28-maxStr:end)=str(1:maxStr-1);
temp=key(1:22);
key(1:4)=key(23:end);
key(5:end)=temp;
dText=word;
for i=1:length(word)
    for j=1:length(str)
        if strcmp(word(i),key(j))
            dText(i)=str(j);
        end
    end 
end

end