
function [coords3d] = calcoords3d(ctrlPoint,m,n,f)
%% ReadMe
%{
Input Variablen
ctrlPoint               % Input: five points from user 
								 ctrlPoint = [vanishing pointx y;point bottom left x y;point bottom right x y;point upper right x y ;point upper left x y];


Output Variablen

coords3d                % Output: 3D coordinates 
						coords3d(i,j), i for the number of the points which corresponds to the points of Figure 4.c of the paper.
						e.g i=1 corresponds the point 0 in the paper(vanishing point), i=2 corresponds the point 1 in the paper
							j=1 represents the x-axis coordinate; j=2 represents the y; j= 3 represents the z

%}

coords2d=getEstimatedVerticesScreeenCoordinates(ctrlPoint);
coords3d=estimate3D(coords2d,m,n,f);
x=coords3d(:,1);
y=coords3d(:,2);
z=coords3d(:,3);

for i=1:13
    c=num2str(i-1);
    c=[' ',c];
    text(x(i),y(i),z(i),c)
end
xlabel('X')
ylabel('Y')
zlabel('Z')
% xlim([-2,2])
% ylim([-2,2])
% zlim([-2,2])
end

function  estimatedVertex= getEstimatedVerticesScreeenCoordinates(ctrlPoint)
 for i = 1:4
      gradient(i)=(ctrlPoint(i+1,2)-ctrlPoint(1,2))/(ctrlPoint(i+1,1)-ctrlPoint(1,1));
 end 
     %vanishing point 1
     estimatedVertex(1,1)=ctrlPoint(1,1);
     estimatedVertex(1,2)=ctrlPoint(1,2);
     %calculate the coordinates of pointï¼?1, 2, 7, 8ï¼‰for 3D 
     %bottom left 2
     estimatedVertex(2,1)=ctrlPoint(2,1);
     estimatedVertex(2,2)=ctrlPoint(2,2);
     %bottom right 3
     estimatedVertex(3,1)=ctrlPoint(3,1);
     estimatedVertex(3,2)=ctrlPoint(3,2);
     %upper right 9
     estimatedVertex(9,1)=ctrlPoint(4,1);
     estimatedVertex(9,2)=ctrlPoint(4,2);
     %upper left 8
     estimatedVertex(8,1)=ctrlPoint(5,1);
     estimatedVertex(8,2)=ctrlPoint(5,2);
     %point 4 and 6
     estimatedVertex(4,1)=(-ctrlPoint(1,2))/gradient(1)+ctrlPoint(1,1);
     estimatedVertex(4,2)=0; estimatedVertex(6,1)=0;
     estimatedVertex(6,2)=(-ctrlPoint(1,1))*gradient(1)+ctrlPoint(1,2);
     %point 5 and 7
     estimatedVertex(5,1)=(-ctrlPoint(1,2))/gradient(2)+ctrlPoint(1,1);
     estimatedVertex(5,2)=0; estimatedVertex(7,1)=1;
     estimatedVertex(7,2)=(1-ctrlPoint(1,1))*gradient(2)+ctrlPoint(1,2);
     %point 11 and 13
     estimatedVertex(11,1)=(1-ctrlPoint(1,2))/gradient(3)+ctrlPoint(1,1);
     estimatedVertex(11,2)=1; estimatedVertex(13,1)=1;
     estimatedVertex(13,2)=(1-ctrlPoint(1,1))*gradient(3)+ctrlPoint(1,2);
     %point 10 and 12
     estimatedVertex(10,1)=(1-ctrlPoint(1,2))/gradient(4)+ctrlPoint(1,1);
     estimatedVertex(10,2)=1; estimatedVertex(12,1)=0;
     estimatedVertex(12,2)=(0-ctrlPoint(1,1)*gradient(4)+ctrlPoint(1,2));
end

%calculate the 2d points from the user selected into the 13 points in 3d
function coords3d=estimate3D(coords2d,m,n,f)
l=size(coords2d,1);
coords3d=ones(l,3);
view_x=coords2d(1,1);
view_y=coords2d(1,2);
view_z=0;

for i=2:7
    g=(-view_y)/(coords2d(i,2)-view_y);
    coords3d(i,1)=g*(coords2d(i,1)-view_x)+view_x;
    coords3d(i,3)=g*(-f-view_z)+view_z;
    coords3d(i,2)=0;
    
end
coords3d(1,1)=view_x;
coords3d(1,2)=view_y;
coords3d(1,3)=coords3d(2,3);

height=-(coords2d(8,2)-coords2d(2,2))*coords3d(2,3)/f;

coords3d(8,1)=coords3d(2,1);
coords3d(8,2)=height;
coords3d(8,3)=coords3d(2,3);

coords3d(9,1)=coords3d(3,1);
coords3d(9,2)=height;
coords3d(9,3)=coords3d(3,3);

for i=10:13
    g=(height-view_y)/(coords2d(i,2)-view_y);
    coords3d(i,1)=g*(coords2d(i,1)-view_x)+view_x;
    coords3d(i,3)=g*(-f-view_z)+view_z;
    coords3d(i,2)=height;
end

 
end



