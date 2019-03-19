function varargout = sa_GUI(varargin)
%SA_GUI MATLAB code file for sa_GUI.fig
%      SA_GUI, by itself, creates a new SA_GUI or raises the existing
%      singleton*.
%
%      H = SA_GUI returns the handle to a new SA_GUI or the ehandle to
%      the existing singleton*.
%
%      SA_GUI('Property','Value',...) creates a new SA_GUI using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to sa_GUI_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      SA_GUI('CALLBACK') and SA_GUI('CALLBACK',hObject,...) call the
%      local function named CALLBACK in SA_GUI.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help sa_GUI

% Last Modified by GUIDE v2.5 17-Nov-2018 15:53:48

% Begin initialization code - DO NOT EDIT







gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @sa_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @sa_GUI_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before sa_GUI is made visible.
function sa_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for sa_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes sa_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = sa_GUI_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in main_mode.
function main_mode_Callback(hObject, eventdata, handles)
% hObject    handle to main_mode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


set(findall(handles.main_panel,'-property','enable'),'enable', 'on');
set(handles.main_panel,'visible','on');
set(findall(handles.comparison_panel,'-property','enable'),'enable', 'off');
set(handles.comparison_panel,'visible','off');
set(findall(handles.calc_panel,'-property','enable'),'enable', 'off');
set(handles.calc_panel,'visible','off');
set(handles.text6,'visible','off');


% --- Executes on button press in comp_mode.
function comp_mode_Callback(hObject, eventdata, handles)
% hObject    handle to comp_mode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


set(findall(handles.main_panel,'-property','enable'),'enable', 'off');
set(handles.main_panel,'visible','off');
set(findall(handles.comparison_panel,'-property','enable'),'enable', 'on');
set(handles.comparison_panel,'visible','on');
set(findall(handles.calc_panel,'-property','enable'),'enable', 'off');
set(handles.calc_panel,'visible','off');
set(handles.text6,'visible','off');


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in calc_mode.
function calc_mode_Callback(hObject, eventdata, handles)
% hObject    handle to calc_mode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(findall(handles.main_panel,'-property','enable'),'enable', 'off');
set(handles.main_panel,'visible','off');
set(findall(handles.comparison_panel,'-property','enable'),'enable', 'off');
set(handles.comparison_panel,'visible','off');
set(findall(handles.calc_panel,'-property','enable'),'enable', 'on');
set(handles.calc_panel,'visible','on');
set(handles.text6,'visible','off');



function file_txt_Callback(hObject, eventdata, handles)
% hObject    handle to file_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of file_txt as text
%        str2double(get(hObject,'String')) returns contents of file_txt as a double


% --- Executes during object creation, after setting all properties.
function file_txt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to file_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in input_btn.
function input_btn_Callback(hObject, eventdata, handles)
% hObject    handle to input_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[file_name,path] = uigetfile({'*.wav'},'File Selector');
full_path= strcat(path,file_name);
set(handles.file_txt,'string',full_path);


% --- Executes on selection change in fn_menu_main.
function fn_menu_main_Callback(hObject, eventdata, handles)
% hObject    handle to fn_menu_main (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns fn_menu_main contents as cell array
%        contents{get(hObject,'Value')} returns selected item from fn_menu_main


% --- Executes during object creation, after setting all properties.
function fn_menu_main_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fn_menu_main (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in main_spectrum_btn.
function main_spectrum_btn_Callback(hObject, eventdata, handles)

fn1_c=get(handles.fn_menu_main,'Value');
if(get(handles.file_txt,'string')=="")
else
[input_function ,sample_rate]= audioread(get(handles.file_txt,'string'));  % function that returns the input function in an array and the sampling rate
end

% Fetching the data from the user
% I am taking the absolute to avoid any negative input from the user

frequency=abs(str2double(get(handles.signal_frequency_main,'string'))); % this is the signal frequency
sampling_frequency=abs(str2double(get(handles.sampling_freq_main,'string'))); % Sam
window_choice=get(handles.window_menu_main,'Value'); % a value to decide which window should i apply to the function
window_time=abs(str2double(get(handles.window_length_main,'string'))); % Defining the length of the window in seconds


fs=sampling_frequency;
ts=1/fs; % sampling time
t=0:ts:window_time-ts; % array of time with a step ts 
w=2*pi*frequency; % omega
window_length=window_time/ts;

switch fn1_c
    case 1
        % Those three lines of code are used to reenable the user to input
        % parameters in case he chose something other than the audio file
        set(handles.sampling_freq_main, 'enable', 'on')
        set(handles.signal_frequency_main, 'enable', 'on')
        set(handles.window_length_main, 'enable', 'on')
        
        fn = sin(w*t);
     
    case 2
        
        set(handles.sampling_freq_main, 'enable', 'on')
        set(handles.signal_frequency_main, 'enable', 'on')
        set(handles.window_length_main, 'enable', 'on')
        
        fn = sinc(w*t);


    
    case 3
        
        set(handles.sampling_freq_main, 'enable', 'on')
        set(handles.signal_frequency_main, 'enable', 'on')
        set(handles.window_length_main, 'enable', 'on')
        
        fn = ones(1,length(t));
        
    case 4 
        % In case the user really chose a file
        if(get(handles.file_txt,'string')~="")
            fs=sample_rate; % redefining the sampling frequency as the audio frequency (I used the function audioread to know it )
            ts=1/fs; % redefinin ts
            t=0:ts:5;   % always taking 5 seconds of the input audio to operate on
            fn = (input_function(1:length(t)))'; % transposing the input function as it comes as a column vector
            set(handles.window_length_main, 'string', int2str(t(end))) % setting the edit text of the window length to 5 seconds
            set(handles.sampling_freq_main, 'string', int2str(sample_rate)) % setting the sampling frequency as the sample_rate to make the user know it
           
            % disabling those 3 fields to prevent the user from editing
            % them whenever he is viewing the 
            set(handles.sampling_freq_main, 'enable', 'off');  
            set(handles.signal_frequency_main, 'enable', 'off');
            set(handles.window_length_main, 'enable', 'off');
            
        else
            % In case the user chose input_function choice and the file
            % name is empty i will turn it to the defult sin function
            fn = sin(w*t);   
        end
    otherwise        
end




% Determining which window to apply depending on the user's choice

% window_decision is a function that i wrote that returns the window that
% will be applied on the function

window = window_decision(window_choice,t,window_time);


fn=fn.*window; % Applying window chosen to the function chosen

% Determining  N
n_points_choice=get(handles.N_point_fft_choice_main,'Value'); % user's choice of the menu of DFT points 
n_points=n_points_decision(n_points_choice, fn);  % Number of DFT points 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Determining the Display 
% Either (Linear & Logarithmic) - (Real and Imaginary) - (magnitude and phase)
display_choice=get(handles.display_options_main,'Value');  % user's choice from the Display menu 

y=fft(fn,n_points);
axes(handles.fn_axes);
stem(t,fn);
freq_range=0:fs/length(y):fs-fs/length(y);  % scaling the m to have a maximum of sampling frequency
grid on;
xlabel('t[n]');
ylabel('f(n)');

switch display_choice
    case 1 % (Linear & Logarithmic)
        axes(handles.display_1_main);
        stem(freq_range,abs(y));
        grid on;
        title("linear")
        xlabel('t[n]');
        ylabel('(y(f))');
        
        axes(handles.display_2_main);
        stem(freq_range,(20*log10(abs(y))));  % taking the log of y
        grid on;
        title("logarithmic")
        xlabel('t[n]');
        ylabel('20*log(y(f))');
        
    case 2 % (real & imaginary)
        axes(handles.display_1_main);
        stem(freq_range,real(y));  % real of y
        grid on;
        xlabel('t[n]');
        ylabel('real(y(f))');
        title("real");
        
        axes(handles.display_2_main);
        stem(freq_range,imag(y)); % imaginary of y
        grid on;
        title("Imaginary");
        xlabel('f');
        ylabel('imaginary(y(f))');
        
        
    case 3 % (magnitude & phase)
        
        axes(handles.display_1_main);
        stem(freq_range,abs(y)); % magnitude of y
        grid on;
        title("Magnitude");
        xlabel('f');
        ylabel('y(f)');
        axes(handles.display_2_main);
        stem(freq_range,unwrap(angle(y)));  % phase of y  and unwraping the anglse to avoid periodiciy of 2*Pi 
        grid on;
        title("Phase");
        xlabel('f');
        ylabel('phase(y(f))');
    otherwise
end

% --- Executes on button press in compare_button.
function compare_button_Callback(hObject, eventdata, handles)

% determining the user's choice of the function
fn_c=get(handles.fn_menu_compare,'Value');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fetching the parameters 
% I took the absolute to error handle any negative input
window1_time=abs(str2double(get(handles.window1_length_comparison,'string'))); % Window 1 duration
window2_time=abs(str2double(get(handles.window2_length_comparison,'string'))); % Window 2 duration
sampling_frequency=abs(str2double(get(handles.sampling_freq_comparison,'string'))); % sampling frequency
signal_frequency=abs(str2double(get(handles.signal_freq_comparison,'string'))); % signal_frequency


fs=sampling_frequency;  % sampling frequency
ts=1/fs;                % sampling time
w=2*pi*signal_frequency; %omega

t1=0:ts:window1_time-ts;  % time of window 1
t2=0:ts:window2_time-ts;  % time of window 2

%%%%%%%%%%%%%%%%%%%%%%%%%
% Windowing

window_choice_1=get(handles.window_list_1_compare,'Value'); % user's choice of window 1
window_choice_2=get(handles.window_list_2_compare,'Value'); % user's choice of window 2

window_1=window_decision(window_choice_1,t1,window1_time); % window 1
window_2=window_decision(window_choice_2,t2,window2_time); % window 2

% function_decision is a function that i made that returns a function with
% certain length
fn1=function_decision(fn_c,w,t1);  % This is the function that the user chose but with a time of window 1
fn2=function_decision(fn_c,w,t2);  % Same function but with time of window 2

fn1=fn1.*window_1;  % Applying the first window
fn2=fn2.*window_2;  % Applying the second window

%%%%%%%%%%%%%%%%%%%%
% N-DFT

% Knowing the user's choice of N of each window
n_points1_choice=get(handles.n_fft_choice1_compare,'Value');
n_points2_choice=get(handles.n_fft_choice2_compare,'Value');

% Determining the number of point of the N-DFT that will be applied on each
% window
n_points_1=n_points_decision(n_points1_choice,fn1);
n_points_2=n_points_decision(n_points2_choice,fn2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Doing the fft on each funtion

y1=fft(fn1,n_points_1);  % output of fft with N(1)-DFT
y2=fft(fn2,n_points_2);  % output of fft with N(2)-DFT   

freq_range_1=0:fs/length(y1):fs-fs/length(y1);  
freq_range_2=0:fs/length(y2):fs-fs/length(y2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plotting results

axes(handles.time1_compare);  % Plotting the function under the window 1 in time domain
stem(t1,fn1);
grid on;
title("Time domain");
xlabel('t[n]');
ylabel('y1(n)');

axes(handles.spectrum1_compare);  % Plotting the fft of the function under the window 1 in frequency domain
stem(freq_range_1,abs(y1));
grid on;
xlabel('frequency');
ylabel('Y2(f)');

axes(handles.time2_compare);    % Plotting the function under the window 2 in time domain
stem(t2,fn2);
grid on;
title("Time domain");
xlabel('t[n]');
ylabel('y2(n)');

axes(handles.spectrum2_compare); % Plotting the fft of the function under the window 2 in frequency domain
stem(freq_range_2,abs(y2));      
grid on;
xlabel('frequency');
ylabel('Y2(f)');




% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in fn_menu_compare.
function fn_menu_compare_Callback(hObject, eventdata, handles)
% hObject    handle to fn_menu_compare (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns fn_menu_compare contents as cell array
%        contents{get(hObject,'Value')} returns selected item from fn_menu_compare


% --- Executes during object creation, after setting all properties.
function fn_menu_compare_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fn_menu_compare (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in window_list_1_compare.
function window_list_1_compare_Callback(hObject, eventdata, handles)
% hObject    handle to window_list_1_compare (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns window_list_1_compare contents as cell array
%        contents{get(hObject,'Value')} returns selected item from window_list_1_compare


% --- Executes during object creation, after setting all properties.
function window_list_1_compare_CreateFcn(hObject, eventdata, handles)
% hObject    handle to window_list_1_compare (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in window_list_2_compare.
function window_list_2_compare_Callback(hObject, eventdata, handles)
% hObject    handle to window_list_2_compare (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns window_list_2_compare contents as cell array
%        contents{get(hObject,'Value')} returns selected item from window_list_2_compare


% --- Executes during object creation, after setting all properties.
function window_list_2_compare_CreateFcn(hObject, eventdata, handles)
% hObject    handle to window_list_2_compare (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in n_fft_comparison.
function n_fft_comparison_Callback(hObject, eventdata, handles)
% hObject    handle to n_fft_comparison (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns n_fft_comparison contents as cell array
%        contents{get(hObject,'Value')} returns selected item from n_fft_comparison


% --- Executes during object creation, after setting all properties.
function n_fft_comparison_CreateFcn(hObject, eventdata, handles)
% hObject    handle to n_fft_comparison (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in window_menu_main.
function window_menu_main_Callback(hObject, eventdata, handles)
% hObject    handle to window_menu_main (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns window_menu_main contents as cell array
%        contents{get(hObject,'Value')} returns selected item from window_menu_main


% --- Executes during object creation, after setting all properties.
function window_menu_main_CreateFcn(hObject, eventdata, handles)
% hObject    handle to window_menu_main (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function window_length_main_Callback(hObject, eventdata, handles)
% hObject    handle to window_length_main (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of window_length_main as text
%        str2double(get(hObject,'String')) returns contents of window_length_main as a double


% --- Executes during object creation, after setting all properties.
function window_length_main_CreateFcn(hObject, eventdata, handles)
% hObject    handle to window_length_main (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in N_dft_choice_main.
function N_dft_choice_main_Callback(hObject, eventdata, handles)
% hObject    handle to N_dft_choice_main (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns N_dft_choice_main contents as cell array
%        contents{get(hObject,'Value')} returns selected item from N_dft_choice_main


% --- Executes during object creation, after setting all properties.
function N_dft_choice_main_CreateFcn(hObject, eventdata, handles)
% hObject    handle to N_dft_choice_main (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
    


% --- Executes on selection change in display_options_main.
function display_options_main_Callback(hObject, eventdata, handles)
% hObject    handle to display_options_main (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns display_options_main contents as cell array
%        contents{get(hObject,'Value')} returns selected item from display_options_main


% --- Executes during object creation, after setting all properties.
function display_options_main_CreateFcn(hObject, eventdata, handles)
% hObject    handle to display_options_main (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function signal_frequency_main_Callback(hObject, eventdata, handles)
% hObject    handle to signal_frequency_main (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of signal_frequency_main as text
%        str2double(get(hObject,'String')) returns contents of signal_frequency_main as a double


% --- Executes during object creation, after setting all properties.
function signal_frequency_main_CreateFcn(hObject, eventdata, handles)
% hObject    handle to signal_frequency_main (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sampling_freq_main_Callback(hObject, eventdata, handles)
% hObject    handle to sampling_freq_main (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sampling_freq_main as text
%        str2double(get(hObject,'String')) returns contents of sampling_freq_main as a double


% --- Executes during object creation, after setting all properties.
function sampling_freq_main_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sampling_freq_main (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function n_fft_choice_main_Callback(hObject, eventdata, handles)
% hObject    handle to n_fft_choice_main (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of n_fft_choice_main as text
%        str2double(get(hObject,'String')) returns contents of n_fft_choice_main as a double


% --- Executes during object creation, after setting all properties.
function n_fft_choice_main_CreateFcn(hObject, eventdata, handles)
% hObject    handle to n_fft_choice_main (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in function2_compare.
function function2_compare_Callback(hObject, eventdata, handles)
% hObject    handle to function2_compare (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns function2_compare contents as cell array
%        contents{get(hObject,'Value')} returns selected item from function2_compare


% --- Executes during object creation, after setting all properties.
function function2_compare_CreateFcn(hObject, eventdata, handles)
% hObject    handle to function2_compare (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function window1_length_comparison_Callback(hObject, eventdata, handles)
% hObject    handle to window1_length_comparison (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of window1_length_comparison as text
%        str2double(get(hObject,'String')) returns contents of window1_length_comparison as a double


% --- Executes during object creation, after setting all properties.
function window1_length_comparison_CreateFcn(hObject, eventdata, handles)
% hObject    handle to window1_length_comparison (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sampling_freq_comparison_Callback(hObject, eventdata, handles)
% hObject    handle to sampling_freq_comparison (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sampling_freq_comparison as text
%        str2double(get(hObject,'String')) returns contents of sampling_freq_comparison as a double


% --- Executes during object creation, after setting all properties.
function sampling_freq_comparison_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sampling_freq_comparison (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in n_fft_choice1_compare.
function n_fft_choice1_compare_Callback(hObject, eventdata, handles)
% hObject    handle to n_fft_choice1_compare (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns n_fft_choice1_compare contents as cell array
%        contents{get(hObject,'Value')} returns selected item from n_fft_choice1_compare


% --- Executes during object creation, after setting all properties.
function n_fft_choice1_compare_CreateFcn(hObject, eventdata, handles)
% hObject    handle to n_fft_choice1_compare (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in N_point_fft_choice_main.
function N_point_fft_choice_main_Callback(hObject, eventdata, handles)
% hObject    handle to N_point_fft_choice_main (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns N_point_fft_choice_main contents as cell array
%        contents{get(hObject,'Value')} returns selected item from N_point_fft_choice_main


% --- Executes during object creation, after setting all properties.
function N_point_fft_choice_main_CreateFcn(hObject, eventdata, handles)
% hObject    handle to N_point_fft_choice_main (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function window2_length_comparison_Callback(hObject, eventdata, handles)
% hObject    handle to window2_length_comparison (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of window2_length_comparison as text
%        str2double(get(hObject,'String')) returns contents of window2_length_comparison as a double


% --- Executes during object creation, after setting all properties.
function window2_length_comparison_CreateFcn(hObject, eventdata, handles)
% hObject    handle to window2_length_comparison (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in n_fft_choice2_compare.
function n_fft_choice2_compare_Callback(hObject, eventdata, handles)
% hObject    handle to n_fft_choice2_compare (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns n_fft_choice2_compare contents as cell array
%        contents{get(hObject,'Value')} returns selected item from n_fft_choice2_compare


% --- Executes during object creation, after setting all properties.
function n_fft_choice2_compare_CreateFcn(hObject, eventdata, handles)
% hObject    handle to n_fft_choice2_compare (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function signal_freq_comparison_Callback(hObject, eventdata, handles)
% hObject    handle to signal_freq_comparison (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of signal_freq_comparison as text
%        str2double(get(hObject,'String')) returns contents of signal_freq_comparison as a double


% --- Executes during object creation, after setting all properties.
function signal_freq_comparison_CreateFcn(hObject, eventdata, handles)
% hObject    handle to signal_freq_comparison (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in exit_button.
function exit_button_Callback(hObject, eventdata, handles)
% hObject    handle to exit_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
GUI;
