function result=Star3(all)
% clc;
% % clear all;
% load mic.csv;
sample=all;
sample
del=sample(1,:);
for i=1:4
    sample(:,i)=sample(:,i)-sample(1,i);
end
v=3850;%ϵͳ�ٶ�
k=length(sample(:,1));
diedai=200;%��������
lead=30;%���ص���
xxyy=1000;%xy���
zz=100;%z���
xylon=10000/xxyy+1;
zlon=1000/zz+1;
long=xylon*xylon*zlon;%ģ���������
show_one=ones(diedai,6);
fv=zeros(long,4);
len=1;
for i1=1:zlon
    for i2=1:xylon
        for i3=1:xylon
            fv(len,1)=(i3-1)*xxyy;
            fv(len,2)=(i2-1)*xxyy;
            fv(len,3)=(i1-1)*zz;
            len=len+1;
        end
    end
end
fv(:,1)=fv(:,1)-6000;
fv(:,2)=fv(:,2)-4000;
fv(:,3)=fv(:,3)-4000;
for ii=1:long
    fv(ii,:)=mubiao3(fv(ii,1:3),sample,v);
end
fv=sortrows(fv,4);%��С�鰴�����ֵ����
[ff,one]=mysort3(fv,sample,v,diedai,lead);%һ��Ѱ��
show_one=one;
suan1(1,:)=ff(1,:);
result=ones(1,3);
result(1,1:3)=suan1(1,1:3)+del(1,1:3);


