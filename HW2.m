%{
Haoyang Chen
ITP 168 - Spring 2016
chenhaoy@usc.edu

Revision History
Date     Changes    Programmer
--------------------------------
1/31/16  Original   Haoyang Chen
%}
maxIncome=[9225, 28225, 53300, 98550, 222200, 1700];
taxPercent=[0.1, 0.15, 0.25, 0.28, 0.33, 0.35, 0.396];
Jan=input('Enter income for January: $');
Feb=input('Enter income for February: $');
Mar=input('Enter income for March: $');
Apr=input('Enter income for April: $');
May=input('Enter income for May: $');
Jun=input('Enter income for June: $');
Jul=input('Enter income for July: $');
Aug=input('Enter income for August: $');
Sep=input('Enter income for September: $');
Oct=input('Enter income for October: $');
Nov=input('Enter income for November: $');
Dec=input('Enter income for December: $');
income=[Jan, Feb, Mar, Apr, May, Jun, Jul, Oct, Aug, Sep, Nov, Dec];
totalIncome=sum(income);
fprintf('Your total income is $%d\n',totalIncome);
if(totalIncome<=9225)
    tax=totalIncome*taxPercent(1);
elseif(totalIncome<=37450)
    tax=maxIncome(1)*taxPercent(1)+(totalIncome-9225)*taxPercent(2);
elseif(totalIncome<=90750)
    tax=maxIncome(1)*taxPercent(1)+maxIncome(2)*taxPercent(2)+(totalIncome-37450)*taxPercent(3);
elseif(totalIncome<=189300)
    tax=maxIncome(1)*taxPercent(1)+maxIncome(2)*taxPercent(2)+maxIncome(3)*taxPercent(3)+(totalIncome-90750)*taxPercent(4);
elseif(totalIncome<=411500)
    tax=maxIncome(1)*taxPercent(1)+maxIncome(2)*taxPercent(2)+maxIncome(3)*taxPercent(3)+maxIncome(4)*taxPercent(4)+(totalIncome-189300)*taxPercent(5);
elseif(totalIncome<=413200)
    tax=maxIncome(1)*taxPercent(1)+maxIncome(2)*taxPercent(2)+maxIncome(3)*taxPercent(3)+maxIncome(4)*taxPercent(4)+maxIncome(5)*taxPercent(5)+(totalIncome-411500)*taxPercent(6);
else
    tax=maxIncome(1)*taxPercent(1)+maxIncome(2)*taxPercent(2)+maxIncome(3)*taxPercent(3)+maxIncome(4)*taxPercent(4)+maxIncome(5)*taxPercent(5)+maxIncome(6)*taxPercent(6)+(totalIncome-413200)*taxPercent(7);
end;
effectiveTaxRate=tax/totalIncome*100;
fprintf('With Your owe taxes in the amount of $%.2f\n',tax);
fprintf('Your effective tax rate is %.4f %%',effectiveTaxRate);