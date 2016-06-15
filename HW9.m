%{
Haoyang Chen
ITP 168 - Spring 2016
Homework 9
chenhaoy@usc.edu

Revision History
Date     Changes    Programmer
--------------------------------
4/3/16  Original   Haoyang Chen
%}

%coverr X and Y data to meters
xMeters=zeros(length(X));
yMeters=zeros(length(Y));
for index=2:length(X)
    xMeters(index)=xMeters(index-1)+6370000*tan(X(index-1)-X(index));
end
for index1=2:length(Y)
    yMeters(index1)=yMeters(index1-1)+6370000*tan(Y(index1-1)-Y(index1));
end

%Plot Contour, Surface, and Boundary Box
boxSize=50;
startX=1;
endX=boxSize;
x=linspace(startX,endX,50);
startY=1;
endY=boxSize;
y=linspace(startY,endY,50);
nodesToMove=10;

%creating several lines (vectors)
topLineX=[startX endX];
topLineY=[endY endY];
bottomLineX=[startX endX];
bottomLineY=[startY startY];
leftLineX=[startX startX];
leftLineY=[startY endY];
rightLineX=[endX endX];
rightLineY=[startY endY];

%creating subplot
surface=plot3(sqrt(X),sqrt(Y),sqrt(ELEV));
subplot(2,1),surface;
