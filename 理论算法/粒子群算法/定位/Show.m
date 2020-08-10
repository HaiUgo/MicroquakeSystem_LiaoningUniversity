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
function pushbutton2_Callback(hObject, eventdata, handles)%���ص�һ��axes�е���txt��csv�ļ�����!
    global namelist1;global ReadTxtPath1;
    global darkBlue;
    global handleName;global handleName_tz;global handleName_tzv;
    global motipos;global ratioName;
    global point;
    global all;
    clear global z3;
    global z3;
    handleName='handles.axes';%�������е�axes�ؼ���ʾ��̨ͬվ�Ĳ��Ρ�
    handleName_tz='handles.tz';
    handleName_tzv='handles.tzv';
    
        point=[
        41517290.037,4599537.326,24.565; %����R1 7.26
        41520207.356,4597983.404,22.661;%�������W2
        41518060.298,4594304.927,21.926;%������U3
        41519926.476,4597275.978,20.705 %��ҩ��Y4
        41519304.125,4595913.485,23.921;%��ҵ�㳡Z5
        41518099.807,4595388.504,22.776;%�����T4
        41516836.655,4596627.472,21.545;%������S??
        41516707.440,4593163.619,22.564;%�Ϸ羮V??
        41520815.875,4597384.576,25.468;%���ϳ���X 
          ];
%     point=[
%        
%          41519304.125,4595913.485,23.921;%��ҵ�㳡Z1  7.7 7.11 7.11
%          41517290.037,4599537.326,24.565; %����R2
%          41518060.298,4594304.927,21.926;%������U3
%          41520207.356,4597983.404,22.661;%�������W4
%          41520815.875,4597384.576,25.468;%���ϳ���X5 
%          41519926.476,4597275.978,20.705 %��ҩ��Y6
%          41518099.807,4595388.504,22.776;%�����T4
%          41516836.655,4596627.472,21.545;%������S??
%          41516707.440,4593163.619,22.564;%�Ϸ羮V??
%         
%           ];
%     point = [
%         41517290.037,4599537.326,  24.565; % ����R1 7.28 7.29 7.30
%         41520207.356,4597983.404,  22.661; % �������W2
%         41518060.298,4594304.927,  21.926; % ������U3
%         41518099.807,4595388.504,  22.776; % �����T4
%         41519926.476,4597275.978,  20.705 % ��ҩ��Y5
%         41519304.125,4595913.485,  23.921; % ��ҵ�㳡Z6
%         41516836.655,4596627.472,  21.545; % ������S??
%         41516707.440,4593163.619,  22.564; % �Ϸ羮V??
%         41520815.875,4597384.576,  25.468; % ���ϳ���X
%         ];
    point(:,1)=point(:,1)-41510000;
    point(:,2)=point(:,2)-4590000;
    all(:)=0;
    count=1;
    fileNameArr{:}=' ';
    [ReadTxtFileName1,ReadTxtPath1,~] = uigetfile({'*.csv;*.txt','File(*.txt,*.csv)';'*.avi','AVIVideoFile(*.avi)';'*.*','AllFile(*.*)'},'ReadCSVFile',...
    'MultiSelect','on',...       %�Ƿ��ܹ���ѡ,'off'��֧�ֶ�ѡ�� 'on'֧�ֶ�ѡ
    'C:\Users\yjk\Desktop\��������\����'); %����Ĭ��·��'C:\Users\yjk\Desktop\'
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
    ch2=load(txtPath1);%����ȫ·�� %�ռ�����csv�ļ��е���������
    [~,B]=xlsread(txtPath1);
    leng=1;
    for i=2:length(ch2(1,:))
        if(mod(i-1,8)==0)
           ratioName(count,:)=['Test',num2str(ch2(1,i))];%��ȡ̨վ��
           motipos(count)=ch2(1,i-1);%��ʱ
           all(count,1:3)=point(ch2(1,i),:);
           all(count,4)=motipos(count)/5000;
           z3(:,count)=ch2(:,i-2);%�������Z
           count=count+1;%count��̨վ��
        end
    end
        %----------------------------------------------------------
       all=all(1:5,:)
%        length(all(:,1))
        %-----------------------------------------------
    fid=fopen('mic.csv','w');
    csvwrite('mic.csv',all);
    fclose(fid);
    result=Star3(all);
    result
    for i=1:length(all(:,1))
        t(i)=all(i,4)-((all(i,1)-result(1,1))^2+(all(i,2)-result(1,2))^2+(all(i,3)-result(1,3))^2)^0.5/3850;
    end
    tt=mean(t(:));
    set(handles.text41,'String',num2str(result(1,1)))
    set(handles.text42,'String',num2str(result(1,2)))
    set(handles.text43,'String',num2str(result(1,3)))

    [max3Z,~]=(max(z3(:,:)));
    for i=1:length(z3(1,:))
        han =eval([handleName,num2str(i)]);
        axes(han);
        cla; hold on;
        plot(z3(:,i),'color','k');%����
        if i~=length(z3(1,:))
            set(gca, 'XColor','white');
            set(gca, 'XTick', []);
        else
            time=roundn(linspace(0,74994,8)/5000,-2);
            set(gca,'xtick',0:10000:74994);
            set(gca,'xticklabel',time);
        end
        plot([motipos(i),motipos(i)],[-max3Z(i),max3Z(i)],'color','r');%��ֱ��
        plot([0,length(z3(:,i))],[0,0],'color',darkBlue);
        title([ratioName(i,:),' ��������']);zoom xon;hold off;
        han2 = eval([handleName_tzv,num2str(i)]);
        set(han2,'String',motipos(i));
    end
    han =eval([handleName,'20']);
    axes(han);

    scatter(point(:,1),point(:,2),150,'x');
    hold on;
%     scatter(4510.22,7794.97,200,'fill','g')
%     hold on;
%     scatter(7794.97,4510.22,200,'fill','y')
%     hold on;
    scatter(all(:,1),all(:,2),150,'x');
    hold on;
    scatter(result(:,1),result(:,2),200,'fill','r');
    hold on;

    line1 = [
        41516934,4598553; 
        41517126,4598553; 
        41516933,4597045; 
        41517128,4597045; 
    ];
    line1(:,1)=line1(:,1)-41510000;
    line1(:,2)=line1(:,2)-4590000;
    % scatter(line1(:,1),line1(:,2))
    % hold on;
    text(line1(1,1)-300,line1(1,2)+200,'��������1208������')
    line([line1(1,1),line1(2,1)],[line1(1,2),line1(2,2)],'linewidth',2,'color','y')
    hold on;
    line([line1(1,1),line1(3,1)],[line1(1,2),line1(3,2)],'linewidth',2,'color','y')
    hold on;
    line([line1(3,1),line1(4,1)],[line1(3,2),line1(4,2)],'linewidth',2,'color','y')
    hold on;
    line([line1(4,1),line1(2,1)],[line1(4,2),line1(2,2)],'linewidth',2,'color','y')
    hold on;
    line2 = [
        41518275,4597614; 
        41519228,4597615; 
        41518274,4597435; 
        41519228,4597435; 
    ];
    line2(:,1)=line2(:,1)-41510000;
    line2(:,2)=line2(:,2)-4590000;
    % scatter(line2(:,1),line2(:,2))
    % hold on;
    text(line2(1,1),line2(1,2)-400,'��������1210������')
    line([line2(1,1),line2(2,1)],[line2(1,2),line2(2,2)],'linewidth',2,'color','c')
    hold on;
    line([line2(1,1),line2(3,1)],[line2(1,2),line2(3,2)],'linewidth',2,'color','c')
    hold on;
    line([line2(3,1),line2(4,1)],[line2(3,2),line2(4,2)],'linewidth',2,'color','c')
    hold on;
    line([line2(4,1),line2(2,1)],[line2(4,2),line2(2,2)],'linewidth',2,'color','c')
    hold on;
    line3 = [
        41516897,4596105;
        41518438,4596105; 
        41516896,4595906; 
        41518438,4595906; 
    ];
    line3(:,1)=line3(:,1)-41510000;
    line3(:,2)=line3(:,2)-4590000;
    % scatter(line3(:,1),line3(:,2))
    % hold on;

    text(line3(1,1)+300,line3(1,2)-400,'��������703������')
    line([line3(1,1),line3(2,1)],[line3(1,2),line3(2,2)],'linewidth',2,'color','m')
    hold on;
    line([line3(1,1),line3(3,1)],[line3(1,2),line3(3,2)],'linewidth',2,'color','m')
    hold on;
    line([line3(3,1),line3(4,1)],[line3(3,2),line3(4,2)],'linewidth',2,'color','m')
    hold on;
    line([line3(4,1),line3(2,1)],[line3(4,2),line3(2,2)],'linewidth',2,'color','m')
    hold on;
%     %-------------

    str1=char(B(1,1));
    fen=strsplit(str1,':');
    a=char(fen(1));
    b=char(fen(2));
    c=char(fen(3));
    c=str2double(c)+tt;
    if c>=60
          b=str2double(b)+1;
          b=num2str(b);
          c=c-60;
    end
    d=[a,':',b,':',num2str(c)];
    set(handles.text44,'String',d)
%     %------------
%     set(handles.text44,'String',num2str(tt))

    
    
    shift_z3 = shiftValue(z3);%ÿһ�е�ƽ��ֵ
    for i=1:length(z3(1,:))
        han1 = eval([handleName_tz,num2str(i)]);
        set(han1,'String',shift_z3(i));
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
global z3;
txtPath1=' ';
for i=1:numberofSensors-1
    han =eval([handleName,num2str(i)]);
    axes(han);cla;title('');
    set(gca, 'XTick', []);
    set(gca, 'XColor','black');
    set(gca, 'XTick', 0:0.1:1);
end
han =eval([handleName,'20']);
axes(han);cla;title('');
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
    set(handles.text41,'String','');
    set(handles.text42,'String','');
    set(handles.text43,'String','');
    set(handles.text44,'String','');
clear global z3;


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
    
    for i=1:6
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
    print(ratioName)
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
global darkBlue;global lightGreen;
global handleName;
global z3;global motipos;global ratioName;
global handleName_tzv;
global point;
global all;

checkbox2Status = get(handles.checkbox2,'value');
if(length(z3(:,1))>10000)
    for i=1:6
        han =eval([handleName,num2str(i)]);
        axes(han);
        cla;title('');
    end
    if(checkbox2Status==1)
        for i=1:length(z3(1,:))
            [~,position3(i,:)] = SL_window(z3(:,i));
        end
        [max3Z,~]=(max(z3(:,:)));
        for i=1:length(z3(1,:))
            han =eval([handleName,num2str(i)]);
            axes(han);
            cla; hold on;
            plot(z3(:,i),'color',lightGreen);%������
            %plot the motipos along.
            for j=1:length(position3)
                if(position3(i,j)==1)
                    plot([j,j],[-max3Z(i),max3Z(i)],'color','k');%��ֱ��
                    han2 = eval([handleName_tzv,num2str(i)]);
                    all(i,4)=j/5000;
                    set(han2,'String',j);
                end
            end
            plot([motipos(i),motipos(i)],[-max3Z(i),max3Z(i)],'color','r');%��ֱ��
            plot([0,length(z3(i,:))],[0,0],'color',darkBlue);
            title([ratioName(i,:),' ��123ͨ������']);zoom xon;hold off;

        end
    else
        [max3Z,~]=(max(z3(:,:)));
        for i=1:length(z3(1,:))
            han =eval([handleName,num2str(i)]);
            axes(han);
            cla; hold on;
            plot(z3(:,i),'color','k');   
            plot([motipos(i),motipos(i)],[-max3Z(i),max3Z(i)],'color','r');%��ֱ��
            plot([0,length(z3(:,i))],[0,0],'color',darkBlue);
            title([ratioName(i,:),' ��123ͨ������']);zoom xon;hold off;
            han2 = eval([handleName_tzv,num2str(i)]);
            set(han2,'String',motipos(i));
        end
        fid=fopen('mic.csv','w');
        csvwrite('mic.csv',all);
        all(:,4)
        fclose(fid);
        result=Star3(all);
        for i=1:length(all(:,1))
            t(i)=all(i,4)-((all(i,1)-result(1,1))^2+(all(i,2)-result(1,2))^2+(all(i,3)-result(1,3))^2)^0.5/3850;
        end
        set(handles.text41,'String',num2str(result(1,1)))
        set(handles.text42,'String',num2str(result(1,2)))
        set(handles.text43,'String',num2str(result(1,3)))
        set(handles.text44,'String',num2str(tt))

       han =eval([handleName,'20']);
    axes(han);

    scatter(point(:,1),point(:,2));
    hold on;

    scatter(all(:,1),all(:,2),'r');
    hold on;
    scatter(result(:,1),result(:,2),'x');
    hold on;

    line1=[
            4598553,41516934;
            4598553,41517126;
            4597045,41516933;
            4597045,41517128;
         ];
    % scatter(line1(:,1),line1(:,2))
    % hold on;
    text((line1(1,1)+line1(4,1))/2,(line1(1,2)+line1(4,2))/2,'��������1208������')
    line([line1(1,1),line1(2,1)],[line1(1,2),line1(2,2)],'linewidth',2,'color','r')
    hold on;
    line([line1(1,1),line1(3,1)],[line1(1,2),line1(3,2)],'linewidth',2,'color','r')
    hold on;
    line([line1(3,1),line1(4,1)],[line1(3,2),line1(4,2)],'linewidth',2,'color','r')
    hold on;
    line([line1(4,1),line1(2,1)],[line1(4,2),line1(2,2)],'linewidth',2,'color','r')
    hold on;
    line2=[
           4597614,41518275;
           4597615,41519228;
           4597435,41518274;
           4597435,41519228;
        ];
    % scatter(line2(:,1),line2(:,2))
    % hold on;
    text((line2(1,1)+line2(4,1))/2,(line2(1,2)+line2(4,2))/2,'��������1210������')
    line([line2(1,1),line2(2,1)],[line2(1,2),line2(2,2)],'linewidth',2,'color','c')
    hold on;
    line([line2(1,1),line2(3,1)],[line2(1,2),line2(3,2)],'linewidth',2,'color','c')
    hold on;
    line([line2(3,1),line2(4,1)],[line2(3,2),line2(4,2)],'linewidth',2,'color','c')
    hold on;
    line([line2(4,1),line2(2,1)],[line2(4,2),line2(2,2)],'linewidth',2,'color','c')
    hold on;
    line3=[
        4596105,41516897;
        4596105,41518438;
        4595906,41516896;
        4595906,41518438; 
        ];
    % scatter(line3(:,1),line3(:,2))
    % hold on;

    text((line3(1,1)+line3(4,1))/2,(line3(1,2)+line3(4,2))/2,'��������703������')
    line([line3(1,1),line3(2,1)],[line3(1,2),line3(2,2)],'linewidth',2,'color','m')
    hold on;
    line([line3(1,1),line3(3,1)],[line3(1,2),line3(3,2)],'linewidth',2,'color','m')
    hold on;
    line([line3(3,1),line3(4,1)],[line3(3,2),line3(4,2)],'linewidth',2,'color','m')
    hold on;
    line([line3(4,1),line3(2,1)],[line3(4,2),line3(2,2)],'linewidth',2,'color','m')
    hold on;
%     %-------------
%     ch2(1,1)
%     ch2(:,1)
%     str1=str(ch2(1,1))
%     fen=strsplit(str1,':')
%     a=char(fen(1))
%     b=char(fen(2))
%     c=char(fen(3))
%     c=str2double(c)+tt
%     if c>=60
%           b=str2double(b)+1
%           b=num2str(b)
%           c=c-60
%     end
%     d=[a,':',b,':',num2str(c)]
%     %------------
    set(handles.text44,'String',num2str(tt))
    end
end
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
