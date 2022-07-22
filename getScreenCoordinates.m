%% ReadMe
%{
backproject all the 3d points into 2d
%}

function vector2d = getScreenCoordinates(point3d,coord3d,r,c,f)
len=size(coord3d,1);
vector2d=zeros(len,6);
for i=1:len
  %point3d(1)is the x coordinate ; 2 the y coordinate;3 the z coordinate
  %r is the x coordinate of vp, y is the y coordinate of vp
%     vector2d(i,1) = (-point3d(i,3)-1)/(-point3d(i,3))*(r-point3d(i,1))+point3d(i,1);
%     vector2d(i,2) = (-point3d(i,3)-1)/(-point3d(i,3))*(c-point3d(i,2))+point3d(i,2); 
vector2d(i,2)= -f/point3d(i,3)*(point3d(i,2)-c)+c;
vector2d(i,1)= -f/point3d(i,3)*(point3d(i,1)-r)+r;
  vector2d(i,3:5)=coord3d(i,4:6);
  vector2d(i,6)=point3d(i,3);
end
end
