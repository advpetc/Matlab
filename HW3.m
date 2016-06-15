%{
Haoyang Chen
ITP 168 - Spring 2016
chenhaoy@usc.edu

Revision History
Date     Changes    Programmer
--------------------------------
2/7/16  Original   Haoyang Chen
%}

operand1=input('Please enter the first operand:');
operand2=input('Please enter the second operand:');
fprintf('Please choose from the following options:\n');
choice=input('1) Addition\n2) Subtraction\n3) Multiplication\n4) Division\nChoose:');
switch(choice)
    case 1
        answer=operand1+operand2;
        fprintf('%d + %d = %d', operand1, operand2, answer);
    case 2
        answer=operand1-operand2;
        fprintf('%d - %d = %d', operand1, operand2, answer);
    case 3
        answer=operand1*operand2;
        fprintf('%d * %d = %d', operand1, operand2, answer);
    case 4
        answer=randNum1/randNum2;
        fprintf('%d / %d = %d', operand1, operand2, answer);
    otherwise
        fprintf('Invalid choice for operation!');
end