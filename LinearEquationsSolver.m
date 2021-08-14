function varargout = LinearEquationsSolver(varargin)
%LINEAREQUATIONSSOLVER MATLAB code file for LinearEquationsSolver.fig
%      LINEAREQUATIONSSOLVER, by itself, creates a new LINEAREQUATIONSSOLVER or raises the existing
%      singleton*.
%
%      H = LINEAREQUATIONSSOLVER returns the handle to a new LINEAREQUATIONSSOLVER or the handle to
%      the existing singleton*.
%
%      LINEAREQUATIONSSOLVER('Property','Value',...) creates a new LINEAREQUATIONSSOLVER using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to LinearEquationsSolver_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      LINEAREQUATIONSSOLVER('CALLBACK') and LINEAREQUATIONSSOLVER('CALLBACK',hObject,...) call the
%      local function named CALLBACK in LINEAREQUATIONSSOLVER.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help LinearEquationsSolver

% Last Modified by GUIDE v2.5 12-Dec-2019 18:18:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @LinearEquationsSolver_OpeningFcn, ...
                   'gui_OutputFcn',  @LinearEquationsSolver_OutputFcn, ...
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


% --- Executes just before LinearEquationsSolver is made visible.
function LinearEquationsSolver_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for LinearEquationsSolver
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes LinearEquationsSolver wait for user response (see UIRESUME)
% uiwait(handles.figure1);

global solutionTable solutions len ind ySolutions table bol;
solutionTable = [];
solutions = [];
table = [];
len = 0;
ind = 0;
ySolutions = [];
bol = 0;
set(handles.roots, 'String','');
set(handles.uitable1,'data',{});
set(handles.uitable2,'data',{});
set(handles.uitable2,'Columnname',{});
set(handles.initial_values_txtArea,'String','');
set(handles.tolerance_txtArea,'String','');
set(handles.iterations_txtArea,'String','');

set(handles.uitable1,'Position',[8.75 10 60.5 6.5]); % x y width height
set(handles.uitable2,'Position',[80.75 3 87.5 13.5]);

movegui([260 130]);


% --- Outputs from this function are returned to the command line.
function varargout = LinearEquationsSolver_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function input_equations_textArea_Callback(hObject, eventdata, handles)
% hObject    handle to input_equations_textArea (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input_equations_textArea as text
%        str2double(get(hObject,'String')) returns contents of input_equations_textArea as a double


% --- Executes during object creation, after setting all properties.
function input_equations_textArea_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input_equations_textArea (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in method_menu.
function method_menu_Callback(hObject, eventdata, handles)
% hObject    handle to method_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns method_menu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from method_menu
global solutionTable solutions len ind ySolutions table bol;
solutionTable = [];
solutions = [];
table = [];
len = 0;
ind = 0;
ySolutions = [];
bol = 0;
selected_item = get(hObject,'Value');
set(handles.roots, 'String','');
set(handles.uitable1,'data',{});
set(handles.uitable2,'data',{});
set(handles.uitable2,'Columnname',{});
if selected_item == 1
    
    set(handles.next_button, 'enable', 'off');
    set(handles.prev_button, 'enable', 'off');
    set(handles.initial_values_txtArea, 'enable', 'on');
    set(handles.tolerance_txtArea, 'enable', 'on');
    set(handles.iterations_txtArea, 'enable', 'on');
    set(handles.plot, 'enable', 'on');
    
elseif selected_item == 2
    
    set(handles.next_button, 'enable', 'on');
    set(handles.prev_button, 'enable', 'on');
    set(handles.initial_values_txtArea, 'enable', 'off');
    set(handles.tolerance_txtArea, 'enable', 'off');
    set(handles.iterations_txtArea, 'enable', 'off');
    set(handles.initial_values_txtArea,'String','');
    set(handles.tolerance_txtArea,'String','');
    set(handles.iterations_txtArea,'String','');
    set(handles.plot, 'enable', 'off');
    
elseif selected_item == 3
    
    set(handles.next_button, 'enable', 'on');
    set(handles.prev_button, 'enable', 'on');
    set(handles.initial_values_txtArea, 'enable', 'off');
    set(handles.tolerance_txtArea, 'enable', 'off');
    set(handles.iterations_txtArea, 'enable', 'off');
    set(handles.initial_values_txtArea,'String','');
    set(handles.tolerance_txtArea,'String','');
    set(handles.iterations_txtArea,'String','');
    set(handles.plot, 'enable', 'off');
    
elseif selected_item == 4
    
    set(handles.next_button, 'enable', 'on');
    set(handles.prev_button, 'enable', 'on');
    set(handles.initial_values_txtArea, 'enable', 'off');
    set(handles.tolerance_txtArea, 'enable', 'off');
    set(handles.iterations_txtArea, 'enable', 'off');
    set(handles.initial_values_txtArea,'String','');
    set(handles.tolerance_txtArea,'String','');
    set(handles.iterations_txtArea,'String','');
    set(handles.plot, 'enable', 'off');
    
else
    
    set(handles.next_button, 'enable', 'off');
    set(handles.prev_button, 'enable', 'off');
    set(handles.initial_values_txtArea, 'enable', 'on');
    set(handles.tolerance_txtArea, 'enable', 'on');
    set(handles.iterations_txtArea, 'enable', 'on');
    set(handles.plot, 'enable', 'on');
    
end

% --- Executes during object creation, after setting all properties.
function method_menu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to method_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function initial_values_txtArea_Callback(hObject, eventdata, handles)
% hObject    handle to initial_values_txtArea (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of initial_values_txtArea as text
%        str2double(get(hObject,'String')) returns contents of initial_values_txtArea as a double


% --- Executes during object creation, after setting all properties.
function initial_values_txtArea_CreateFcn(hObject, eventdata, handles)
% hObject    handle to initial_values_txtArea (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tolerance_txtArea_Callback(hObject, eventdata, handles)
% hObject    handle to tolerance_txtArea (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tolerance_txtArea as text
%        str2double(get(hObject,'String')) returns contents of tolerance_txtArea as a double


% --- Executes during object creation, after setting all properties.
function tolerance_txtArea_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tolerance_txtArea (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function iterations_txtArea_Callback(hObject, eventdata, handles)
% hObject    handle to iterations_txtArea (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of iterations_txtArea as text
%        str2double(get(hObject,'String')) returns contents of iterations_txtArea as a double


% --- Executes during object creation, after setting all properties.
function iterations_txtArea_CreateFcn(hObject, eventdata, handles)
% hObject    handle to iterations_txtArea (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in solve_button.
function solve_button_Callback(hObject, eventdata, handles)
% hObject    handle to solve_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% data = get(handles.input_equations_textArea,'String');
% cells = cellstr(data);
% cells = cellstr(strrep(cells(1:1:length(cells)),'=' , '=='));
% symbols = sym('x',[1 length(cells)]); % x1 x2 x3
% [A, B] = equationsToMatrix(cells(1:1:length(cells)),symbols);
% horzcat(A,B)
global bol;
data = get(handles.input_equations_textArea,'String');
[A,B,flag] = MatrixParser(data);

if(flag == 0)
        msgbox('Invalid input equations...','Error','error');
        return
end

selected_item = get(handles.method_menu,'Value');

if selected_item == 1
    
      [initial,tolerance,iteration,flag] = CheckAndGetInformation(handles,length(B));
      if(flag == 0)
            msgbox('Invalid input...','Error','error');
            return;
      end
     
    
elseif selected_item == 5
    
      [initial,tolerance,iteration,flag] = CheckAndGetInformation(handles,length(B));
      if(flag == 0)
            msgbox('Invalid input...','Error','error');
            return;
      end
end

global solutionTable solutions len ind ySolutions table;
ind = 1;
    try 
        %swithcing on functions
        switch selected_item    
            case 1
                [solutionTable,finalMatrix,solutions,err1] = Gauss(A,B);
                [solutionTable,finalMatrix,solutions,err2] = LUMethodMain(A,B);
                [solutionTable,finalMatrix,solutions,err3] = GaussJordan(A,B);
                [table,solutions,err4] = GaussSeidel(A,B,initial,iteration,tolerance);
                
                if(logical(err1|err2|err3|err4)==1)
                    msgbox('cannot get solution form Some Methods...','Error','error');
                    return;
                end
                bol =1;
                len = size(A);
                msgbox('Operations Completed','Success');
                
            case 2
                [solutionTable,finalMatrix,solutions,condition] = Gauss(A,B);
                if(condition == 0)
                    len = length(solutions);
                    originalMatrix = horzcat(A,B);
                    solutionTable = [originalMatrix;solutionTable];
                    allOneString = sprintf('%.4f , ',solutions);
                    allOneString = allOneString(1:end-2);
                    set(handles.roots, 'String',allOneString);
                    
                else
                    msgbox('Gauss Elimination : cannot get solution...','Error','error');
                    return
                end

            case 3
                [solutionTable,finalMatrix,solutions,condition] = LUMethodMain(A,B);
                if(condition == 0)
                    set(handles.uitable1,'Data',{});
                    len = length(A);
                    originalMatrix = A;
                    solutionTable = [originalMatrix;solutionTable];
                    ySolutions = finalMatrix;
                    allOneString = sprintf('%.4f , ',solutions);
                    allOneString = allOneString(1:end-2);
                    set(handles.roots, 'String',allOneString);
                    
                else
                    msgbox('LU Decomposition : cannot get solution...','Error','error');
                    return
                end

            case 4
                [solutionTable,finalMatrix,solutions,condition] = GaussJordan(A,B);
                if(condition == 0)
                    len = length(solutions);
                    originalMatrix = horzcat(A,B);
                    solutionTable = [originalMatrix;solutionTable];
                    allOneString = sprintf('%.4f , ',solutions);
                    allOneString = allOneString(1:end-2);
                    set(handles.roots, 'String',allOneString);
                    
                else
                    msgbox('Gauss Jordan : cannot get solution...','Error','error');
                    return
                end

            case 5
                [table,solutions,err] = GaussSeidel(A,B,initial,iteration,tolerance);
                if(err == 0)
                    len = size(A);
                    colNames = getColNames(length(initial));
                    set(handles.uitable2,'Columnname',colNames);
                    set(handles.uitable2,'Data',table);
                    bol = 1;
                    allOneString = sprintf('%.4f , ',solutions);
                    allOneString = allOneString(1:end-2);
                    set(handles.roots, 'String',allOneString);
                    
                else 
                    msgbox('Gauss Siedel : cannot get solution...','Error','error');
                    return
                end

            otherwise
        end 
    catch e
       
        return;
    end 

if(selected_item>1 && selected_item<=4)
         next_button_Callback(handles.next_button, eventdata, handles);
end

% --- Executes on button press in next_button.
function next_button_Callback(hObject, eventdata, handles)
% hObject    handle to next_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global solutionTable solutions len ind ySolutions;
[r,c] = size(solutionTable);
    if (ind > r)
        %in case of LU Decompsition to show [y] then [x]
        if(get(handles.method_menu,'Value') == 3)
            if(ind == r+1)
                set(handles.uitable1,'Data',ySolutions);
                ind = r+2;
            else
                set(handles.uitable1,'Data',solutions);
                ind = r+3;
            end
            return;
        end
        % show solutions [x]
        set(handles.uitable1,'Data',solutions);
        ind = r + 2;
        return;
    end
    cell = getCell(ind,len,solutionTable);
    ind = ind + len;
    set(handles.uitable1,'Data',cell);

% --- Executes on button press in file_button.
function file_button_Callback(hObject, eventdata, handles)
% hObject    handle to file_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global solutionTable solutions len ind ySolutions table bol;
solutionTable = [];
solutions = [];
table = [];
len = 0;
ind = 0;
ySolutions = [];
bol = 0;
set(handles.roots, 'String','');
set(handles.uitable1,'data',{});
set(handles.uitable2,'data',{});
set(handles.uitable2,'Columnname',{});

[file,path] = uigetfile('*');
if isequal(file,0)
   disp('User selected Cancel');
else
        equations = {};
        init = '';
        toler = '';
        iter = '';
        
        File = fullfile(path,file);
        fileID = fopen(File);
        numberOfEquations = fscanf(fileID,'%d');
        TypeOfMethod = fgetl(fileID);
        indOfLine = 1;
        while ~feof(fileID)
            indOfLine = indOfLine + 1;
            if indOfLine <= numberOfEquations+1
                tline = fgetl(fileID);
                equations{indOfLine-1} = tline;
            else
                 init = fgetl(fileID);
                 iter = fgetl(fileID);
                 toler = fgetl(fileID);
            end        
        end
        fclose(fileID);
        
        set(handles.input_equations_textArea,'String',equations);
        set(handles.initial_values_txtArea,'String',init);
        set(handles.tolerance_txtArea,'String',toler);
        set(handles.iterations_txtArea,'String',iter);
        
        if strcmp(TypeOfMethod,'GaussElimination')
            set(handles.method_menu,'Value',2);
        elseif strcmp(TypeOfMethod,'GaussJordan')
            set(handles.method_menu,'Value',4);
        elseif strcmp(TypeOfMethod,'LU')
            set(handles.method_menu,'Value',3);
        elseif strcmp(TypeOfMethod,'GaussSiedel')
            set(handles.method_menu,'Value',5);
        elseif strcmp(TypeOfMethod,'All')
            set(handles.method_menu,'Value',1);
        end
        method_menu_Callback(handles.method_menu, eventdata, handles);
end

% --- Executes on button press in prev_button.
function prev_button_Callback(hObject, eventdata, handles)
% hObject    handle to prev_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global solutionTable solutions len ind ySolutions;
[r,c] = size(solutionTable);

    if (ind - 2*len < 1)
        cell = getCell(1,len,solutionTable);
        set(handles.uitable1,'Data',cell);
        return;
    end
    if(ind == r + 2)
        ind = r + 1 ;
        cell = getCell(r-len+1,len,solutionTable);
        set(handles.uitable1,'Data',cell);
        return;
    elseif(ind == r+3)
        ind = r + 2;
        set(handles.uitable1,'Data',ySolutions);
        return;
    else
    end;
    
    cell = getCell(ind-2*len,len,solutionTable);
    set(handles.uitable1,'Data',cell);
    ind = ind - len;


function [ cell ] = getCell( start, len , solutionTable )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    answer = [];
    row = start;
    count = 1;
    [r,col] = size(solutionTable);
    while(count <= len)
        answer = [answer;solutionTable((row+count-1):(row+count-1) , 1 : col )];
        count = count+1;
    end
    cell = num2cell(double(answer));
    

function [A,B,flag] = MatrixParser(data)
    warning('off','all');
    A = [];
    B = []; 
    try
        cells = cellstr(data);
        cells = cellstr(strrep(cells(1:1:length(cells)),'=' , '=='));
        symbols = sym('x',[1 length(cells)]);
        [A, B] = equationsToMatrix(cells(1:1:length(cells)),symbols);
        
        flag = 1;
        for i=1:length(B)
            flag = logical(flag & (B(i)== double(B(i))));
        end;
        [r,c] = size(A);
        for i=1:r;
            for j=1:c;
                flag = logical(flag & (A(i,j)== double(A(i,j))));
            end;
        end;
    catch e
        flag = 0;
    end


function [solutionTable,finalMatrix,condition] = forwardElimination(augumentedMatrix)
help=augumentedMatrix;
length=size(help);
diagonalCounter=1;
flag=0;
intialize=0;
%{condition=0 for no error ,condition=1 for division by 0%}
%{solutions is the values of x's%}
while (diagonalCounter<length(1)&&flag==0)
        maxCounter = diagonalCounter;
        rowCounter=diagonalCounter+1;
        max=abs(help(diagonalCounter,diagonalCounter));
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%to make pivoting
        while( rowCounter<=length(1))  % max element and its row (max counter)
            if (abs(help(rowCounter,diagonalCounter))>max)
                maxCounter=rowCounter;
                max=abs(help(rowCounter,diagonalCounter));
            end
             rowCounter= rowCounter+1;
        end
        if (maxCounter~=diagonalCounter)
            columnCounter=diagonalCounter;
            while(columnCounter<=length(2))
                temp=help(diagonalCounter,columnCounter);
                help(diagonalCounter,columnCounter)=help(maxCounter,columnCounter);
                help(maxCounter,columnCounter)=temp;
                columnCounter=columnCounter+1;
            end
        end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        rowCounter=diagonalCounter+1; % return the value of row counter to diag. counter+1
        
        while (rowCounter<=length(1)&&flag==0)
            factor =-1*help(rowCounter,diagonalCounter)/help(diagonalCounter,diagonalCounter);
            columnCounter=diagonalCounter;
            while(columnCounter<=length(2))
                help(rowCounter,columnCounter)=help(diagonalCounter,columnCounter)*factor+help(rowCounter,columnCounter);
                columnCounter=columnCounter+1;
            end
            if (intialize==0)
                solutionTable =help; 
                intialize=1;
            else
                 solutionTable=[solutionTable;help];
            end
%             if (help(diagonalCounter+1,diagonalCounter+1)==0)
%                  flag=1;
%             end
             rowCounter= rowCounter+1;
        end
        diagonalCounter=diagonalCounter+1;
   
end
condition=flag;
finalMatrix=help;


function [solutions] = backSubistitution( gaussArray)
length=size(gaussArray);
rowCounter=length(1);
variables(1)=0;
count=2;
while (count<=length(1))
    variables=[variables;0];
    count=count+1;
end

while(rowCounter>0)
    columnCounter=length(2)-1;
    sumOfTerms=0;
    while (columnCounter>rowCounter)
        temp=gaussArray(rowCounter,columnCounter)*variables(columnCounter);
        sumOfTerms=sumOfTerms+temp;
        columnCounter=columnCounter-1;
    end
    variables(rowCounter)=(gaussArray(rowCounter,length(2))-sumOfTerms)/gaussArray(rowCounter,rowCounter);
    rowCounter=rowCounter-1; 
end
solutions=variables;


function [ solutionTable,finalMatrix,solutions,condition] = Gauss(coefficient,results)
[solutionTable,help,condition]= forwardElimination(horzcat(coefficient,results));
finalMatrix=help;
    if (condition==0)
        solutions=backSubistitution(help);
    else
        solutions=0; 
        return;
    end
    
    
    %output in file
    %fileName = strcat('C:\Users\amrmh_000\Desktop\outputs\','outputGaussElimination.txt');
    fileName = strcat(pwd,'\outputGaussElimination.txt');
    fileID = fopen(fileName,'wt');
    fprintf(fileID,'%4s\r\n','Original Matrix');
    [r,c] = size(solutionTable);
    original = horzcat(coefficient,results);
    len = length(solutions);
    
    %original matrix
    for i = 1:len
        for j = 1:c
            if(j == c)
                    fprintf(fileID,'%s  ', '|');
            end
            fprintf(fileID,'%.5f  ',double(original(i,j)));
        end
        fprintf(fileID,'\r\n');   
    end
    
    %steps
    for i = 1:len:r
        fprintf(fileID,'%s\r\n','-------------------------------------------------------------------');
        fprintf(fileID,'%s %d\r\n','Step' , floor(i/len)+1);
        for ii = i:i+len-1
           for j = 1:c
               if(j == c)
                    fprintf(fileID,'%s  ', '|');
               end
               fprintf(fileID,'%.5f  ',double(solutionTable(ii,j)));
           end
           fprintf(fileID,'\r\n');
       end
    end
    fprintf(fileID,'%s\r\n','-------------------------------------------------------------------');
    
    %solutions
    fprintf(fileID,'%s\r\n','Solutions');
    for i = 1:length(solutions)
        fprintf(fileID,'%.5f\r\n',double(solutions(i,:)));
    end
    
    fclose(fileID);


function [x y] = substitude(A,n,b)
    y = zeros(n,1);
    x = zeros(n,1);
    %Forward Sub
    y(1) = b(1);
    for i = 2 : n 
       total = b(i);
       for j = 1 : i-1
           total = total - y(j)* A(i,j);
       end
       y(i) = total;
    end
    
    %Backward sub
    x(n) = y(n)/A(n,n);
    for i = n-1 : -1 : 1
        sum = y(i);
        for j = i+1 : n
            sum = sum - A(i,j)*x(j);
        end
        x(i) = sum/A(i,i);
    end    
    
    
function [scale A b l] = pivot(A,scale,start,n,b,l)
    p = start;
    big = abs(A(start,start)/scale(start));
    for j = start : n
        tmp = abs(A(j,start)/scale(j));
        if tmp > big 
            p = j;
            big = tmp;
        end
    end
    temp = scale(p);
    row = A(p,:);
    tmp2 = b(p);
    row2 = l(p,:);
    
    b(p) = b(start);
    A(p,:) = A(start,:);
    l(p,:) = l(start,:);
    scale(p) = scale(start);
    
    l(start,:) = row2;
    b(start) = tmp2;
    A(start,:)= row;
    scale(start) = temp;
    
    
function [decomp err steps b] = getLU(A,tol,b)

    sizes = size(A);
    err = 0;
    steps = [];
    decomp =[];
    L = zeros(size(A));
    if(sizes(1) == sizes(2))
       scale = zeros(1,sizes(1)); % s[]
       % assigning postions and finding scaleing of each row in the matrix
       for i = 1 : sizes(1)
        scale(i) = abs(A(i,1));
        for j = 2 : sizes(1)
            scale(i) = max(scale(i),abs(A(i,j)));
        end
       end
       % main Decomposition
       for i = 1 : sizes(1)
          [scale, A, b, L] = pivot(A,scale,i,sizes(1),b,L);
          
          %check for singular or near-singular cases
          if(abs(A(i,i)/scale(i)) < tol)
            err = 1;
            decomp =[];
            steps=[];
            return;
          end
          for j = i+1 : sizes(1)
              factor = A(j,i)/A(i,i);
              L(j,i) = factor;
              for k = i : sizes(1)
                A(j,k) =  A(j,k) - factor*A(i,k);
              end
              
              steps = [steps;A];   
          end          
       end
       % same as in A Matrix
       steps = [steps;L+eye(sizes(1))];
       if(abs(A(sizes(1),sizes(1))/scale(sizes(1))) < tol)
           err = 1;
           decomp =[];
           steps=[];
           return;
       end
    else
        err = 1;
    end
    
    decomp = (A+L);

    
function [solutionTable,finalMatrix,solutions,condition] = LUMethodMain(coefficient,results)

    tol = 1e-6;
    [decomp condition solutionTable results] = getLU(coefficient,tol,results);
    if(condition == 1)
        solutionTable = [];
        finalMatrix =[];
        solutions = [];
        return;
    end
    n = size(coefficient);
    [x, y] = substitude(decomp,n(1),results);
    if(condition == 1)
        return;
    end
    finalMatrix = y;
    solutions = x;
    
    %output in file
    fileName = strcat(pwd,'\outputLUDecomposition.txt');
    fileID = fopen('outputLUDecomposition.txt','wt');
    [r,c] = size(solutionTable);
    original = coefficient;
    len = length(solutions);
    
    fprintf(fileID,'%4s\r\n','Matrix A');
    %original matrix
    for i = 1:len
        for j = 1:len
            fprintf(fileID,'%.5f  ',double(original(i,j)));
        end
        fprintf(fileID,'\r\n');   
    end
    
    %steps to getting U
    for i = 1:len:(r-2*len)
        fprintf(fileID,'%s\r\n','-------------------------------------------------------------------');
        fprintf(fileID,'%s %d %s\r\n','Step' , floor(i/len)+1,'to get U');
        for ii = i:i+len-1
           for j = 1:c
               fprintf(fileID,'%.5f  ',double(solutionTable(ii,j)));
           end
           fprintf(fileID,'\r\n');
       end
    end
    fprintf(fileID,'%s\r\n','-------------------------------------------------------------------');
    
    
    %U
    fprintf(fileID,'%4s\r\n','Matrix U');
    for i = (r-2*len+1):(r-len)
        for j = 1:c
            fprintf(fileID,'%.5f  ',double(solutionTable(i,j)));
        end
        fprintf(fileID,'\r\n');
    end
    fprintf(fileID,'%s\r\n','-------------------------------------------------------------------');
    
    
    %L
    fprintf(fileID,'%4s\r\n','Matrix L');
    for i = (r-len+1):(r)
        for j = 1:c
            fprintf(fileID,'%.5f  ',double(solutionTable(i,j)));
        end
        fprintf(fileID,'\r\n');
    end
    fprintf(fileID,'%s\r\n','-------------------------------------------------------------------');

    %Y solutions
    fprintf(fileID,'%s\r\n','Y Solutions');
    for i = 1:length(solutions)
        fprintf(fileID,'%.5f\r\n',double(finalMatrix(i,:)));
    end
    fprintf(fileID,'%s\r\n','-------------------------------------------------------------------');

       
    %X solutions
    fprintf(fileID,'%s\r\n','X Solutions');
    for i = 1:length(solutions)
        fprintf(fileID,'%.5f\r\n',double(solutions(i,:)));
    end
    
    fclose(fileID);
       
function [solutionTable,finalMatrix,solutions,condition] = GaussJordan(coefficient,results)
[solutionTable,finalMatrix,condition]=forwardElimination(horzcat(coefficient,results));
if (condition==0)
    diagonalCounter=2;
    lengthh=size(finalMatrix);
    while(diagonalCounter<=lengthh(1))
        rowCounter=diagonalCounter-1;
        while (rowCounter>0)
            factor=-1*finalMatrix(rowCounter,diagonalCounter)/finalMatrix(diagonalCounter,diagonalCounter);
            columnCounter=diagonalCounter;
            while (columnCounter<=lengthh(2))
                finalMatrix( rowCounter,columnCounter)=factor* finalMatrix(diagonalCounter ,columnCounter)+ finalMatrix( rowCounter,columnCounter);
                 columnCounter=columnCounter+1;
            end
            solutionTable=[solutionTable;finalMatrix];
            rowCounter=rowCounter-1;
        end
        diagonalCounter=diagonalCounter+1;
    end
    count=2;
    variables(1)=0;
    while (count<=lengthh(1))
        variables=[variables;0];
        count=count+1;
    end
    diagonalCounter=1;
    while ( diagonalCounter<=lengthh(1))
       variables(diagonalCounter)=finalMatrix(diagonalCounter,lengthh(2))/finalMatrix(diagonalCounter,diagonalCounter);
       diagonalCounter=diagonalCounter+1; 
    end
    solutions=variables;
    
else
    solutions=0;
    return;
end

    %output in file
    fileName = strcat(pwd,'\outputGaussJordan.txt');
    fileID = fopen(fileName,'wt');
    fprintf(fileID,'%4s\r\n','Original Matrix');
    [r,c] = size(solutionTable);
    original = horzcat(coefficient,results);
    len = length(solutions);
    
    %original matrix
    for i = 1:len
        for j = 1:c
            if(j == c)
                    fprintf(fileID,'%s  ', '|');
            end
            fprintf(fileID,'%.5f  ',double(original(i,j)));
        end
        fprintf(fileID,'\r\n');   
    end
    
    %steps
    for i = 1:len:r
        fprintf(fileID,'%s\r\n','-------------------------------------------------------------------');
        fprintf(fileID,'%s %d\r\n','Step' , floor(i/len)+1);
        for ii = i:i+len-1
           for j = 1:c
               if(j == c)
                    fprintf(fileID,'%s  ', '|');
               end
               fprintf(fileID,'%.5f  ',double(solutionTable(ii,j)));
           end
           fprintf(fileID,'\r\n');
       end
    end
    fprintf(fileID,'%s\r\n','-------------------------------------------------------------------');
    
    %solutions
    fprintf(fileID,'%s\r\n','Solutions');
    for i = 1:length(solutions)
        fprintf(fileID,'%.5f\r\n',double(solutions(i,:)));
    end
    
    fclose(fileID);

    
function [initial,toler,itera,flag] = CheckAndGetInformation(handles,len)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    flag = 1;
    
    try
            itera = get(handles.iterations_txtArea,'String');
            initial = get(handles.initial_values_txtArea,'String');
            toler = get(handles.tolerance_txtArea,'String');
    catch e
        flag = 0;
        return
    end
    
    if(isempty(itera))
        flag = 0;
        return;
    else
        itera = str2double(itera);
        flag = logical(flag & (itera == double(itera))& (double(itera)>=1));
    end;

    if(isempty(toler))
        flag = 0;
        return;
    else
        toler = str2double(toler);
        flag = logical(flag & (toler == double(toler)) & (double(toler)>0));
    end;

    if(isempty(initial))
        flag = 0;
        return;
    else
        initial = strsplit(initial,' ');
        for i=1:length(initial)
            initiall(1,i) = str2double(char(initial(1,i)));
        end
        if(logical(logical(flag & (initiall == double(initiall)))&logical(flag & (length(initiall)==len))))
            flag = 1;
        else
            flag = 0;
        end;
        initial = initiall;
    end;


function [ colNames ] = getColNames( numberOfVariables )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
    colNames = cell(1,numberOfVariables*3+2);

    colNames{1} = 'i';
    
    for i=1:numberOfVariables
        colNames{i+1} = strcat(strcat('x',num2str(i)),'i');
    end
    
    for i=1:numberOfVariables
        colNames{i+numberOfVariables+1} = strcat(strcat('x',num2str(i)),'i+1');
    end
    
    for i=1:numberOfVariables
        colNames{i+2*numberOfVariables+1} = strcat('Err',num2str(i));
    end
    
    colNames{3*numberOfVariables+2} = 'Time';    
    
    
function [table,sol,flagError] = GaussSeidel(A, b, x0, iterations, error)
time = tic;
flagError = 0;
try
    num_of_variables = size(A,2);
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% First iteration 
    for j = 1 : num_of_variables  % calculate the first varable then second and so on.
        res(1) = 0; % temp variable to claculate each variable
        for k = 1 : num_of_variables
            if(k > j)
                res(1) = res(1) + A(j, k) * x0(k);
            elseif(k < j)
                res(1) = res(1) + A(j, k) * x(1,k);
            end
        end
        x(1,j) = (b(j) - res(1))/A(j,j);
        er(1,j) = 0;
    end
    table(1, 1) = 1;
    for j = 1 : num_of_variables
        table(1,j + 1) = x0(j);
    end
    for j = 1 : num_of_variables
        table(1,j + num_of_variables + 1) = x(1,j);
        if(isnan(x(1,j)) || isinf(x(1,j)))
            flagError = 1;
        end
    end
    for j = 1 : num_of_variables
        table(1,j + 2*num_of_variables + 1) = er(1,j);
    end
    table(1, 3*num_of_variables + 2) = toc(time);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% the other iterations
    for i = 2 : iterations
        time = tic;
        for j = 1 : num_of_variables
            res = 0;
            for k = 1 : num_of_variables
                if(k > j)
                    res = res + A(j, k) * x(i-1,k);
                elseif(k < j)
                    res = res + A(j, k) * x(i,k);
                end

            end
            x(i,j) = (b(j) - res)/A(j,j);
%               er(i,j) = abs(x(i,j) - x(i - 1,j));
            er(i,j) = abs((x(i,j) - x(i - 1,j))/x(i,j));
        end
        table(i, 1) = i;
        for j = 1 : num_of_variables
            table(i,j + 1) = x(i-1, j);
            if(isnan(x(i - 1,j)) || isinf(x(i-1,j)))
                flagError = 1;
            end
        end
        for j = 1 : num_of_variables
            table(i,j + num_of_variables + 1) = x(i,j);
            if(isnan(x(i,j))|| isinf(x(i,j)))
                flagError = 1;
            end
        end
        for j = 1 : num_of_variables
            table(i,j + 2*num_of_variables + 1) = er(i,j);
        end
        table(i, 3*num_of_variables + 2) = toc(time);
        flag = true;
        for j = 1 : num_of_variables
            if(er(i,j) > error)
                flag = false;
                break
            end
        end
        if (flag)
           break;
        end
    end
    sol = x(end,:);
catch e
    flagError = 1;
    return;
end
    
    fileName = strcat(pwd,'\outputGaussSeidel.txt');
    fileID = fopen(fileName,'wt');
    [r,c] = size(table);
    colNames = getColNames(double((c-2)/3));
    
    fprintf(fileID,'      %s  ',colNames{1});
    for i= 2 : length(colNames)
        endd = 8;
        if i > double((c-2)/3)+2
            endd = 6;
        end    
        for j=1:endd
            fprintf(fileID,'%s',' ');
        end
        fprintf(fileID,'%s  ',colNames{i});
    end
    
    for i=1:r
        fprintf(fileID,'\n');
        for j=1:c
            fprintf(fileID,'%10f   ',double(table(i,j)));
        end
    end
    
    fclose(fileID);
    

% --- Executes on button press in plot.
function plot_Callback(hObject, eventdata, handles)
% hObject    handle to plot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global table len bol;
if isempty(get(handles.input_equations_textArea, 'String')) || isempty(get(handles.initial_values_txtArea, 'String')) || isempty(get(handles.tolerance_txtArea , 'String')) || isempty(get(handles.iterations_txtArea , 'String')) || bol == 0
msgbox('Incomplete Information...','Error','error');
else
if get(handles.method_menu,'Value') == 1 || get(handles.method_menu,'Value') == 5
    if (len(1) == len(2))
        Hf_1 = figure(1); 
        set(Hf_1,'NumberTitle','off','Name','(Roots) vs (Number of iterations)');        
        movegui(Hf_1,[425 150]);
        
        Legend = cell(len(1),1);
        for i = 1:len(1)
              plot([0;table(:,1)],[table(1,i+1);table(:,i+len(1)+1)]);
              Legend{i} = strcat('X',num2str(i));
              hold on;
        end
        legend(Legend);
        xlabel('Number of Iterations', 'FontSize', 12,'color','b');
        ylabel('Roots', 'FontSize', 12,'color','b');
        title('The behaviour Of Roots According to Number of Iterations', 'FontSize', 12,'color','b');
        grid on;
    end   
end
end

function roots_Callback(hObject, eventdata, handles)
% hObject    handle to roots (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of roots as text
%        str2double(get(hObject,'String')) returns contents of roots as a double


% --- Executes during object creation, after setting all properties.
function roots_CreateFcn(hObject, eventdata, handles)
% hObject    handle to roots (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
