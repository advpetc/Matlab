%{
Haoyang Chen
ITP 168 - Spring 2016
Homework 9
chenhaoy@usc.edu

Revision History
Date     Changes              Programmer
------------------------------------------
4/3/16  Original             Haoyang Chen
4/4/16  Second Revision      Haoyang Chen
4/7/16  Thrid Revision       Haoyang Chen
%}

function exploremap()
%EXPLOREMAP is an interactive 3D map of the main Hawaiian islands
% The EXPLOREMAP function takes in no inputs and returns no outputs
% It loads longitude, lattitude, and elevation data, creates a boundary
% box, and plots a surface which represents a section of overall terrain
% map. The terrain map is drawn in a subplot below the surface plot and
% shows the overall terrain along with the boundary lines that translate to
% the boundaries of the surface plot. Have fun...

%Header stuff goes here

%load data
load('HW9.mat');

%we now have access to the variables X,Y ELEV

%calculate the differences between each element in X and Y

%create a vector of zeros
xMeters=zeros(size(X));
yMeters=zeros(size(Y));

%calculate the values of the X and Y vectors in METERS
xMeters(1)=6371000*tand(X(1));
yMeters(1)=6371000*tand(Y(1));
for index=2:length(X)
    xMeters(index)=xMeters(index-1)+6371000*tand(X(index)-X(index-1));
end
for index1=2:length(Y)
    yMeters(index1)=yMeters(index1-1)+6371000*tand(Y(index1)-Y(index1-1));
end
%find dimensions of the ELEV variable to determine the number of rows and
%columns
[rowOfE,colOfE]=size(ELEV);

%build grid
%[Xgrid,Ygrid]=meshgrid(rowOfE,colOfE);

%determine boundary box size
boxSize=50;
    
%give starting and ending X and Y points
startX=1;
startY=1;
endX=boxSize;
endY=boxSize;

%determine how many points to shift when we move
shiftPoints=10;

%create the vectors for the boundary box (two elements in each)
topX=[xMeters(startX),xMeters(endX)];
topY=[yMeters(endY),yMeters(endY)];
bottomX=[xMeters(startX),xMeters(endX)];
bottomY=[yMeters(startY),yMeters(startY)];
leftX=[xMeters(startX),xMeters(startX)];
leftY=[yMeters(startY),yMeters(endY)];
rightX=[xMeters(endX),xMeters(endX)];
rightY=[yMeters(startY),yMeters(endY)];

%plot first grid (use the value of the boundary box size)
%call subplot and plot the surface
X1=xMeters(startX:endX);
Y1=yMeters(startY:endY);
Z1=ELEV(startX:endX,startY:endY);
subplot(2,1,1)
box=surf(X1,Y1,Z1);

%set the axis to equal
axis equal

%call subplot and plot the contour and the boundary box
subplot(2,1,2)
hold on
topLine=plot(topX,topY);
bottomLine=plot(bottomX,bottomY);
leftLine=plot(leftX,leftY);
rightLine=plot(rightX,rightY);
[xGrid,yGrid]=meshgrid(xMeters,yMeters);
contour(xGrid,yGrid,ELEV);
hold off
%don't touch this stuff
set(gcf,'KeyPressFcn',@callback);
set(gcf,'CurrentCharacter','n');
while (true)
    choose = get(gcf,'CurrentCharacter');
    switch choose
        case 's'
            %the user wants to move north
            %write code here
            check=endY+shiftPoints;
            if check>rowOfE
                endY=rowOfE;
                startY=rowOfE-boxSize+1;
            else
                startY=startY+shiftPoints;
                endY=endY+shiftPoints;
            end
            %stop writing code here
        case 'w'
            %the user wants to move south
            %write code here
            check=startY-shiftPoints;
            if check<1
                startY=1;
                endY=boxSize;
            else
                startY=startY-shiftPoints;
                endY=endY-shiftPoints;
            end
            %stop writing code here
        case 'd'
            %the user wants to move west
            %write code here
            check=startX-shiftPoints;
            if check<1
                startX=1;
                endX=boxSize;
            else
                startX=startX-shiftPoints;
                endX=endX-shiftPoints;
            end
            %stop writing code here
        case 'a'
            %the user wants to move east
            %write code here
            check=endX+shiftPoints;
            if check>colOfE
                endX=colOfE;
                startX=colOfE-boxSize+1;
            else
                startX=startX+shiftPoints;
                endX=endX+shiftPoints;
            end
            %stop writing code here
        case 'q'
            %user quits
            break;
    end;
    set(gcf,'CurrentCharacter','n');
    %continue writing code here
    
    %calculate NEW boundary box X and Y values (for all 4 lines)
    topX=[xMeters(startX),xMeters(endX)];
    topY=[yMeters(endY),yMeters(endY)];
    bottomX=[xMeters(startX),xMeters(endX)];
    bottomY=[yMeters(startY),yMeters(startY)];
    leftX=[xMeters(startX),xMeters(startX)];
    leftY=[yMeters(startY),yMeters(endY)];
    rightX=[xMeters(endX),xMeters(endX)];
    rightY=[yMeters(startY),yMeters(endY)];
    
    %use set function to set XData and YData for the boundary lines and the
    %surface plot
    subplot(2,1,2)
    set(topLine,'XData',topX);
    set(topLine,'YData',topY);
    set(bottomLine,'XData',bottomX);
    set(bottomLine,'YData',bottomY);
    set(leftLine,'XData',leftX);
    set(leftLine,'YData',leftY);
    set(rightLine,'XData',rightX);
    set(rightLine,'YData',rightY);
    subplot(2,1,1)
    set(box,'XData',xMeters(startX:endX));
    set(box,'YData',yMeters(startY:endY));
    set(box,'ZData',ELEV(startX:endX,startY:endY));
    %call drawnow function
    drawnow;
end;
end

%don't touch any of this.
function callback(hObject, callbackdata)

end