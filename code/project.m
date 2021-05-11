function varargout = project(varargin)
% PROJECT MATLAB code for project.fig
%      PROJECT, by itself, creates a new PROJECT or raises the existing
%      singleton*.
%
%      H = PROJECT returns the handle to a new PROJECT or the handle to
%      the existing singleton*.
%
%      PROJECT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECT.M with the given input arguments.
%
%      PROJECT('Property','Value',...) creates a new PROJECT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before project_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to project_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help project

% Last Modified by GUIDE v2.5 06-May-2021 14:18:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @project_OpeningFcn, ...
                   'gui_OutputFcn',  @project_OutputFcn, ...
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


% --- Executes just before project is made visible.
function project_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to project (see VARARGIN)

% Choose default command line output for project
handles.output = hObject;
set(handles.input_img,'visible','off');
set(handles.output_img,'visible','off');
set(handles.text1,'visible','off');
set(handles.text2,'visible','off');
set(handles.text_loading,'visible','off');
set(handles.savebutton,'visible','off');
axes(handles.input_img);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes project wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = project_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pFileName.
function pFileName_Callback(hObject, eventdata, handles)
% hObject    handle to pFileName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in OpenFile.
function OpenFile_Callback(hObject, eventdata, handles)
% hObject    handle to OpenFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global filename;
[Fnameh,Pnameh]=uigetfile('./*.png');
% Fnameh显示的文件名称，Pnameh显示的文件路径
filename = [Pnameh,Fnameh];%存储文件的路径及名称
set(handles.pFileName,'String',filename);%将strh的值传递给静态文本
axes(handles.input_img);
image = imread(filename);
imshow(image);
set(handles.text1,'visible','on');

% --- Executes during object creation, after setting all properties.
function input_img_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input_img (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate input_img


% --- Executes on button press in fun1.
function fun1_Callback(hObject, eventdata, handles)
% hObject    handle to fun1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.text_loading,'visible','on');
global filename;
axes(handles.output_img);
output_1 = distortion(filename);
global output;
output = output_1;
imshow(output_1);
imwrite(output_1, './output_1.png')
set(handles.text_loading,'visible','off');
set(handles.text2,'visible','on');
set(handles.savebutton,'visible','on');
% --- Executes on button press in savebutton.

function savebutton_Callback(hObject, eventdata, handles)
% hObject    handle to savebutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[Fnameh,Pnameh] = uiputfile({'*.png','PNG(*.png)';...
                                 '*.bmp','Bitmap(*.bmp)';...
                                 '*.jpg','JPEG(*.jpg)';...
                                 '*.gif','GIF(*.gif)';...
                                 '*.*',  'All Files (*.*)'},...
                                 'Save Picture','Untitled');
h = getframe(handles.output_img);
global output;
imwrite(output,[Pnameh,Fnameh]);


% --- Executes on button press in fun2.
function fun2_Callback(hObject, eventdata, handles)
% hObject    handle to fun2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.text_loading,'visible','on');
global filename;
axes(handles.output_img);
input_2 = imread(filename);
output_2 = increSatura(input_2);
global output;
output = output_2;
imshow(output_2);
set(handles.text_loading,'visible','off');
set(handles.text2,'visible','on');
set(handles.savebutton,'visible','on');

% --- Executes on button press in fun3.
function fun3_Callback(hObject, eventdata, handles)
% hObject    handle to fun3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.text_loading,'visible','on');
global filename;
axes(handles.output_img);
input_3 = imread(filename);
output_3 = increContrast(input_3);
global output;
output = output_3;
imshow(output_3);
set(handles.text_loading,'visible','off');
set(handles.text2,'visible','on');
set(handles.savebutton,'visible','on');
