%{
Input Variablen
                 % Input: five points from user 
								 x and y coordinate of the vanishing point: r c;
                 x and y coordinates from five corner points from the user selected: x,y;
                 m and n is the width and height of the image
Output Variablen

ctrlPoint                % Output: five points in our computational systems
						
%}


function [ctrlPoint] = calculatecP(x,y,r,c,m,n)
y=-y(:,:)+m+1;
c=-c+m+1;
t=m;
m=n;
n=t;
ctrlPoint = zeros(5,2);
%vanishing point
ctrlPoint(1,1)=1/m*r;
ctrlPoint(1,2)=1/n*c;
%point bottom left
ctrlPoint(2,1)=1/m*x(3);
ctrlPoint(2,2)=1/n*y(3);
%point bottom right
ctrlPoint(3,1)=1/m*x(4);
ctrlPoint(3,2)=1/n*y(4);
%point upper right
ctrlPoint(4,1)=1/m*x(2);
ctrlPoint(4,2)=1/n*y(2);
%point upper left
ctrlPoint(5,1)=1/m*x(1);
ctrlPoint(5,2)=1/n*y(1);
end
