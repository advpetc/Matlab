%{
Haoyang Chen
ITP 168 - Spring 2016
chenhaoy@usc.edu

Revision History
Date     Changes    Programmer
--------------------------------
3/3/16  Original   Haoyang Chen
%}

shape=struct('Circle',[],'RightTriangle',[],'Square',[]);
shape.Circle=struct('Radius',[],'Center',[],'Area',[]);
shape.RightTriangle=struct('SideLength',[],'Center',[],'Area',[]);
shape.Square=struct('SideLength',[],'Center',[],'Area',[]);

printCircle='';
printTriangle='';
printSquare='';
check=true;
while(check)
    choice1=input('Would you like to create a circle? (Y/N): ', 's');
    choice2=input('Would you like to make a triangle? (Y/N): ','s');
    choice3=input('Would you like to make a square? (Y/N): ','s');
    circleNum=0;
    triangleNum=0;
    squareNum=0;
    if strcmpi(choice1,'y')
        circleNum=1;
        printCircle='Circle';
        shape.Circle.Radius=randi(10);
        shape.Circle.Center=randi([0,10],1,2);
        shape.Circle.Area=pi*shape.Circle.Radius*shape.Circle.Radius;
        check=false;
%         circle='Circle';
    else
        shape=rmfield(shape,'Circle');
    end
    if strcmpi(choice2,'y')
        triangleNum=1;
        printTriangle='Right Triangle';
        shape.RightTriangle.SideLength=randi([0,10],1,2);
        shape.RightTriangle.Center=randi([0,10],1,2);
        shape.RightTriangle.Area=.5*shape.RightTriangle.SideLength(1)*shape.RightTriangle.SideLength(2);
        check=false;
    
    else
        shape=rmfield(shape,'RightTriangle');
    end
    if strcmpi(choice3,'y')
        squareNum=1;
        printSquare='Square';
        shape.Square.SideLength=randi([0,10],1,2);
        shape.Square.Center=randi([0,10],1,2);
        shape.Square.Area=shape.Square.SideLength(1)*shape.Square.SideLength(2);
        check=false;   
    else
        shape=rmfield(shape,'Square');
    end
    printNum=circleNum+triangleNum+squareNum;
    if printNum==1;
        fprintf('You only create a single shape: %s%s%s\n',printCircle,printTriangle,printSquare);
        check=true;
    elseif printNum==0;
        fprintf('You did not create any shapes! Please choose again!\n'); 
    else
        fprintf('You create these shapes:\n');
        if (printCircle=='')==0
            fprintf('%s\n',printCircle);
        end
        if (printTriangle=='')==0
            fprintf('%s\n',printTriangle);
        end
        if (printSquare=='')==0
            fprintf('%s',printSquare);
        end
    end
end

fprintf('\nChoose two shapes to calculate the distance between centers.\nYou must spell them EXACTLY as they were written\n');
check1=true;
while(check1)
    shape1=input('First shape: ','s');
    switch shape1
        case 'Circle'
            check1=false;
        case 'Triangle'
            check1=false;
        case 'Square'
            check1=false;
        otherwise
            fprintf('No shape by that name!\n');
    end
end
check2=true;
while(check2)
    shape2=input('First shape: ','s');
    switch shape2
        case 'Circle'
            check2=false;
        case 'Triangle'
            check2=false;
        case 'Square'
            check2=false;
        otherwise
            fprintf('No shape by that name!\n');
    end
end
distance=((shape.shape1.Center(1)-shape.shape2.Center(1))^2+(shape.shape1.Center(2)-shape.shape2.Center(2))^2);
fprintf('The distance between the %s and the %s is %.3f\n',shape1, shape2, distance);

fprintf('\nChoose two shapes to calculate the ratio of the areas.\nYou must spell them EXACTLY as they were written\n');
check1=true;
while(check1)
    shape1=input('First shape: ','s');
    switch shape1
        case 'Circle'
            check1=false;
        case 'Triangle'
            check1=false;
        case 'Square'
            check1=false;
        otherwise
            fprintf('No shape by that name!\n');
    end
end
check2=true;
while(check2)
    shape2=input('First shape: ','s');
    switch shape2
        case 'Circle'
            check2=false;
        case 'Triangle'
            check2=false;
        case 'Square'
            check2=false;
        otherwise
            fprintf('No shape by that name!\n');
    end
end
areaRatio=shape.shape1.Area/shape.shape2.Area;
fprintf('The ratio of the areas (%s : %s) is %.3f',shape1, shape2, areaRatio);         