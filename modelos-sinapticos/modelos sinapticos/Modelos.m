function varargout = Modelos(varargin)
% MODELOS MATLAB code for Modelos.fig
%      MODELOS, by itself, creates a new MODELOS or raises the existing
%      singleton*.
%
%      H = MODELOS returns the handle to a new MODELOS or the handle to
%      the existing singleton*.
%
%      MODELOS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MODELOS.M with the given input arguments.
%
%      MODELOS('Property','Value',...) creates a new MODELOS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Modelos_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Modelos_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Modelos

% Last Modified by GUIDE v2.5 08-Apr-2015 10:22:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Modelos_OpeningFcn, ...
                   'gui_OutputFcn',  @Modelos_OutputFcn, ...
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


% --- Executes just before Modelos is made visible.
function Modelos_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Modelos (see VARARGIN)

% Choose default command line output for Modelos
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Modelos wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Modelos_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in menu.
function menu_Callback(hObject, eventdata, handles)
% hObject    handle to menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns menu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from menu


% --- Executes during object creation, after setting all properties.
function menu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in iniciar.
function iniciar_Callback(hObject, eventdata, handles)
% hObject    handle to iniciar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc
cont=cellstr(get(handles.menu,'String')); 
tipo=cont(get(handles.menu,'Value'));
axes(handles.respuestaTemp);
if(strcmp(tipo,'Oscilacion'))
 [time,x]=redneuronal;
 plot(time,x(1,:),'r-',time,x(3,:),'g-',time,x(5,:),'b-',time,x(7,:),'m-');
 hold off
    
elseif (strcmp(tipo,'Saturacion'))
    [time,x]=saturacion;
    plot(time,x(1,:),'r-',time,x(2,:),'g-');
    hold off
    
elseif (strcmp(tipo,'Adaptacion'))
    [time x u]=adaptacion;
    plot(time,x(1,:),'r-',time,x(2,:),'g-',time,x(3,:),'b-',time,u);
    hold off 
      
elseif (strcmp(tipo,'Derivada positiva'))
    [time x]=impulso1;
    plot(time,x(1,:),'r-',time,x(2,:),'g-',time,x(3,:),'b-');
    hold off  
    
elseif (strcmp(tipo,'Derivada negativa'))
    [time x]=impulso2;
    plot(time,x(1,:),'r-',time,x(2,:),'g-',time,x(3,:),'b-');
    hold off 
    
elseif (strcmp(tipo,'Winner take all'))
    [time x]=wta;
    plot(time,x(1,:),'r-',time,x(2,:),'g-');
    hold off
        
elseif (strcmp(tipo,'Memoria a corto plazo'))
    [time x]=nowta;
    plot(time,x(1,:),'r-',time,x(2,:),'g-');
    hold off
    
   
elseif (strcmp(tipo,'Tipo8'))
  
    
end







