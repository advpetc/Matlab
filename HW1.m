%{
Haoyang Chen
ITP 168 - Spring 2016
chenhaoy@usc.edu

Revision History
Date     Changes    Programmer
--------------------------------
1/23/16  Original   Haoyang Chen
%}

fprintf('HW1\nAuto Loan Calculator');
purchasePrice=input('Please enter the purchase price of the car: $');  
downPayment=input('Please enter your down payment as a percentage of the purchase price \nEg 10% is 10:');
principle=purchasePrice*(1-0.01*downPayment);
fprintf('Your principle is: $%d', principle);
APR=input('\nPlease enter the APR\nEg 3% is 3:');
APR=0.01*APR;
lengthOfLoan=input('Please enter the length of the loan in years:');
payment=(principle*APR/12)/(1-(1+APR/12)^(-lengthOfLoan*12));
fprintf('Your payments will be: %d/month',payment);
