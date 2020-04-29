function varargout = task0(varargin)
%TASK0 MATLAB code file for task0.fig
%      TASK0, by itself, creates a new TASK0 or raises the existing
%      singleton*.
%
%      H = TASK0 returns the handle to a new TASK0 or the handle to
%      the existing singleton*.
%
%      TASK0('Property','Value',...) creates a new TASK0 using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to task0_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      TASK0('CALLBACK') and TASK0('CALLBACK',hObject,...) call the
%      local function named CALLBACK in TASK0.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose 'GUI allows only one
%      instance to run (singleton)'.
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help task0

% Last Modified by GUIDE v2.5 29-Apr-2020 11:36:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @task0_OpeningFcn, ...
                   'gui_OutputFcn',  @task0_OutputFcn, ...
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


% --- Executes just before task0 is made visible.
function task0_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for task0
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes task0 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = task0_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in clear.
function clear_Callback(hObject, eventdata, handles)
% hObject    handle to clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.warning,'String','');
set(handles.height,'String','');
set(handles.weight,'String','');
set(handles.result,'String','');
set(handles.yourbmi,'String','');
set(handles.name,'String','');
set(handles.comment,'String','');
set(handles.menu1,'Value',1);
set(handles.menu2,'Value',1);



function height_Callback(hObject, eventdata, handles)
% hObject    handle to height (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of height as text
%        str2double(get(hObject,'String')) returns contents of height as a double


% --- Executes during object creation, after setting all properties.
function height_CreateFcn(hObject, eventdata, handles)
% hObject    handle to height (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in menu1.
function menu1_Callback(hObject, eventdata, handles)
% hObject    handle to menu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
flag1 = get(handles.menu1,'Value');
setappdata(0,'flag_1',flag1);
% Hints: contents = cellstr(get(hObject,'String')) returns menu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from menu1


% --- Executes during object creation, after setting all properties.
function menu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to menu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function weight_Callback(hObject, eventdata, handles)
% hObject    handle to weight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of weight as text
%        str2double(get(hObject,'String')) returns contents of weight as a double


% --- Executes during object creation, after setting all properties.
function weight_CreateFcn(hObject, eventdata, handles)
% hObject    handle to weight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in calculate.
function calculate_Callback(hObject, eventdata, handles)
% hObject    handle to calculate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.warning,'String','');
flag1 = get(handles.menu1,'Value');
flag2 = get(handles.menu2,'Value');
if flag1 == 1 || flag2 == 1
    set(handles.warning,'String','*Atleast choose the system');

elseif flag1 == 2 && flag2 == 2
    w = get(handles.weight,'String');
    h = get(handles.height,'String');
    w = str2num(w);
    h = str2num(h);
    ans = (w*703)/(h^2);
    set(handles.result,'String',ans);
    set(handles.yourbmi,'String',ans);
    
    

    if ans >= 18.5 && ans < 25.0
        set(handles.comment,'String','Normal Weight');
    elseif ans >= 25 && ans < 30.0
        set(handles.comment,'String','Overweight');
    elseif ans >= 30.0
        set(handles.comment,'String','Obese');
    elseif ans < 18.5
        set(handles.comment,'String','Underweight');
    
    end

elseif flag1 == 3 && flag2 == 3
    w = get(handles.weight,'String');
    h = get(handles.height,'String');
    w = str2num(w);
    h = str2num(h);
    ans = (w)/(h^2);
    set(handles.result,'String',ans);
    set(handles.yourbmi,'String',ans);
    
    if ans >= 18.5 && ans < 25.0
        set(handles.comment,'String','Normal Weight');
    elseif ans >= 25 && ans < 30.0
        set(handles.comment,'String','Overweight');
    elseif ans >= 30.0
        set(handles.comment,'String','Obese');
    elseif ans < 18.5
        set(handles.comment,'String','Underweight');
    
    end
elseif flag1 ~= flag2 
    set(handles.warning,'String','*Choose a single system');
    
    
    
end




function result_Callback(hObject, eventdata, handles)
% hObject    handle to result (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of result as text
%        str2double(get(hObject,'String')) returns contents of result as a double


% --- Executes during object creation, after setting all properties.
function result_CreateFcn(hObject, eventdata, handles)
% hObject    handle to result (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in menu2.
function menu2_Callback(hObject, eventdata, handles)
% hObject    handle to menu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
flag2 = get(handles.menu2,'Value');
setappdata(0,'flag_2',flag2);

% Hints: contents = cellstr(get(hObject,'String')) returns menu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from menu2


% --- Executes during object creation, after setting all properties.
function menu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to menu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function name_Callback(hObject, eventdata, handles)
% hObject    handle to name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of name as text
%        str2double(get(hObject,'String')) returns contents of name as a double


% --- Executes during object creation, after setting all properties.
function name_CreateFcn(hObject, eventdata, handles)
% hObject    handle to name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function yourbmi_Callback(hObject, eventdata, handles)
% hObject    handle to yourbmi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.warning,'String','');
flag1 = getappdata(0,'flag_1')
flag2 = getappdata(0,'flag_2')
if flag1 == 1 || flag2 == 1
    set(handles.warning,'String','*Atleast choose the system');

elseif flag1 == 2 && flag2 == 2
    w = get(handles.weight,'String');
    h = get(handles.height,'String');
    w = str2num(w);
    h = str2num(h);
    ans = (w*703)/(h^2);
    set(handles.yourbmi,'String',ans);

elseif flag1 == 3 && flag2 == 3
    w = get(handles.weight,'String');
    h = get(handles.height,'String');
    w = str2num(w);
    h = str2num(h);
    ans = (w)/(h^2);
    set(handles.yourbmi,'String',ans);
    
elseif flag1 ~= flag2 
    set(handles.warning,'String','*Choose a single system');
    
    
    
end

% Hints: get(hObject,'String') returns contents of yourbmi as text
%        str2double(get(hObject,'String')) returns contents of yourbmi as a double


% --- Executes during object creation, after setting all properties.
function yourbmi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to yourbmi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function comment_Callback(hObject, eventdata, handles)
% hObject    handle to comment (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    
 
% Hints: get(hObject,'String') returns contents of comment as text
%        str2double(get(hObject,'String')) returns contents of comment as a double


% --- Executes during object creation, after setting all properties.
function comment_CreateFcn(hObject, eventdata, handles)
% hObject    handle to comment (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
