%{
Haoyang Chen
ITP 168 - Spring 2016
Homework 8
chenhaoy@usc.edu

Revision History
Date     Changes    Programmer
--------------------------------
3/30/16  Original   Haoyang Chen
%}

function sinvis(numOfPeriods)
%sinvis Summary of this function goes here
%   Detailed explanation goes here
%   will visualize the sine function using a circle in an animated plot.

%input check
if numOfPeriods<0
    error('The input should be positive!');
end
if isscalar(numOfPeriods)==0
    error('The input should be a scalar!');
end
if floor(numOfPeriods)~=numOfPeriods
    error('The input should be an integer!');
end
    degree=linspace(0,2*pi*numOfPeriods,1000);
    myX=cos(degree);
    myY=sin(degree);

hold on

%Draw sine function
periods=linspace(0,2*pi*numOfPeriods,1000);
sinY=sin(periods);
circle=plot(periods(1)+myX,myY);
sinFunction=plot(periods(1),sinY(1),'b');

%draw radial line
radialX=linspace(periods(1),periods(1)+myX(1));
radialY=linspace(0,sinY(1));
radialLine=plot(radialX, radialY, 'c+');

%draw horizontal line
horX=linspace(periods(1),periods(1)+myX(1));
horY=linspace(sinY(1),sinY(1));
horLine=plot(horX, horY, 'b+');

%draw point
point=plot(periods(1)+myX(1),myY(1),'b+');

%animate the plot
axis square;
axis([-2 2 -2 2]);

for i=1:1000
    set(circle,'XData',periods(i)+myX);
    
    set(point,'XData',periods(i)+myX(i));
    set(point,'YData',myY(i));
    
    set(sinFunction,'XData',periods(1:i));
    set(sinFunction,'YData',sinY(1:i));

    radialX=linspace(periods(i),periods(i)+myX(i));
    radialY=linspace(0,sinY(i));
    set(radialLine,'XData',radialX);
    set(radialLine,'YData',radialY);

    horX=linspace(periods(i),periods(i)+myX(i));
    horY=linspace(sinY(i),sinY(i));
    set(horLine,'XData',horX);
    set(horLine,'YData',horY);
    drawnow;
    axis([-2+periods(i) 2+periods(i) -2 2]);
end;
hold off
end