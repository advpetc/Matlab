%{
Haoyang Chen
ITP 168 - Spring 2016
chenhaoy@usc.edu

Revision History
Date     Changes    Programmer
--------------------------------
2/14/16  Original   Haoyang Chen
%}
choiceValid=true;
while(choiceValid)
choice=input('\n1) Series Approx. of sin(x)\n2) Series Approx. of cos(x)\n3) Series Approx. of e^(x)\n4) Fibonacci Sequence\n5) Quit\nChoose:');

switch choice
    %case one for the computation of sin(x)
    case 1
        radianValue=input('Enter radian value:');
        validNum=true;
        while(validNum)
            numOfIter=input('Enter the number of iterations:');
            validNum=false;
            if(numOfIter<1)
                fprintf('Please re-enter, the iterations should be greater than 1!\n');
                validNum=true;
            end
        end
        anser=0;
        for i=1:numOfIter
            anser=anser+((-1)^(i-1)/factorial(2*i-1))*radianValue^(2*i-1);
        end
        fprintf('sin(%.3f) = %.3f',radianValue, anser);
            choiceValid=true;
    %case two for the computation of cos(x)
    case 2  
        radianValue=input('Enter radian value:');
        validNum=true;
        while(validNum)
            numOfIter=input('Enter the number of iterations:');
            validNum=false;
            if(numOfIter<1)
                fprintf('Please re-enter, the iterations should be greater than 1!\n');
                validNum=true;
            end
        end
        anser=0;
        for i=1:numOfIter
            anser=anser+((-1)^(i-1)/factorial(2*i-2))*radianValue^(2*i-2);
        end
        fprintf('cos(%.3f) = %.3f',radianValue, anser);
        choice=true;
    %case three for the computation of e^x
    case 3
        expVal=input('Enter exponent value:');
        validNum=true;
        while(validNum)
            numOfIter=input('Enter the number of iterations:');
            validNum=false;
            if(numOfIter<1)
                fprintf('Please re-enter, the iterations should be greater than 1!\n');
                validNum=true;
            end
        end
        anser=0;
        for i=1:numOfIter
            k=factorial(i-1);
            anser=anser+(expVal)^(i-1)/k;
        end
        fprintf('e^(%.3f) = %.3f',expVal, anser);
        choice=true;
    %case four for the display of Fibonacci numbers
    case 4
        validNum1=true;
        while(validNum1)
            numOfFab=input('Enter the number of Fibonacci numbers to present:');
            validNum1=false;
                if numOfIter<1
                     fprintf('Please re-enter, the iterations should be greater than 1!\n');
                 validNum1=true;
                end
        end
        anser=zeros(numOfFab);
        anser(1)=1;
        anser(2)=1;
        for index=3:numOfFab
            anser(index)=anser(index-1)+anser(index-2);
            fprintf('%d : %d\n',index,anser(index));
        end
        choiceValid=true;
    %case five for exit
    case 5
        choiceValid=false;
        fprintf('Goodbye!');
    %default case for illegal input
    otherwise
        fprintf('Please make a valid choice!\n');
        choiceValid=true;
end
end %the entire loop for asking the question again and again