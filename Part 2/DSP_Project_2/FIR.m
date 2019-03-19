function varargout = FIR(varargin)
% FIR MATLAB code for FIR.fig
%      FIR, by itself, creates a new FIR or raises the existing
%      singleton*.
%
%      H = FIR returns the handle to a new FIR or the handle to
%      the existing singleton*.
%
%      FIR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FIR.M with the given input arguments.
%
%      FIR('Property','Value',...) creates a new FIR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before FIR_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to FIR_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help FIR

% Last Modified by GUIDE v2.5 10-Dec-2018 01:06:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @FIR_OpeningFcn, ...
                   'gui_OutputFcn',  @FIR_OutputFcn, ...
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


% --- Executes just before FIR is made visible.
function FIR_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to FIR (see VARARGIN)

% Choose default command line output for FIR
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes FIR wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = FIR_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in exit_button.
function exit_button_Callback(hObject, eventdata, handles)
% hObject    handle to exit_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
GUI;


% --- Executes on button press in design_button.
function design_button_Callback(hObject, eventdata, handles)

L = str2double(get(handles.L,'string')); % This is the desired filter length
N = str2double(get(handles.N,'string')); % This is the designed filter length
wc= str2double(get(handles.wc,'string')); % This is the designed filter length
weight_choice=get(handles.weights,'Value');

if (L<N||L<=0||N<=0)
    set(handles.L, 'string', int2str(500));
    set(handles.N, 'string', int2str(400));
elseif (isnan(L) ||isnan(N)||isnan(wc))
    set(handles.L, 'string', int2str(500));
    set(handles.N, 'string', int2str(400));
    set(handles.wc, 'string', int2str(0.25));
end
L = str2double(get(handles.L,'string')); % This is the desired filter length
N = str2double(get(handles.N,'string')); % This is the designed filter length

%disp_choice = get(handles.disp_menu_fir,'Value'); % This the display option linear of logarithmic
weight_choice=get(handles.weights,'Value');

w = linspace(0,pi,L);  % omega
H_desired = w<=wc*pi;  % desired frequency responce




% code of weighted leastsquare 
%{
weights = eye (length(w));
pass_band_length = length(find(H_desired==1)) %  to distribute the weight
stop_band_length = length(w) - pass_band_length %  to distribute the weight

switch weight_choice 
    case 1 %[1 0]
        for i = 1:length(w)
            if i<=pass_band_length
                weight(i,i) = 1/pass_band_length  
            else
                 weight(i,i) = 0 
            end
        end
        
    case 2 %[0.8    0.2]
        for i = 1:length(w)
            if i<=pass_band_length
                weight(i,i) = 0.8/pass_band_length
            else
                 weight(i,i) = 0.2/(stop_band_length)
            end
        end
        
    case 3 %[0.5    0.5]
        for i = 1:length(w)
            if i<=pass_band_length
                weight(i,i) = 0.5/pass_band_length;
            else
                 weight(i,i) = 0.5/(stop_band_length);
            end
        end
        
    case 4 %[0.2    0.8]
        for i = 1:length(w)
            if i<=pass_band_length
                weight(i,i) = 0.8/pass_band_length;
            else
                 weight(i,i) = 0.2/(stop_band_length);
            end
        end
    otherwise
end
%}

F = compute_matrix(L,N); % computing the F matrix   
h_n = compute_cof(F,H_desired); % computing the tabs co_officints  % in case weighted ls compute_cof(F,weights,H_desired);

H_N= freqz(h_n,1,w);

% plotting responses

axes(handles.linear);
plot(w/pi, abs(H_N),'r');
hold on;
plot(w/pi,H_desired,'k');
hold off;
legend ('absolute (H(N)designed)','H(N) desired')

axes(handles.logarithmic);
plot(w/pi, 20*log10(abs(H_N)),'r');
hold on;
plot(w/pi,20*log10(double(H_desired)),'k');
hold off;
legend ('logarithm absolute (H(N)designed)','logarithm H(N) desired')

% least square error
error = H_desired - abs(H_N);
ls_error = error*error';
set(handles.ls_error, 'string', num2str(ls_error));
















% --- Executes on selection change in disp_menu_fir.
function disp_menu_fir_Callback(hObject, eventdata, handles)
% hObject    handle to disp_menu_fir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns disp_menu_fir contents as cell array
%        contents{get(hObject,'Value')} returns selected item from disp_menu_fir


% --- Executes during object creation, after setting all properties.
function disp_menu_fir_CreateFcn(hObject, eventdata, handles)
% hObject    handle to disp_menu_fir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function L_Callback(hObject, eventdata, handles)
% hObject    handle to L (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of L as text
%        str2double(get(hObject,'String')) returns contents of L as a double


% --- Executes during object creation, after setting all properties.
function L_CreateFcn(hObject, eventdata, handles)
% hObject    handle to L (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function N_Callback(hObject, eventdata, handles)
% hObject    handle to N (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of N as text
%        str2double(get(hObject,'String')) returns contents of N as a double


% --- Executes during object creation, after setting all properties.
function N_CreateFcn(hObject, eventdata, handles)
% hObject    handle to N (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function wc_Callback(hObject, eventdata, handles)
% hObject    handle to wc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of wc as text
%        str2double(get(hObject,'String')) returns contents of wc as a double


% --- Executes during object creation, after setting all properties.
function wc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to wc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ls_error_Callback(hObject, eventdata, handles)
% hObject    handle to ls_error (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ls_error as text
%        str2double(get(hObject,'String')) returns contents of ls_error as a double


% --- Executes during object creation, after setting all properties.
function ls_error_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ls_error (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in weights.
function weights_Callback(hObject, eventdata, handles)
% hObject    handle to weights (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns weights contents as cell array
%        contents{get(hObject,'Value')} returns selected item from weights


% --- Executes during object creation, after setting all properties.
function weights_CreateFcn(hObject, eventdata, handles)
% hObject    handle to weights (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
