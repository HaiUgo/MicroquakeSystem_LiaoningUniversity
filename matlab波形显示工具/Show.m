function varargout = Show(varargin)
% SHOW MATLAB code for Show.fig

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Show_OpeningFcn, ...
                   'gui_OutputFcn',  @Show_OutputFcn, ...
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

% --- Executes just before Show is made visible.
function Show_OpeningFcn(hObject, eventdata, handles, varargin)%���ڳ�ʼ��
global darkBlue;global lightGreen;global darkRed;
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);
darkBlue=[0 0.4470 0.7410];
lightGreen=[0.4660 0.6740 0.1880];
darkRed=[0.6350 0.0780 0.1840];
zoom on;

% --- Outputs from this function are returned to the command line.
function varargout = Show_OutputFcn(hObject, eventdata, handles)
% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)%���ص�һ��axes�е���txt��csv�ļ�����!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
global numberofSensors;
global namelist1;global ReadTxtPath1;
global darkBlue;
global handleName;global handleName_tz;global handleName_tzv;
global motipos;global ratioName;
clear global z3;
clear global z6;
global z3;global z6;

numberofSensors=8;%�ж��ٴ�����+1
handleName='handles.axes';%�������е�axes�ؼ���ʾ��̨ͬվ�Ĳ��Ρ�
handleName_tz='handles.tz';
handleName_tzv='handles.tzv';




ch2(:)=0;
count=1;
fileNameArr{:}=' ';
totalF=['��','   ��'];
    [ReadTxtFileName1,ReadTxtPath1,ReadTxtFilterIndex1] = uigetfile({'*.csv;*.txt','File(*.txt,*.csv)';'*.avi','AVIVideoFile(*.avi)';'*.*','AllFile(*.*)'},'ReadCSVFile',...
    'MultiSelect','on',...       %�Ƿ��ܹ���ѡ,'off'��֧�ֶ�ѡ�� 'on'֧�ֶ�ѡ
    'D:\data\ConstructionData\3moti\'); %����Ĭ��·��'H:\�о����׶�\��ɽ\ú���ֺ�����\'

if(ReadTxtPath1~=0)%��ֹȡ�����ļ�ʱ��������
    S=strsplit(ReadTxtFileName1,'.');%��׺��ȡ
    suffix=char(S(2));%�򿪵��ļ��ĺ�׺���ַ���
    if(strcmp(suffix,'txt')==1)%˵����ǰ�򿪵���txt�ļ�
        namelist1 = dir([ReadTxtPath1,'\*.txt']);%�洢���ļ����µ������ļ�
    else%˵����ǰ�򿪵���csv�ļ�
        namelist1 = dir([ReadTxtPath1,'\*.csv']);%�洢���ļ����µ������ļ�
    end
    
    len = length(namelist1);%�洢�ļ����������ļ��ĳ��ȣ�������
    totalF=['��',num2str(len),'����Ŀ'];
    set(handles.text1,'String',totalF);%��������txt�ļ����ļ�������
    
    fileNameF=ReadTxtFileName1;
    set(handles.text2,'String',fileNameF);%��������txt�ļ����ļ�������
    
    txtPath1=[ReadTxtPath1,ReadTxtFileName1];%��ʾ�ղ�˫���򿪵Ĳ���
    ch2=load(txtPath1);%����ȫ·��

    for i=1:2*(numberofSensors-1)
        han =eval([handleName,num2str(i)]);
        axes(han);
        cla;title('');
    end
    for i=2:length(ch2(1,:))
        if(mod(i-1,8)==0)
           ratioName(count,:)=['Test',num2str(ch2(1,i))];
           motipos(count)=ch2(1,i-1);
           x3(:,count)=ch2(:,i-7);
           y3(:,count)=ch2(:,i-6);
           z3(:,count)=ch2(:,i-5);
           x6(:,count)=ch2(:,i-4);
           y6(:,count)=ch2(:,i-3);
           z6(:,count)=ch2(:,i-2);
           count=count+1;
        end
    end
    [max3X,index]=(max(x3(:,:)));
    [max3Y,index]=(max(y3(:,:)));
    [max3Z,index]=(max(z3(:,:)));
    [max6X,index]=(max(x6(:,:)));
    [max6Y,index]=(max(y6(:,:)));
    [max6Z,index]=(max(z6(:,:)));
    
    for i=1:length(z3(1,:))
        han =eval([handleName,num2str(i)]);
        axes(han);
        cla; hold on;
        plot(z3(:,i),'color','k');
        plot([motipos(i),motipos(i)],[-max3Z(i),max3Z(i)],'color','r');%��ֱ��
        plot([0,length(z3(:,i))],[0,0],'color',darkBlue);
        title([ratioName(i,:),' ��123ͨ������']);zoom xon;hold off;
    end
    for i=numberofSensors:length(z6(1,:))+numberofSensors-1
        han =eval([handleName,num2str(i)]);
        axes(han);
        cla; hold on;
        plot(z6(:,i-numberofSensors+1),'color','k');
        plot([motipos(i-numberofSensors+1),motipos(i-numberofSensors+1)],[-max6Z(i-numberofSensors+1),max6Z(i-numberofSensors+1)],'color','r','LineWidth',0.2);%��ֱ��
        plot([0,length(z6(:,i-numberofSensors+1))],[0,0],'color',darkBlue,'LineWidth',0.1);
        title([ratioName(i-numberofSensors+1,:),' ��456ͨ������']);zoom xon;hold off;
    end
    shift_z3 = shiftValue(z3);
    shift_z6 = shiftValue(z6);
    var_z3 = varianceValue(z3);
    var_z6 = varianceValue(z6);
    for i=1:length(z3(1,:))
        han1 = eval([handleName_tz,num2str(i)]);
        set(han1,'String',shift_z3(i));
        han2 = eval([handleName_tzv,num2str(i)]);
        set(han2,'String',var_z3(i));
    end
    
    for i=numberofSensors:length(z6(1,:))+numberofSensors-1
        han1 = eval([handleName_tz,num2str(i)]);
        set(han1,'String',shift_z6(i-numberofSensors+1));
        han2 = eval([handleName_tzv,num2str(i)]);
        set(han2,'String',var_z6(i-numberofSensors+1));
    end
    for i=1:length(namelist1)
        fileNameArr{i}=namelist1(i).name;
    end
    NameMatch=fileNameArr;%��ƥ�������ļ�����ϣ����ͳһ��ʾ���б��
    set(handles.listbox1,'String',NameMatch);%��������txt�ļ����б����
end

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)%�����ť
global numberofSensors;
global txtPath1;
global handleName;global handleText;global handleName_tz;global handleName_tzv;
global z3;global z6;

txtPath1=' ';

for i=1:(numberofSensors-1)*2
    han =eval([handleName,num2str(i)]);
    axes(han);cla;title('');
end
handleText='handles.text';
for i=1:2
    set(eval([handleText,num2str(i)]),'String',' ');
end
set(handles.listbox1,'String','');

for i=1:length(z3(1,:))
    han1 = eval([handleName_tz,num2str(i)]);
    set(han1,'String','0');
    han2 = eval([handleName_tzv,num2str(i)]);
    set(han2,'String','0');
end

for i=numberofSensors:length(z6(1,:))+numberofSensors-1
    han1 = eval([handleName_tz,num2str(i)]);
    set(han1,'String','0');
    han2 = eval([handleName_tzv,num2str(i)]);
    set(han2,'String','0');
end
clear global z3;
clear global z6;

% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)%�б��Ļص�������������ʾtxt�ļ��Ĳ�������
global numberofSensors;%����������
global darkBlue;
global namelist1;global ReadTxtPath1;
global handleName;global handleName_tz;global handleName_tzv;
global motipos;global ratioName;
clear global z3; 
clear global z6;
global z3;global z6;

if(ReadTxtPath1~=0)
    count=1;
    A=get(handles.listbox1,'value');
    set(handles.text2,'String',namelist1(A).name);
    ch2=load([ReadTxtPath1,namelist1(A).name]);%�����ƥ�䲨��6
    
    for i=1:14
        han =eval([handleName,num2str(i)]);
        axes(han);
        cla;title('');
    end
    for i=2:length(ch2(1,:))
        if(mod(i-1,8)==0)
           ratioName(count,:)=['Test',num2str(ch2(1,i))];
           motipos(count)=ch2(1,i-1);
           x3(:,count)=ch2(:,i-7);
           y3(:,count)=ch2(:,i-6);
           z3(:,count)=ch2(:,i-5);
           x6(:,count)=ch2(:,i-4);
           y6(:,count)=ch2(:,i-3);
           z6(:,count)=ch2(:,i-2);
           count=count+1;
        end
    end
    [max3X,index]=(max(x3(:,:)));
    [max3Y,index]=(max(y3(:,:)));
    [max3Z,index]=(max(z3(:,:)));
    [max6X,index]=(max(x6(:,:)));
    [max6Y,index]=(max(y6(:,:)));
    [max6Z,index]=(max(z6(:,:)));
    
    for i=1:length(z3(1,:))
        han =eval([handleName,num2str(i)]);
        axes(han);
        cla; hold on;
        plot(z3(:,i),'color','k');
        plot([motipos(i),motipos(i)],[-max3Z(i),max3Z(i)],'color','r');%��ֱ��
        plot([0,length(z3(:,i))],[0,0],'color',darkBlue);
        title([ratioName(i,:),' ��123ͨ������']);zoom xon;hold off;
    end
    for i=numberofSensors:length(z6(1,:))+numberofSensors-1
        han =eval([handleName,num2str(i)]);
        axes(han);
        cla; hold on;
        plot(z6(:,i-numberofSensors+1),'color','k');
        plot([motipos(i-numberofSensors+1),motipos(i-numberofSensors+1)],[-max6Z(i-numberofSensors+1),max6Z(i-numberofSensors+1)],'color','r','LineWidth',0.2);%��ֱ��
        plot([0,length(z6(:,i-numberofSensors+1))],[0,0],'color',darkBlue,'LineWidth',0.1);
        title([ratioName(i-numberofSensors+1,:),' ��456ͨ������']);zoom xon;hold off;
    end
    shift_z3 = shiftValue(z3);
    shift_z6 = shiftValue(z6);
    var_z3 = varianceValue(z3);
    var_z6 = varianceValue(z6);
    for i=1:length(z3(1,:))
        han1 = eval([handleName_tz,num2str(i)]);
        set(han1,'String',shift_z3(i));
        han2 = eval([handleName_tzv,num2str(i)]);
        set(han2,'String',var_z3(i));
    end
    for i=numberofSensors:length(z6(1,:))+numberofSensors-1
        han1 = eval([handleName_tz,num2str(i)]);
        set(han1,'String',shift_z6(i-numberofSensors+1));
        han2 = eval([handleName_tzv,num2str(i)]);
        set(han2,'String',var_z6(i-numberofSensors+1));
    end
end

% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)%�б��ĳ�ʼ������
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)%
global numberofSensors;%����������
global darkBlue;global lightGreen;
global handleName;
global z3;global z6;global motipos;global ratioName;

checkbox2Status = get(handles.checkbox2,'value');
if(length(z3(:,1))>10000)
    for i=1:14
        han =eval([handleName,num2str(i)]);
        axes(han);
        cla;title('');
    end
    if(checkbox2Status==1)
        for i=1:length(z3(1,:))
            [ratioz3(i,:),position3(i,:)] = SL_window(z3(:,i));
            [ratioz6(i,:),position6(i,:)] = SL_window(z6(:,i));
%             pos(i) = daoshi(z6(:,i));
        end
        E = Energy(z6(:,1));
        fprintf('%f',E);
        
        [max3Z,index]=(max(z3(:,:)));
        [max6Z,index]=(max(z6(:,:)));
        for i=1:length(z3(1,:))
            han =eval([handleName,num2str(i)]);
            axes(han);
            cla; hold on;
            plot(z3(:,i),'color',lightGreen);
            %plot the motipos along.
            for j=1:length(position3)
                if(position3(i,j)==1)
                    plot([j,j],[-max3Z(i),max3Z(i)],'color','k');%��ֱ��
                end
            end
            plot([motipos(i),motipos(i)],[-max3Z(i),max3Z(i)],'color','r');%��ֱ��
            plot([0,length(z3(i,:))],[0,0],'color',darkBlue);
            title([ratioName(i,:),' ��123ͨ������']);zoom xon;hold off;
        end
        for i=numberofSensors:length(z6(1,:))+numberofSensors-1
            han =eval([handleName,num2str(i)]);
            axes(han);
            cla; hold on;
            plot(z6(:,i-numberofSensors+1),'color',lightGreen);
            %plot the motipos along.
            for j=1:length(position6)
                if(position6(i-numberofSensors+1,j)==1)
                    plot([j,j],[-max6Z(i-numberofSensors+1),max6Z(i-numberofSensors+1)],'color','k','lineWidth',1);%��ֱ��
    %                 fprintf('matlab����λ�ã�%f ',j);
                end
            end
            plot([pos(i-numberofSensors+1),pos(i-numberofSensors+1)],[-max6Z(i-numberofSensors+1),max6Z(i-numberofSensors+1)],'color','y','LineWidth',0.2);
            plot([motipos(i-numberofSensors+1),motipos(i-numberofSensors+1)],[-max6Z(i-numberofSensors+1),max6Z(i-numberofSensors+1)],'color','r','LineWidth',0.2);%��ֱ��
    %         fprintf(' Java����λ�ã�%f\n',motipos(i-numberofSensors+1));
            plot([0,length(z6(i-numberofSensors+1,:))],[0,0],'color',darkBlue,'LineWidth',0.1);
            title([ratioName(i-numberofSensors+1,:),' ��456ͨ������']);zoom xon;zoom yon;hold off;
        end
    else
        [max3Z,index]=(max(z3(:,:)));
        [max6Z,index]=(max(z6(:,:)));
        for i=1:length(z3(1,:))
            han =eval([handleName,num2str(i)]);
            axes(han);
            cla; hold on;
            plot(z3(:,i),'color','k');
            plot([motipos(i),motipos(i)],[-max3Z(i),max3Z(i)],'color','r');%��ֱ��
            plot([0,length(z3(:,i))],[0,0],'color',darkBlue);
            title([ratioName(i,:),' ��123ͨ������']);zoom xon;hold off;
        end
        for i=numberofSensors:length(z6(1,:))+numberofSensors-1
            han =eval([handleName,num2str(i)]);
            axes(han);
            cla; hold on;
            plot(z6(:,i-numberofSensors+1),'color','k');
            plot([motipos(i-numberofSensors+1),motipos(i-numberofSensors+1)],[-max6Z(i-numberofSensors+1),max6Z(i-numberofSensors+1)],'color','r','LineWidth',0.2);%��ֱ��
            plot([0,length(z6(:,i-numberofSensors+1))],[0,0],'color',darkBlue,'LineWidth',0.1);
            title([ratioName(i-numberofSensors+1,:),' ��456ͨ������']);zoom xon;hold off;
        end
    end
end
