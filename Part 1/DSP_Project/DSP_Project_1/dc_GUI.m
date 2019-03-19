function varargout = dc_GUI(varargin)
% DC_GUI MATLAB code for dc_GUI.fig
%      DC_GUI, by itself, creates a new DC_GUI or raises the existing
%      singleton*.
%
%      H = DC_GUI returns the handle to a new DC_GUI or the handle to
%      the existing singleton*.
%
%      DC_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DC_GUI.M with the given input arguments.
%
%      DC_GUI('Property','Value',...) creates a new DC_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before dc_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to dc_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help dc_GUI

% Last Modified by GUIDE v2.5 17-Nov-2018 19:06:20

% Begin initialization code - DO NOT EDIT
clc


gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @dc_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @dc_GUI_OutputFcn, ...
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


% --- Executes just before dc_GUI is made visible.
function dc_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to dc_GUI (see VARARGIN)

% Choose default command line output for dc_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes dc_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = dc_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on selection change in fn1_menu.
function fn1_menu_Callback(hObject, eventdata, handles)
% hObject    handle to fn1_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns fn1_menu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from fn1_menu


% --- Executes during object creation, after setting all properties.
function fn1_menu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fn1_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in fn2_menu.
function fn2_menu_Callback(hObject, eventdata, handles)
% hObject    handle to fn2_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns fn2_menu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from fn2_menu


% --- Executes during object creation, after setting all properties.
function fn2_menu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fn2_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


fs=50;   % This is my default sampling rate
ts=1/fs; % Sampling time

A1=abs(str2double(get(handles.Amp1,'string')));  % Amplitude of the first function
A2=abs(str2double(get(handles.Amp2,'string')));  % Amplitude of the second function

period_1=abs(str2double(get(handles.Per1,'string')));    % Time duration of function 1
period_2=abs(str2double(get(handles.Per2,'string')));    % Time duration of function 2

% Defining the first perid as an arry with step ts (sampling time)
switch period_1
    case 0
         t1=0:ts:1-ts;
         set(handles.Per1,'string',"1")
    otherwise
        t1=0:ts:abs(period_1)-ts;
        
end

% Defining the second perid as an arry with step ts (sampling time) 
switch period_2
    case 0
        t2=0:ts:1-ts;
        set(handles.Per2,'string',"1")
    otherwise
        t2=0:ts:abs(period_2)-ts;
end

% Getting some constants to determine the function to be convoloved
fn1_c=get(handles.fn1_menu,'Value');
fn2_c=get(handles.fn2_menu,'Value');

% Defining the function that will be convoloved
switch fn1_c
    case 1
        fn1 = sin(2*pi*t1);  % sin(wt)
    case 2 
        fn1 = cos(2*pi*t1);  % cos (wt)
    case 3 
        fn1 = ones(1,length(t1)); % Rectangular pulse
    case 4 
        fn1 = sinc(2*pi*t1); % sinc(wt)    
    otherwise
        
end
switch fn2_c
    case 1
        fn2 = sin(2*pi*t2);   % sin(wt)
    case 2 
        fn2 = cos(2*pi*t2);  % cos (wt)
    case 3 
        fn2 = ones(1,length(t2)); % Rectangular pulse
    case 4 
        fn2 = sinc(2*pi*t2); % sinc(wt)
    otherwise
end


% Defining the amplitide of the functions
switch A1
    case 0
    otherwise
        fn1=A1*fn1;   % Multiplying the input amplitude 1 with function 1
end

switch A2
    case 0
    otherwise
        fn2=A2*fn2;
end



% Plotting Function 1
axes(handles.f1);
stem(t1,fn1);
grid on;
xlabel('t[n]');
ylabel('y1[n]');

% Plotting Function 2
axes(handles.f2);
stem(t2,fn2);
grid on;
xlabel('t[n]');
ylabel('f2[n]');

% Plotting the Convolution
axes(handles.convolution);
stem(0:ts:(length(fn1)+length(fn2)-2)*ts,conv(fn1,fn2));
grid on;
xlabel('t[n]');
ylabel('f1[n]');
title('Convolution');


% Animation Part

y = conv(fn1,fn2); % Resulting array of y1

% flipping the array of function 1 and the zero padding till it equals
% length of y
fn1= fliplr([fn1 zeros(1,(max(length(fn1),length(fn2))))]);  
fn2_animation= [fn2 zeros(1,(max(length(fn1),length(fn2)))/2)]; % Doing the same as Function 1

for i = 1:length(y)
fn1i = circshift(fn1,i,2);  % moving the function 1 to animate convolution
disp(fn1i)

% Plotting the moving function 1
axes(handles.animation)
stem(0:ts:length(fn1i)*ts-ts,fn1i,'filled','r');
xlabel('t[n]');
ylabel('y1[n]');

% Plotting Function 2
axes(handles.animation2)
stem(0:ts:length(fn2_animation)*ts-ts,fn2_animation);
xlabel('t[n]');
ylabel('y2[n]');

% Plotting the convolution after each shift of Function 1
axes(handles.animation3)
stem(0:ts:length(y(1:i))*ts-ts,y(1:i));  % Plotting the updated version of the convolution
xlabel('t[n]');
ylabel('y[n]');
pause on 
pause (.05)    % I chose that each shift should happen after 0.05 seconds 
end



function Amp1_Callback(hObject, eventdata, handles)
% hObject    handle to Amp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Amp1 as text
%        str2double(get(hObject,'String')) returns contents of Amp1 as a double


% --- Executes during object creation, after setting all properties.
function Amp1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Amp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Per1_Callback(hObject, eventdata, handles)
% hObject    handle to Per1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Per1 as text
%        str2double(get(hObject,'String')) returns contents of Per1 as a double


% --- Executes during object creation, after setting all properties.
function Per1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Per1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Pow1_Callback(hObject, eventdata, handles)
% hObject    handle to Pow1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Pow1 as text
%        str2double(get(hObject,'String')) returns contents of Pow1 as a double


% --- Executes during object creation, after setting all properties.
function Pow1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Pow1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Amp2_Callback(hObject, eventdata, handles)
% hObject    handle to Amp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Amp2 as text
%        str2double(get(hObject,'String')) returns contents of Amp2 as a double


% --- Executes during object creation, after setting all properties.
function Amp2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Amp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Per2_Callback(hObject, eventdata, handles)
% hObject    handle to Per2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Per2 as text
%        str2double(get(hObject,'String')) returns contents of Per2 as a double


% --- Executes during object creation, after setting all properties.
function Per2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Per2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Pow2_Callback(hObject, eventdata, handles)
% hObject    handle to Pow2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Pow2 as text
%        str2double(get(hObject,'String')) returns contents of Pow2 as a double


% --- Executes during object creation, after setting all properties.
function Pow2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Pow2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Exit_btn.
function Exit_btn_Callback(hObject, eventdata, handles)
% hObject    handle to Exit_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
GUI;
