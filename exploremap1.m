%{ 
 Gong Jingwen
 ITP 168, Spring 2016
 Homework 9
 gongjing@usc.edu

 Revision History
 4/2/16    Original    Gong Jingwen
%}

function exploremap1()
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
xDiff = diff(X);
yDiff = diff(Y);

%create a vector of zeros
xMeters = zeros(size(X));
yMeters = zeros(size(Y));
radiusOfEarth = 6.371 * 10^6;

%calculate the values of the X and Y vectors in METERS
for index = 2 : length(X)
    xMeters(index) = xMeters(index - 1) + radiusOfEarth * tand(X(index-1) - X(index));
end;
for index = 2 : length(Y)
    yMeters(index) = yMeters(index - 1) + radiusOfEarth * tand(X(index-1) - X(index));
end;
%find dimensions of the ELEV variable to determine the number of rows and
%columns
[numOfRow, numOfCol] = size(ELEV);

%build grid
[XGrid,YGrid] = meshgrid(numOfRow,numOfCol);

%determine boundary box size
sofBox = 50;

%give starting and ending X and Y points
sX = 1;
sY = 1;
eX = sofBox;
eY = sofBox;

%determine how many points to shift when we move
shift = 10;

%create the vectors for the boundary box (two elements in each)
    topX = [X(sX),X(eX)];
    topY = [Y(eY),Y(eY)];
    botX = [X(sX),X(eX)];
    botY = [Y(sY),Y(sY)];
    lefX = [X(sX),X(sX)];
    lefY = [Y(sY),Y(eY)];
    ritX = [X(eX),X(eX)];
    ritY = [Y(sY),Y(eY)];


%plot first grid (use the value of the boundary box size)
%call subplot and plot the surface
X1 = xMeters(sX : eX);
Y1 = yMeters(sY : eY);

%[X1Grid,Y1Grid] = meshgrid(X1,Y1);
Z1 = ELEV(sX : eX,sY : eY);

%subplot(2,1,1), surf(X1Grid,Y1Grid,Z1);
subplot(2,1,1), mapHandle = surf(X1,Y1,Z1);

%set the axis to equal
axis equal;

%call subplot and plot the contour and the boundary box


subplot(2,1,2)
hold on
contour(X,Y,ELEV);
topHandle = plot(topX,topY,'m--');
botHandle = plot(botX,botY,'m--');
lefHandle = plot(lefX,lefY,'m--');
ritHandle = plot(ritX,ritY,'m--');
% plot(topX,topY,'m--');
% plot(botX,botY,'m--');
% plot(lefX,lefY,'m--');
% plot(ritX,ritY,'m--');

hold off


%don't touch this stuff
set(gcf,'KeyPressFcn',@callback);
set(gcf,'CurrentCharacter','n');
while (true)
    choose = get(gcf,'CurrentCharacter');
    switch choose
        case 's'
            %the user wants to move south
            %write code here
            if (eY + shift) >= numOfRow
                eY = numOfRow;
                sY = numOfRow - sofBox +1;
            else
                eY = eY + shift;
                sY = sY + shift;
            end;
            
            %stop writing code here
        case 'w'
            %the user wants to move north
            %write code here
            
            if (sY - shift) < 1
                eY = sofBox;
                sY = 1;
            else
                eY = eY - shift;
                sY = sY - shift;
            end;
            
            %stop writing code here
        case 'a'
            %the user wants to move west
            %write code here
           
            
            if (eX + shift) >=numOfCol
                eX = numOfCol;
                sX = numOfCol - sofBox +1;
            else
                eX = eX + shift;
                sX = sX + shift;
            end;
            %stop writing code here
        case 'd'
            %the user wants to move east
            %write code here
            if (sX - shift) < 1
                eX = sofBox;
                sX = 1;
            else
                eX = eX - shift;
                sX = sX - shift;
            end;
            
            %stop writing code here
        case 'q'
            %user quits
            break;
    end;
    set(gcf,'CurrentCharacter','n');
    %continue writing code here
    
    %calculate NEW boundary box X and Y values (for all 4 lines)

    
    topX = [X(sX),X(eX)];
    topY = [Y(eY),Y(eY)];
    botX = [X(sX),X(eX)];
    botY = [Y(sY),Y(sY)];
    lefX = [X(sX),X(sX)];
    lefY = [Y(sY),Y(eY)];
    ritX = [X(eX),X(eX)];
    ritY = [Y(sY),Y(eY)];
    %use set function to set XData and YData for the boundary lines and the
    %surface plot
    subplot(2,1,2);
    set(topHandle, 'XData',topX);
    set(topHandle, 'YData',topY);
    set(botHandle, 'XData',botX);
    set(botHandle, 'YData',botY);
    set(lefHandle, 'XData',lefX);
    set(lefHandle, 'YData',lefY);
    set(ritHandle, 'XData',ritX);
    set(ritHandle, 'YData',ritY);
    
    subplot(2,1,1);
    set(mapHandle, 'XData', xMeters(sX : eX));
    set(mapHandle, 'YData', yMeters(sY : eY));
    set(mapHandle, 'ZData', ELEV(eY :-1: sY, eX :-1: sX));
    axis equal
    %call drawnow function
    drawnow;
    
end;
end

%don't touch any of this.
function callback(hObject, callbackdata)

end