%%
fs=1000;
ts=1/fs;
t=0:ts:1-ts;
w=2*pi*500;
fn=sin(w*t);
window_time=1.2;
tend=t(end)+ts;
zero_number=length(t(end)+ts:ts:window_time-ts);

t= [t  t(end)+ts:ts:window_time-ts]
c=zeros(1,zero_number);
fnc=[fn c];


%%
if (window_length>length(t))
    t= [t t(end)+ts:ts:window_time-ts]
    x=linspace(t(end)+ts,window_time-ts,(window_time-fn_length)/ts)
    fn=[fn zeros(1,length(x))]
elseif (window_length<length(t))
    window_length=length(t);
end
%%

fn1_c=get(handles.fn_menu_main,'Value');
if(get(handles.file_txt,'string')=="")
else
[input_function sample_rate]= audioread(get(handles.file_txt,'string'));
end
frequency=str2double(get(handles.signal_frequency_main,'string'));
fn_length=str2double(get(handles.function_length_main,'string'));

fs=50;
ts=1/fs;
t=0:ts:fn_length-ts;
w=2*pi*frequency;
switch fn1_c
    case 1
        fn = sin(w*t);
    case 2 
        fn = sinc(w*t);
    case 3 
        fn = ones(1,length(t));
    case 4 
        fs=sample_rate;
        ts=1/fs;
        t=0:ts:fn_length-ts;
        fn = input_function;
    otherwise        
end

window_choice=get(handles.window_menu_main,'Value');
window_time=str2double(get(handles.window_length_main,'string'));
window_length=window_time/ts;


if (window_length>length(t))
        t= [t t(end)+ts:ts:window_time-ts];
        x=linspace(t(end)+ts,window_time-ts,((window_time-fn_length)/ts)+1);
        fn=[fn zeros(1,length(x))];

elseif (window_length<length(t))
    window_length=length(t);
end


switch window_choice
    case 1
        window=ones(1,length(t));            
    case 2 
        %window=triangular;
    case 3 
        window=1-cos(2*pi*t/t(end))
    case 4 
        window = 0.54-0.46*cos(2*pi*t/t(end))
        
        
    otherwise        
end

fn=fn.*window;


display_choice=get(handles.display_options_main,'Value')
n_points=str2double(get(handles.n_fft_choice_main,'string'))
is_NaN= isnan(n_points)

if(get(handles.n_fft_choice_main,'string')=="" || n_points>65536 || n_points<0 || is_NaN)
    n_points=128;
   set(handles.n_fft_choice_main,'string','128')
end


    



switch display_choice
    case 1
        y=fft(fn,n_points);
        axes(handles.fn_axes);
        stem(t,fn);
        freq_range=(0:length(y)-1*fs/length(y));
        grid on;
        axes(handles.display_1_main);
        stem(freq_range,real(y));
        axes(handles.display_2_main);
        stem(freq_range,imag(y));
        
    case 2
        y=fft(fn,n_points);
        axes(handles.fn_axes);
        stem(t,fn);
        freq_range=(0:length(y)-1*fs/length(y));
        grid on;
        axes(handles.display_1_main);
        stem(freq_range,abs(y));
        axes(handles.display_2_main);
        stem(log(freq_range),log(y));
    case 3
        y=fft(fn,n_points);
        axes(handles.fn_axes);
        stem(t,fn);
        freq_range=(0:length(y)-1*fs/length(y));
        grid on;
        axes(handles.display_1_main);
        stem(freq_range,abs(y));
        axes(handles.display_2_main);
        stem(freq_range,unwrap(angle(y)));        
        
    otherwise        
end



%%
fn_c=get(handles.fn_menu_compare,'Value');

fs=5;
ts=1/fs;
t=0:ts:10-ts;
w=2*pi*1;
switch fn_c
    case 1
        fn = sin(w*t);
    case 2 
        fn = sinc(w*t);
    case 3 
        fn = ones(1,length(t));

    otherwise        
end


window_choice_1=get(handles.window_menu_main,'Value');
window_choice_2=get(handles.window_menu_main,'Value');



switch window_choice_1
    case 1
        window_1=ones(1,length(t));            
    case 2 
        %window=triangular;
    case 3 
        window_1=1-cos(2*pi*t/t(end))
    case 4 
        window_1= 0.54-0.46*cos(2*pi*t/t(end))
    otherwise        
end

switch window_choice_2
    case 1
        window_2=ones(1,length(t));            
    case 2 
        %window=triangular;
    case 3 
        window_2=1-cos(2*pi*t/t(end))
    case 4 
        window_2= 0.54-0.46*cos(2*pi*t/t(end))
    otherwise        
end

fn1=fn.*window_1;
fn2=fn.*window_2;

y1=fft(fn1);
y2=fft(fn2);

freq_range=(0:length(t)-1*fs/length(t));

axes(handles.time1_compare);
stem(t,fn1);
grid on;

axes(handles.spectrum1_compare);
stem(freq_range,abs(y1));
grid on;

axes(handles.time2_compare);
stem(t,fn2);
grid on;

axes(handles.spectrum2_compare);
stem(freq_range,abs(y2));
grid on;
