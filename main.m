function varargout = main(varargin)
% main MATLAB code for main.fig
%      main, by itself, creates a new main or raises the existing
%      singleton*.
%
%      H = main returns the handle to a new main or the handle to
%      the existing singleton*.
%
%      main('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in main.M with the given input arguments.
%
%      main('Property','Value',...) creates a new main or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before main_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to main_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help main

% Last Modified by GUIDE v2.5 19-Jul-2022 23:23:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main_OpeningFcn, ...
                   'gui_OutputFcn',  @main_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before main is made visible.
function main_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to main (see VARARGIN)

% Choose default command line output for main
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
axes(handles.axes5);
image = imread('coordsys.png');
imshow(image);
% UIWAIT makes main wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = main_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function ang_x_Callback(hObject, eventdata, handles)
% hObject    handle to ang_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ang_x as text
%        str2double(get(hObject,'String')) returns contents of ang_x as a double


% --- Executes during object creation, after setting all properties.
function ang_x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ang_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ang_y_Callback(hObject, eventdata, handles)
% hObject    handle to ang_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ang_y as text
%        str2double(get(hObject,'String')) returns contents of ang_y as a double


% --- Executes during object creation, after setting all properties.
function ang_y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ang_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function trans_y_Callback(hObject, eventdata, handles)
% hObject    handle to trans_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of trans_y as text
%        str2double(get(hObject,'String')) returns contents of trans_y as a double


% --- Executes during object creation, after setting all properties.
function trans_y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to trans_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function trans_x_Callback(hObject, eventdata, handles)
% hObject    handle to trans_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of trans_x as text
%        str2double(get(hObject,'String')) returns contents of trans_x as a double


% --- Executes during object creation, after setting all properties.
function trans_x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to trans_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ang_z_Callback(hObject, eventdata, handles)
% hObject    handle to ang_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ang_z as text
%        str2double(get(hObject,'String')) returns contents of ang_z as a double


% --- Executes during object creation, after setting all properties.
function ang_z_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ang_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function trans_z_Callback(hObject, eventdata, handles)
% hObject    handle to trans_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of trans_z as text
%        str2double(get(hObject,'String')) returns contents of trans_z as a double


% --- Executes during object creation, after setting all properties.
function trans_z_CreateFcn(hObject, eventdata, handles)
% hObject    handle to trans_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in LoadImage.
function LoadImage_Callback(hObject, eventdata, handles)
% hObject    handle to LoadImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA) 

[filename,pathname] = uigetfile('*.*','Select an Image');%Select an Image in the folder
filename = strcat(pathname,filename);
im = imread(filename);
handles.image=im;
[om,on,cc] = size(im);
handles.sizeim=size(im);
m=om;
n=on;
while max(m,n)>=1000
    m=round(m/2);
    n=round(n/2);
    im = imresize(im,[m n]);
end
% [max_y, max_x, chan] = size(im);
handles.image=im;

guidata(hObject,handles);
axes(handles.axes1);
set(gca,'XColor',get(gca,'Color'));
set(gca,'YColor',get(gca,'Color'));
set(gca,'XTickLabel',[]);
set(gca,'YTickLabel',[]);
global pl_1 pl_2 pl_3 pl_4
imshow(im);
roi = drawrectangle;% create an ROI object(draggable Rectangle)
roipoint= drawpoint('Position',[n/2 m/2]);
handles.rp = roipoint;
handles.ri = roi;

guidata(hObject,handles);
axes(handles.axes1);
  token = round(roi.Position);
  x = [token(1), token(1)+token(3), token(1),token(1)+token(3)]%[x1"upper left",x2"upper right",x3"bottom left", x4 "bottom right"]%return the coordinates in vectors
  y = [token(2), token(2), token(2)+token(4), token(2)+token(4)]%[y1"upper left",y2"upper right",y3"bottom left", y4 "bottom right"]
CPpoint = round(roipoint.Position);
    r = CPpoint(1);
    c =  CPpoint(2);
    handles.x=x;
    handles.y=y;
    handles.r=r;
    handles.c=c;
    guidata(hObject,handles);


function v_f_Callback(hObject, eventdata, handles)
% hObject    handle to v_f (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of v_f as text
%        str2double(get(hObject,'String')) returns contents of v_f as a double


% --- Executes during object creation, after setting all properties.
function v_f_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v_f (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Loadvals.
function Loadvals_Callback(hObject, eventdata, handles)
% hObject    handle to Loadvals (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% angle=[0 0 0]';
% translation=[0 0 0]';
 s_angle_x = get(handles.ang_x,'String');%set the angles for 3 different axis
s_angle_y = get(handles.ang_y,'String');
s_angle_z= get(handles.ang_z,'String');
s_trans_x = get(handles.trans_x,'String');%set the translation for 3 different axis
s_trans_y = get(handles.trans_y,'String');
s_trans_z = get(handles.trans_z,'String');
s_f = get(handles.v_f,'String');
angle_x = str2num(s_angle_x);
angle_y = str2num(s_angle_y);
angle_z = str2num(s_angle_z);
trans_x = str2num(s_trans_x);
trans_y = str2num(s_trans_y);
trans_z = str2num(s_trans_z);
focus = str2num(s_f);
angle=[ angle_x angle_y angle_z]';
translation=[trans_x trans_y trans_z]';
handles.f= focus;
sizeim=handles.sizeim;
om=sizeim(1);
on=sizeim(2);
test(handles,handles.image,handles.xfinal,handles.yfinal,handles.rfinal,handles.cfinal,om,on,angle,translation,handles.f);


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

im = handles.image;% an reset button basically a do-over

[om,on,cc] = size(im);
handles.sizeim=size(im);
m=om;
n=on;
while max(m,n)>=1000
    m=round(m/2);
    n=round(n/2);
    im = imresize(im,[m n]);
end
% [max_y, max_x, chan] = size(im);
handles.image=im;

guidata(hObject,handles);
axes(handles.axes1);
global pl_1 pl_2 pl_3 pl_4
imshow(im);
roi = drawrectangle;
roipoint= drawpoint('Position',[n/2 m/2]);
handles.rp = roipoint;
handles.ri = roi;

guidata(hObject,handles);
axes(handles.axes1);
  token = round(roi.Position);
  x = [token(1), token(1)+token(3), token(1),token(1)+token(3)]%[x1"upper left",x2"upper right",x3"bottom left", x4 "bottom right"]
  y = [token(2), token(2), token(2)+token(4), token(2)+token(4)]%[y1"upper left",y2"upper right",y3"bottom left", y4 "bottom right"]
CPpoint = round(roipoint.Position);
    r = CPpoint(1);
    c =  CPpoint(2);
    handles.x=x;
    handles.y=y;
    handles.r=r;
    handles.c=c;
    guidata(hObject,handles);


% --- Executes on button press in setpoints.
function setpoints_Callback(hObject, eventdata, handles)
% hObject    handle to setpoints (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
token = round(handles.ri.Position);
CPpoint = round(handles.rp.Position);

x = [token(1), token(1)+token(3), token(1),token(1)+token(3)]%[x1"upper left",x2"upper right",x3"bottom left", x4 "bottom right"]
y = [token(2), token(2), token(2)+token(4), token(2)+token(4)]%[y1"upper left",y2"upper right",y3"bottom left", y4 "bottom right"]

    r = CPpoint(1);
    c =  CPpoint(2);
handles.xfinal=x;
handles.yfinal=y;
handles.rfinal=r;
handles.cfinal=c;
guidata(hObject,handles);
msgbox('Already Set!');




% --- Executes on button press in drawline.
function drawline_Callback(hObject, eventdata, handles)
% hObject    handle to drawline (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
token = round(handles.ri.Position);
CPpoint = round(handles.rp.Position);
    r = CPpoint(1);
    c =  CPpoint(2);

x = [token(1), token(1)+token(3), token(1),token(1)+token(3)]%[x1"upper left",x2"upper right",x3"bottom left", x4 "bottom right"]
y = [token(2), token(2), token(2)+token(4), token(2)+token(4)]%[y1"upper left",y2"upper right",y3"bottom left", y4 "bottom right"]


irx = [x(1) x(4) x(4) x(1) x(1)];
     iry = [y(1) y(1) y(4) y(4) y(1)];
     [max_y, max_x, chan] = size(handles.image);
% %      vp_x = r; 
% %      vp_y= c;                          
    cpx = [0 0 0 0];
    cpy = [0 0 0 0];
    vp_x = r; 
    vp_y = c;
    if vp_x<x(1) || vp_x>x(2) || vp_y<y(1) || vp_y > y(3) %make sure the vanishing point is in the rectangle
         warning('Watch where you place the point Rookie');
  
    end

    [cpx(1), cpy(1)] = compute_corner(vp_x, vp_y, irx(1), iry(1), 1, 1); 
    [cpx(2), cpy(2)] = compute_corner(vp_x, vp_y, irx(2), iry(2), max_x, 1); 
    [cpx(3), cpy(3)] = compute_corner(vp_x, vp_y, irx(3), iry(3), max_x, max_y); 
    [cpx(4), cpy(4)] = compute_corner(vp_x, vp_y, irx(4), iry(4), 1, max_y); 
      
%         x = [60 160 60 160];
%         y = [90 90 40 40];
%  plot(0,0);
global pl_1 pl_2 pl_3 pl_4
        delete(pl_1);
        delete(pl_2);
        delete(pl_3);
        delete(pl_4);
        hold on 
        
       pl_1=  plot([vp_x cpx(1)],[vp_y cpy(1)],'b','LineWidth',1);
       pl_2=   plot([vp_x cpx(2)],[vp_y cpy(2)],'b','LineWidth',1);
        pl_3=  plot([vp_x cpx(3)],[vp_y cpy(3)],'b','LineWidth',1);
       pl_4=   plot([vp_x cpx(4)],[vp_y cpy(4)],'b','LineWidth',1);
        
%         a=plot([x(1),CP],[y(1),RP],'LineStyle', '-', 'LineWidth', 1, 'Color', 'Blue');%plot the spidery mesh
%         b=plot([x(2),CP],[y(2),RP],'LineStyle', '-', 'LineWidth', 1, 'Color', 'Blue');
%         c=plot([x(3),CP],[y(3),RP],'LineStyle', '-', 'LineWidth', 1, 'Color', 'Blue');
%         d=plot([x(4),CP],[y(4),RP],'LineStyle', '-', 'LineWidth', 1, 'Color', 'Blue');
       hold off

       


% --- Executes during object creation, after setting all properties.
function axes5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes5
