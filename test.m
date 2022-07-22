function test(handles,img,x,y,r,c,m,n,angle,translation,f)
% % input:
% handles: handles of image
% img: input image
% x,y,: coordinates of bounding box
% r,c: coordinates of vanishing point
% angel: rotation angle
% translation: translation vaule
% f:focal length
% %

[m1,n1,cc]=size(img);
coord2d=zeros(m1*n1,5);
for i=1:m1
    for j=1:n1
        coord2d(j+(i-1)*n1,1)=i;
        coord2d(j+(i-1)*n1,2)=j;
        coord2d(j+(i-1)*n1,3:5)=img(i,j,:);
    end
end

tmp=coord2d(:,2);
coord2d(:,2)=coord2d(:,1);
coord2d(:,1)=tmp;

coord2d(:,2)=-coord2d(:,2)+m1+1;

[ctrlPoint] = calculatecP(x,y,r,c,m1,n1);
[corners3d] = calcoords3d(ctrlPoint,m1,n1,f);
height=corners3d(8,2);
leftx=corners3d(2,1);
rightx=corners3d(5,1);
[corners2d]=getEstimatedVerticesScreeenCoordinates(ctrlPoint);
coord3d=coord2dto3d(coord2d,corners2d,corners3d,m1,n1,f,height,leftx,rightx);
xx=coord3d(:,1);
yy=coord3d(:,2);
zz=coord3d(:,3);
color=coord3d(:,4:6)/255;
axes(handles.axes2);

pcshow([xx yy zz],color,'VerticalAxisDir','Down')
set(gcf,'color','[0.94,0.94,0.94]');
set(gca,'color','[0.94,0.94,0.94]');
view([20, 80]);
% set(gca,'color','w');
center=mean(coord3d,1);
len=size(coord3d,1);

% offset=[-corners2d(1,1) -corners2d(1,2) 0];
offset=-center(1:3);
%rotate 
%find a rotation matrix for the angle
angle_rad=deg2rad(angle);   %assuming the input angle is sent in degrees, we need to convert it to radians
angle_x=angle_rad(1);
angle_y=angle_rad(2);
angle_z=angle_rad(3);
R_x=[1 0 0 ; 0 cos(angle_x) -sin(angle_x) ; 0 sin(angle_x) cos(angle_x)] ;
R_y=[cos(angle_y) 0 sin(angle_y)  ; 0 1 0 ; -sin(angle_y) 0 cos(angle_y) ];
R_z=[cos(angle_z) -sin(angle_z) 0 ; sin(angle_z) cos(angle_z) 0  ; 0 0 1];
R=R_x*R_y*R_z;


coord3d_to_transform=coord3d(:,1:3)'+offset';
coord3d_transformed=R*coord3d_to_transform+translation-offset';
project2d= getScreenCoordinates(coord3d_transformed',coord3d,corners2d(1,1),corners2d(1,2),f);
project2d(:,1)=round(project2d(:,1)*n1);
project2d(:,2)=round(project2d(:,2)*m1);
project2d(:,2)=-project2d(:,2)+m1+1;


img2=NaN(m1,n1,4);
for i=1:len
    idx1=int32(project2d(i,2));
    idx2=int32(project2d(i,1));
    if idx1<=m1 &&idx2<=n1&&idx1>=1 && idx2>=1
        if ~isnan(img2(idx1,idx2,4)) &&img2(idx1,idx2,4)>project2d(i,6)
        img2(idx1,idx2,4)=project2d(i,6);
        img2(idx1,idx2,1:3)=project2d(i,3:5);
        elseif isnan(img2(idx1,idx2,4))
        img2(idx1,idx2,4)=project2d(i,6);
        img2(idx1,idx2,1:3)=project2d(i,3:5);
        end
    end

end
img2=img2(:,:,1:3);
img2=fillmissing(img2,'movmedian',5);
img2=permute(img2,[2 1 3]);
img2=fillmissing(img2,'movmedian',5);
img2=permute(img2,[2 1 3]);
img2=uint8(img2);
img2 = imresize(img2,[m n]);
axes(handles.axes3);
imshow(img2)


% x=coord3d(:,1);
% y=coord3d(:,2);
% z=coord3d(:,3);
% plot3(x,y,z,'.')
% hold on
function [coord3d]=coord2dto3d(coord2d,corners2d,corners3d,m,n,f,height,leftx,rightx)
% % input:
% coord2d: 2d coordinates of all pixels  
% corners2d: 2d coordinates of corners points 
% corners3d: 3d coordinates of corners points 
% m,n: size of image
% f:focal length 
% height: ceil y coordinate 
% leftx: left wall x coordinate
% rightx: right  wall x coordinate
% output:
% coord3: 3d coordinates of all pixels  
% %
coord2d(:,1)=coord2d(:,1)/n;
coord2d(:,2)=coord2d(:,2)/m;


vp=corners3d(1,:);
t1=corners2d(2,:)-vp(1:2);
t2=corners2d(3,:)-vp(1:2);
t7=corners2d(8,:)-vp(1:2);
t8=corners2d(9,:)-vp(1:2);
is_bottom__plane_2= @(point2d) (point2d(2) <= t1(2)) && (point2d(2) <= point2d(1)*t1(2)/t1(1)) && (point2d(2) <= point2d(1)*t2(2)/t2(1));
is_right_plane_2= @(point2d) (point2d(1) >= t2(1)) && (point2d(2) <= point2d(1)*t8(2)/t8(1)) && (point2d(2)>= point2d(1)*t2(2)/t2(1));
is_top_plane_2= @(point2d) (point2d(2)>=t8(2)) && (point2d(2) >= point2d(1)*t8(2)/t8(1)) && (point2d(2)>=point2d(1) * t7(2)/t7(1));
is_left_plane_2=@(point2d) (point2d(1) <= t7(1)) && (point2d(2)<=point2d(1) *t7(2)/t7(1)) && (point2d(2)>=point2d(1)*t1(2)/t1(1) );
is_center_plane_2 = @(point2d)  (point2d(1)<=t2(1)) && (point2d(1) >=t1(1)) && (point2d(2)<=t7(2)) && (point2d(2) >=t1(2));

length=size(coord2d,1);
coord3d=zeros(length,6);
% center_miny=100;
% center_maxy=-1;
for i=1:length
    point2d=coord2d(i,1:2);
    coord3d(i,4:6)=coord2d(i,3:5);
    if is_bottom__plane_2(point2d-vp(1:2))
        coord3d(i,2)=0;
        coord3d(i,3)=-vp(2)/(vp(2)-point2d(2))*f;
        coord3d(i,1)=-coord3d(i,3)/f*(point2d(1)-vp(1))+vp(1);
    elseif is_top_plane_2(point2d-vp(1:2))
        coord3d(i,2)=height;
        coord3d(i,3)=-(vp(2)-height)/(vp(2)-point2d(2))*f;
        coord3d(i,1)=-coord3d(i,3)/f*(point2d(1)-vp(1))+vp(1); 
    elseif is_left_plane_2(point2d-vp(1:2))
        coord3d(i,1)=leftx;
        coord3d(i,3)=-(vp(1)-leftx)/(vp(1)-point2d(1))*f;
        coord3d(i,2)=-coord3d(i,3)/f*(point2d(2)-vp(2))+vp(2);
    elseif is_right_plane_2(point2d-vp(1:2))
        coord3d(i,1)=rightx;
        coord3d(i,3)=-(vp(1)-rightx)/(vp(1)-point2d(1))*f;
        coord3d(i,2)=-coord3d(i,3)/f*(point2d(2)-vp(2))+vp(2);
    elseif is_center_plane_2(point2d-vp(1:2))
        coord3d(i,3)=vp(3);
        coord3d(i,2)=-coord3d(i,3)/f*(point2d(2)-vp(2))+vp(2);
        coord3d(i,1)=-coord3d(i,3)/f*(point2d(1)-vp(1))+vp(1);
%         center_miny=min(center_miny,coord3d(i,2));
%         center_maxy=max(center_maxy,coord3d(i,2));
    
    end
end
end

function  estimatedVertex= getEstimatedVerticesScreeenCoordinates(ctrlPoint)
% % input:
% ctrlPoint: 2d coordinates of vanishing point and box 
% output:
% estimatedVertex: 2d coordinates of all 12 points from the paper and vanishing point
 
% %
 for i = 1:4
      gradient(i)=(ctrlPoint(i+1,2)-ctrlPoint(1,2))/(ctrlPoint(i+1,1)-ctrlPoint(1,1));
 end 
     estimatedVertex(1,1)=ctrlPoint(1,1);
     estimatedVertex(1,2)=ctrlPoint(1,2);


     estimatedVertex(2,1)=ctrlPoint(2,1);
     estimatedVertex(2,2)=ctrlPoint(2,2);
     
     estimatedVertex(3,1)=ctrlPoint(3,1);
     estimatedVertex(3,2)=ctrlPoint(3,2);
     
     estimatedVertex(9,1)=ctrlPoint(4,1);
     estimatedVertex(9,2)=ctrlPoint(4,2);
   
     estimatedVertex(8,1)=ctrlPoint(5,1);
     estimatedVertex(8,2)=ctrlPoint(5,2);

     estimatedVertex(4,1)=(-ctrlPoint(1,2))/gradient(1)+ctrlPoint(1,1);
     estimatedVertex(4,2)=0; estimatedVertex(6,1)=0;
     estimatedVertex(6,2)=(-ctrlPoint(1,1))*gradient(1)+ctrlPoint(1,2);
     estimatedVertex(5,1)=(-ctrlPoint(1,2))/gradient(2)+ctrlPoint(1,1);
     estimatedVertex(5,2)=0; estimatedVertex(7,1)=1;
     estimatedVertex(7,2)=(1-ctrlPoint(1,1))*gradient(2)+ctrlPoint(1,2);
     estimatedVertex(11,1)=(1-ctrlPoint(1,2))/gradient(3)+ctrlPoint(1,1);
     estimatedVertex(11,2)=1; estimatedVertex(13,1)=1;
     estimatedVertex(13,2)=(1-ctrlPoint(1,1))*gradient(3)+ctrlPoint(1,2);
     estimatedVertex(10,1)=(1-ctrlPoint(1,2))/gradient(4)+ctrlPoint(1,1);
     estimatedVertex(10,2)=1; estimatedVertex(12,1)=0;
     estimatedVertex(12,2)=(0-ctrlPoint(1,1)*gradient(4)+ctrlPoint(1,2));
end
end
        
        