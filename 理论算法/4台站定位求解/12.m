clear all
clc
format long g; %������ΪС��

   
%�趨��֪����ֵ
x(1)=-2061; y(1)=498;  z(1)=-75; r(1)=-0.153434*3850;
x(2)=-1044; y(2)=574; z(2)=-45; r(2)=-0.292645*3850;
x(3)=-3414; y(3)=1836; z(3)=-75; r(3)=-0.695784*3850;
syms xx yy zz rr %�趨δ֪��
D=[x(1),y(1),z(1); x(2),y(2),z(2); x(3),y(3),z(3)];
dett=det(D); %��D������ʽ��
if (dett==0)
    disp('����ʽΪ0');
    return
end
for i=1:3
    bb=0.5*(x(i)^2 + y(i)^2 + z(i)^2 - r(i)^2) + r(i)*rr ;   %  ���b�Ĵ���ʽ
    if i==1
        b1=bb;
    elseif i==2
        b2=bb;
    else
        b3=bb;
    end  
end
D1=[b1,y(1),z(1);b2,y(2),z(2);b3,y(3),z(3)];
D2=[x(1),b1,z(1);x(2),b2,z(2);x(3),b3,z(3)];
D3=[x(1),y(1),b1;x(2),y(2),b2;x(3),y(3),b3];
xx=det(D1)/det(D);
yy=det(D2)/det(D);
zz=det(D3)/det(D);
jf = xx^2+ yy^2 + zz^2 - rr^2 ;
 jf=char(jf);%��jf�Ĵ���ʽת��Ϊ�ַ�������ʽ���Ա����г���д�ɵ�ʽ��ʽ���з������
dengshi1=strcat(jf,'=0');   %�����ַ����ĺ������õ�jf=0����ʽ
rr1=solve(dengshi1,'rr');   %������rr
rr=rr1(1) ;  %�õ���rr1��������ȡ����һ����
xx1=subs(xx,'rr',rr) ; %��xx����ʽ�е�rr����ֵ��rr��ֵ���棬�õ�xx����ֵxx1����ͬ
yy1=subs(yy,'rr',rr) ;
zz1=subs(zz,'rr',rr) ;
vpa(rr/3850,5) %����5λ��ЧС��
vpa(xx1,5)
vpa(yy1,5)
vpa(zz1,5)





