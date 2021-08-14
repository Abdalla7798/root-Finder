function varargout = rootFinder(varargin)
% ROOTFINDER MATLAB code for rootFinder.fig
%      ROOTFINDER, by itself, creates a new ROOTFINDER or raises the existing
%      singleton*.
%
%      H = ROOTFINDER returns the handle to a new ROOTFINDER or the handle to
%      the existing singleton*.
%
%      ROOTFINDER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ROOTFINDER.M with the given input arguments.
%
%      ROOTFINDER('Property','Value',...) creates a new ROOTFINDER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before rootFinder_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to rootFinder_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help rootFinder

% Last Modified by GUIDE v2.5 27-Nov-2019 23:45:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @rootFinder_OpeningFcn, ...
                   'gui_OutputFcn',  @rootFinder_OutputFcn, ...
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


% --- Executes just before rootFinder is made visible.
function rootFinder_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to rootFinder (see VARARGIN)

% Choose default command line output for rootFinder
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


% set(handles.table1,'ColumnWidth',{540/2, 540/2});
% set(handles.table1,'Columnname',{'first', 'second'});
global C h2;
C = 'empty';
h2 = 'empty';
set(handles.table1,'data',{});
movegui([-1 100]);


% UIWAIT makes rootFinder wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = rootFinder_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function fun_Callback(hObject, eventdata, handles)
% hObject    handle to fun (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fun as text
%        str2double(get(hObject,'String')) returns contents of fun as a double
if get(handles.Fixedpoint,'value') == 1
fun = get(hObject,'String');
nfun = strcat(fun,'-x');
set(handles.org_eqn, 'String', strcat('Original Function :',nfun));
end

% --- Executes during object creation, after setting all properties.
function fun_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fun (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function max_Callback(hObject, eventdata, handles)
% hObject    handle to max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of max as text
%        str2double(get(hObject,'String')) returns contents of max as a double


% --- Executes during object creation, after setting all properties.
function max_CreateFcn(hObject, eventdata, handles)
% hObject    handle to max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function eps_Callback(hObject, eventdata, handles)
% hObject    handle to eps (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eps as text
%        str2double(get(hObject,'String')) returns contents of eps as a double


% --- Executes during object creation, after setting all properties.
function eps_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eps (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Bisection.
function Bisection_Callback(hObject, eventdata, handles)
% hObject    handle to Bisection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Bisection
global h2 Hf_1 C;
C = 'empty';
h2 = 'empty';
delete(Hf_1);
set(handles.equ_text, 'String', 'Equation:');
set(handles.equ_text, 'Position', [2 35.5 25 2]);
set(handles.org_eqn, 'String','');
set(handles.high, 'enable', 'on');

% --- Executes on button press in Falseposition.
function Falseposition_Callback(hObject, eventdata, handles)
% hObject    handle to Falseposition (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Falseposition
global h2 Hf_1 C;
C = 'empty';
h2 = 'empty';
delete(Hf_1);
set(handles.equ_text, 'String', 'Equation:');
set(handles.equ_text, 'Position', [2 35.5 25 2]); % first two number for x-y and second two number for width-height
set(handles.org_eqn, 'String','');
set(handles.high, 'enable', 'on');

% --- Executes on button press in Fixedpoint.
function Fixedpoint_Callback(hObject, eventdata, handles)
% hObject    handle to Fixedpoint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Fixedpoint
global h2 Hf_1 C;
C = 'empty';
h2 = 'empty';
delete(Hf_1);
if (isempty(get(handles.fun, 'String')))
else
 fun = get(handles.fun, 'String');
 nfun = strcat(fun,'-x');
 set(handles.org_eqn, 'String', strcat('Original Function :',nfun));
end
set(handles.equ_text, 'String', 'Iterated Function:');
set(handles.equ_text, 'Position', [6.75 35.5 25 2]);
set(handles.high, 'enable', 'off');


% --- Executes on button press in NewtonRaphson.
function NewtonRaphson_Callback(hObject, eventdata, handles)
% hObject    handle to NewtonRaphson (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of NewtonRaphson
global h2 Hf_1 C;
C = 'empty';
h2 = 'empty';
delete(Hf_1);
set(handles.equ_text, 'String', 'Equation:');
set(handles.equ_text, 'Position', [2 35.5 25 2]);
set(handles.org_eqn, 'String','');
set(handles.high, 'enable', 'off');

% --- Executes on button press in Secant.
function Secant_Callback(hObject, eventdata, handles)
% hObject    handle to Secant (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Secant
global h2 Hf_1 C;
C = 'empty';
h2 = 'empty';
delete(Hf_1);
set(handles.equ_text, 'String', 'Equation:');
set(handles.equ_text, 'Position', [2 35.5 25 2]);
set(handles.org_eqn, 'String','');
set(handles.high, 'enable', 'on');

function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function low_Callback(hObject, eventdata, handles)
% hObject    handle to low (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of low as text
%        str2double(get(hObject,'String')) returns contents of low as a double


% --- Executes during object creation, after setting all properties.
function low_CreateFcn(hObject, eventdata, handles)
% hObject    handle to low (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function high_Callback(hObject, eventdata, handles)
% hObject    handle to high (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of high as text
%        str2double(get(hObject,'String')) returns contents of high as a double


% --- Executes during object creation, after setting all properties.
function high_CreateFcn(hObject, eventdata, handles)
% hObject    handle to high (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in find.
function find_Callback(hObject, eventdata, handles)
% hObject    handle to find (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
format long
global h2 Hf_1;
h2 = 'empty';
delete(Hf_1);
set(handles.table1,'data',{});
set(handles.appro_root,'string','');
set(handles.Ex_Time,'string','');
set(handles.T_iter,'string','');

if isempty(get(handles.fun, 'String')) || isempty(get(handles.max, 'String')) || isempty(get(handles.eps , 'String')) || isempty(get(handles.low , 'String')) || (isempty(get(handles.high ,'String')) && get(handles.Falseposition,'Value') == 1) || (isempty(get(handles.high ,'String')) && get(handles.Bisection,'Value') == 1) || (isempty(get(handles.high ,'String')) && get(handles.Secant,'Value') == 1) || (get(handles.Bisection,'Value') == 0 && get(handles.Falseposition,'Value') == 0 && get(handles.Fixedpoint,'Value') == 0 && get(handles.NewtonRaphson,'Value') == 0 && get(handles.Secant,'Value') == 0)
msgbox('Incomplete Information...','Error','error');
else
f = inline(get(handles.fun,'String'));
max = str2double(get(handles.max,'String'));
eps = str2double(get(handles.eps,'String'));
low = str2double(get(handles.low,'String'));
high = str2double(get(handles.high,'String'));

if get(handles.Bisection,'value') == 1 
      tic
      r = Bisection(f , low , high , max , eps ,handles);
      t = toc;
      if strcmp(r,'Error') == 0
      set(handles.appro_root,'string',num2str(r));
      set(handles.Ex_Time,'string',num2str(t));
      end
      if strcmp(r,'Error') == 0 && (isnan(r) || isinf(r))
        msgbox('the method is diverge...','Error','error');
      end
       
elseif get(handles.Falseposition,'value') == 1 
      tic
      r = False_Position(f , low , high , max , eps , handles);
      t = toc;
      if strcmp(r,'Error') == 0
      set(handles.appro_root,'string',num2str(r));
      set(handles.Ex_Time,'string',num2str(t));
      end
      if strcmp(r,'Error') == 0 && (isnan(r) || isinf(r))
        msgbox('the method is diverge...','Error','error');
      end
      
elseif get(handles.Fixedpoint,'value') == 1
      tic
      r = Fixed_Point(f , low , high , max , eps , handles);
      t = toc;
      if strcmp(r,'Error') == 0
      set(handles.appro_root,'string',num2str(r));
      set(handles.Ex_Time,'string',num2str(t));
      end
      if strcmp(r,'Error') == 0 && (isnan(r) || isinf(r))
        msgbox('the method is diverge...','Error','error');
      end
    
elseif get(handles.NewtonRaphson,'value') == 1
      tic
      f = sym(get(handles.fun,'String'));
      r = Newton_Raphson(f , low , high , max , eps, handles);
      t = toc;
      if strcmp(r,'Error') == 0
      set(handles.appro_root,'string',num2str(r));
      set(handles.Ex_Time,'string',num2str(t));
      end
      if strcmp(r,'Error') == 0 && (isnan(r) || isinf(r))
        msgbox('the method is diverge...','Error','error');
      end
      
elseif get(handles.Secant,'value') == 1
      tic
      r = Secant(f , low , high , max , eps , handles);
      t = toc;
      if strcmp(r,'Error') == 0
      set(handles.appro_root,'string',num2str(r));
      set(handles.Ex_Time,'string',num2str(t));
      end
      if strcmp(r,'Error') == 0 && (isnan(r) || isinf(r))
        msgbox('the method is diverge...','Error','error');
      end
      
end
end

function [root]= Bisection(f , low , high , maxi , tol , handles)
 try
 format long
 global C;
 set(handles.table1,'ColumnWidth',{540/5, 540/5 , 540/5, 540/5 ,540/5});
 set(handles.table1,'Columnname',{'Iter', 'low' , 'high' , 'xr' , 'Ea'});

y1 = feval(f, low);
y2 = feval(f, high);
i = 1;
if y1 * y2 > 0
   msgbox('Have not found a change in sign...','Error','error');
   root = 'Error';
   return
end

mp = 0;
m = (high + low)/2;

if m == 0
   msgbox('division by zero...','Error','error'); 
   root = 'Error';
   return
end

err = abs((m-mp)/m);
y3 = feval(f, m);
C = m;
while (err >= tol && i <maxi)
    
     % add row
     data = get(handles.table1, 'data');
     data(end+1,:) = {i ,low , high , m ,err};
     set(handles.table1, 'data', data);
       
    if y1 * y3 > 0
        low = m;
        y1 = y3;
    else
        high = m;
        y2 = y3;
    end
    mp = m;
    i = i + 1;
    m = (high + low)/2;
    
    if m == 0
      msgbox('division by zero...','Error','error');
      root = 'Error';
      return
    end
    
    err = abs((m-mp)/m);
    y3 = feval(f, m);
    C = [C m];
end 
data = get(handles.table1, 'data');
data(end+1,:) = {i ,low , high , m ,err};
set(handles.table1, 'data', data);
if (i>=maxi)
  msgbox('zero not found to desired tolerance...','Warning','warn');
  root = 'Error';
else
  root = m ;  
end    
set(handles.T_iter,'string',num2str(i));
catch 
    msgbox('some errors happended...','Error','error');
    root = 'Error';
end


function [root]= False_Position(f , low , high , maxi , tol , handles)
try
 format long
 global C;
 set(handles.table1,'ColumnWidth',{540/5, 540/5 , 540/5, 540/5 ,540/5});
 set(handles.table1,'Columnname',{'Iter', 'low' , 'high' , 'xr' , 'Ea'});

y1 = feval(f, low);
y2 = feval(f, high);
i = 1;
if y1 * y2 > 0
   msgbox('Have not found a change in sign...','Error','error');
   root = 'Error';
   return
end

mp = 0;
m = high - (y2*(high-low))/(y2-y1);

if m == 0
   msgbox('division by zero...','Error','error'); 
   root = 'Error';
   return
end

err = abs((m-mp)/m);
y3 = feval(f, m);
C = m;
while (err >= tol && i <maxi)
    
     % add row
     data = get(handles.table1, 'data');
     data(end+1,:) = {i ,low , high , m ,err};
     set(handles.table1, 'data', data);
       
    if y1 * y3 > 0
        low = m;
        y1 = y3;
    else
        high = m;
        y2 = y3;
    end
    mp = m;
    i = i + 1;
    y1 = feval(f, low);
    y2 = feval(f, high);
    m = high - (y2*(high-low))/(y2-y1);
    
    if m == 0
       msgbox('division by zero...','Error','error'); 
       root = 'Error';
       return
    end
    
    err = abs((m-mp)/m);
    y3 = feval(f, m);
    C = [C m];
end 
data = get(handles.table1, 'data');
data(end+1,:) = {i ,low , high , m ,err};
set(handles.table1, 'data', data);
if (i>=maxi)
  msgbox('zero not found to desired tolerance...','Warning','warn');
  root = 'Error';
else
  root = m ;  
end  
set(handles.T_iter,'string',num2str(i));
catch 
    msgbox('some errors happended...','Error','error');
    root = 'Error';
end

function [root]= Newton_Raphson(f , low , high , maxi , tol , handles)
 format long
 global C;
 warning('off','all');
 set(handles.table1,'ColumnWidth',{540/4, 540/4 , 540/4, 540/4});
 set(handles.table1,'Columnname',{'Iter', 'Xi' , 'Xi+1' , 'Ea'});
% x0 = (low + high)/2; 
x0 = low;
g = diff(f);
try
f1 = double(subs(f,x0));
g1 = double(subs(g,x0));
catch 
    msgbox('method is diverge...','Error','error');
    root = 'Error';
    return
end
i = 1;
xi = x0-f1/g1;

if xi == 0
   msgbox('division by zero...','Error','error'); 
   root = 'Error';
   return
end

err = abs((xi-x0)/xi);
C = xi;
while (err >= tol && i <maxi)
    
     % add row
     data = get(handles.table1, 'data');
     data(end+1,:) = {i ,x0 , xi ,err};
     set(handles.table1, 'data', data);
       
    x0 = xi;
    i = i + 1;
    f1 = double(subs(f,x0));
    g1 = double(subs(g,x0));
    xi = x0-f1/g1;
    
    if xi == 0
       msgbox('division by zero...','Error','error'); 
       root = 'Error';
       return
    end
    
    err = abs((xi-x0)/xi);
    C = [C xi];
end 
data = get(handles.table1, 'data');
data(end+1,:) = {i ,x0 , xi ,err};
set(handles.table1, 'data', data);
if (i>=maxi)
  msgbox('zero not found to desired tolerance...','Warning','warn');
  root = 'Error';
else
  root = xi ;  
end   

set(handles.T_iter,'string',num2str(i));


function [root]= Secant(f , low , high , maxi , tol , handles)
try
 format long
 global C;
 set(handles.table1,'ColumnWidth',{540/5, 540/5 , 540/5, 540/5 , 540/5});
 set(handles.table1,'Columnname',{'Iter', 'Xi-1','Xi', 'Xi+1' , 'Ea'});
x_0 = low;
x_1 = high;
y1 = feval(f, x_0);
y2 = feval(f, x_1);
i = 1;
xi = x_1 - (y2*(x_1-x_0))/(y2-y1);

if xi == 0
   msgbox('division by zero...','Error','error'); 
   root = 'Error';
   return
end

err = abs((xi-x_1)/xi);
C = xi;
while (err >= tol && i <maxi)
    
     % add row
     data = get(handles.table1, 'data');
     data(end+1,:) = {i ,x_0 , x_1 , xi ,err};
     set(handles.table1, 'data', data);
       
    x_0 = x_1;
    x_1 = xi;
    i = i + 1;
    y1 = feval(f, x_0);
    y2 = feval(f, x_1);
    xi = x_1 - (y2*(x_1-x_0))/(y2-y1);
    
    if xi == 0
      msgbox('division by zero...','Error','error'); 
      root = 'Error';
      return
    end
    
    err = abs((xi-x_1)/xi);
    C = [C xi];
end 
data = get(handles.table1, 'data');
data(end+1,:) = {i ,x_0 , x_1 , xi ,err};
set(handles.table1, 'data', data);
if (i>=maxi)
  msgbox('zero not found to desired tolerance...','Warning','warn');
   root = 'Error';
else
   root = xi; 
end   
set(handles.T_iter,'string',num2str(i));
catch 
    msgbox('some errors happended...','Error','error');
    root = 'Error';
end


function [root]= Fixed_Point(f , low , high , maxi , tol , handles)
try
 format long
 global C;
 warning('off','all');
 set(handles.table1,'ColumnWidth',{540/4, 540/4 , 540/4, 540/4});
 set(handles.table1,'Columnname',{'Iter', 'Xi' , 'Xi+1' , 'Ea'});
% x0 = (low + high)/2; 
x0 = low;
i = 1;
xi = feval(f, x0);

if xi == 0
   msgbox('division by zero...','Error','error'); 
   root = 'Error';
   return
end

err = abs((xi-x0)/xi);
C = xi;
while (err >= tol && i <maxi)
    
     % add row
     data = get(handles.table1, 'data');
     data(end+1,:) = {i ,x0 , xi ,err};
     set(handles.table1, 'data', data);
       
    x0 = xi;
    i = i + 1;
    xi = feval(f, x0);
    
    if xi == 0
      msgbox('division by zero...','Error','error'); 
      root = 'Error';
      return
    end
    
    err = abs((xi-x0)/xi);
    C = [C xi];
end 
data = get(handles.table1, 'data');
data(end+1,:) = {i ,x0 , xi ,err};
set(handles.table1, 'data', data);
if (i>=maxi)
  msgbox('zero not found to desired tolerance...','Warning','warn');
   root = 'Error';
else
   root = xi ; 
end   
set(handles.T_iter,'string',num2str(i));
catch 
    msgbox('some errors happended...','Error','error');
    root = 'Error';
end


function T_iter_Callback(hObject, eventdata, handles)
% hObject    handle to T_iter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of T_iter as text
%        str2double(get(hObject,'String')) returns contents of T_iter as a double


% --- Executes during object creation, after setting all properties.
function T_iter_CreateFcn(hObject, eventdata, handles)
% hObject    handle to T_iter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Ex_Time_Callback(hObject, eventdata, handles)
% hObject    handle to Ex_Time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ex_Time as text
%        str2double(get(hObject,'String')) returns contents of Ex_Time as a double


% --- Executes during object creation, after setting all properties.
function Ex_Time_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ex_Time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function appro_root_Callback(hObject, eventdata, handles)
% hObject    handle to appro_root (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of appro_root as text
%        str2double(get(hObject,'String')) returns contents of appro_root as a double


% --- Executes during object creation, after setting all properties.
function appro_root_CreateFcn(hObject, eventdata, handles)
% hObject    handle to appro_root (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function browse_text_Callback(hObject, eventdata, handles)
% hObject    handle to browse_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of browse_text as text
%        str2double(get(hObject,'String')) returns contents of browse_text as a double


% --- Executes during object creation, after setting all properties.
function browse_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to browse_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in browse.
function browse_Callback(hObject, eventdata, handles)
% hObject    handle to browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.table1,'data',{});
global C h2 Hf_1;
h2 = 'empty';
C = 'empty';
delete(Hf_1);
[file,path] = uigetfile('*');
if isequal(file,0)
   disp('User selected Cancel');
else
    
 File = [path file];

set(handles.browse_text,'string',File);

fid = fopen(File,'r');
f = fgetl(fid);
max = fgetl(fid);
eps = fgetl(fid);
points = fscanf(fid, '%f');
fclose(fid);

set(handles.fun,'string',f);
set(handles.max,'string',max);
set(handles.eps,'string',eps);
set(handles.low,'string',points(1));
set(handles.high,'string',points(2));
end



% --- Executes on button press in single_step.
function single_step_Callback(hObject, eventdata, handles)
% hObject    handle to single_step (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global C h2 Hf_1;

if isempty(get(handles.fun, 'String')) || isempty(get(handles.max, 'String')) || isempty(get(handles.eps , 'String')) || isempty(get(handles.low , 'String')) || (isempty(get(handles.high ,'String')) && get(handles.Falseposition,'Value') == 1) || (isempty(get(handles.high ,'String')) && get(handles.Bisection,'Value') == 1) || (isempty(get(handles.high ,'String')) && get(handles.Secant,'Value') == 1) || (get(handles.Bisection,'Value') == 0 && get(handles.Falseposition,'Value') == 0 && get(handles.Fixedpoint,'Value') == 0 && get(handles.NewtonRaphson,'Value') == 0 && get(handles.Secant,'Value') == 0)
msgbox('Incomplete Information...','Error','error');
else
    
if get(handles.Fixedpoint,'value') == 1  
f = get(handles.fun, 'String');
nfun = strcat(f,'-x');
fun = nfun;
else
fun = get(handles.fun,'String');
end

Hf_1 = figure(1); 
set(Hf_1,'NumberTitle','off','Name','Single_Step_Simulation','CloseRequestFcn',@closeGUI);
movegui(Hf_1,[0 150]);

% h = ezplot(fun);
h = fplot(fun,[-50,50]);
set(h,'Color','b');
xlabel('x', 'FontSize', 12,'color','b');
ylabel('F(x)', 'FontSize', 12,'color','b');
title('Single Step Simulation', 'FontSize', 12,'color','b');

hold on;
plot([-100 100],[0 0],'--k');
hold on;
plot([0 0],[-100 100],'--k');
hold on;
axis([-10 10 -10 10]);
hold on ;
if strcmp(C,'empty') == 0 && numel(C) ~= 0
    
    if strcmp(h2,'empty') == 0
       set(h2,'Visible','off') ; 
    end
    if numel(C) == 1
      h2 = plot(C(1),0,'or');  
    else
      h2 = plot(C(1),0,'*r');  
    end
    
    C(1) = [];
    axis([-10 10 -10 10]);
else
    
    h2 = 'empty';
    C = 'empty';
end
grid on;
end
function closeGUI(hObject, eventdata, handles)
global C h2 
            h2 = 'empty';
            C = 'empty';
            delete(gcf);


% --- Executes on key press with focus on fun and none of its controls.
function fun_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to fun (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
