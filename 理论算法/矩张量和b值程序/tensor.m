% clc;
clear;
close all;
file = 'sample.txt';
a=load('I:\�о����׶�\��ɽ\���³���\MicroquakeSystem_LiaoningUniversity\�����㷨\��������bֵ����\fn_sta1.txt');
b=fopen('I:\�о����׶�\��ɽ\���³���\MicroquakeSystem_LiaoningUniversity\�����㷨\��������bֵ����\quake source info.txt');
c=fopen('I:\�о����׶�\��ɽ\���³���\MicroquakeSystem_LiaoningUniversity\�����㷨\��������bֵ����\channel info.txt');
fid=fopen('I:\�о����׶�\��ɽ\���³���\MicroquakeSystem_LiaoningUniversity\�����㷨\��������bֵ����\consequence.txt','wt');
tongdao=[];
i=1;

e1='Pdc';e2='dr';e3='l';e4='n';
fprintf(fid,'%s  %s  %s  %s  %s\n',e1,e2,e3,e4);
%quake source coordination.
% len = length(a(:,1));

for i=1:length(a(:,1))
    x(i,1) = a(i,2);
    x(i,2) = a(i,3);
    x(i,3) = a(i,4);
end
i=1;
while ~feof(b)%quake source Info.
    while ~feof(c)%each sensor's Info.
        
        tlinec = fgetl(c);
        tlinec=str2num(tlinec);
        if tlinec(1,1)==i
            tongdao=[tongdao;tlinec]; %tongdao only need the column 2 and 4.
        else
            tlineb = fgetl(b);%quake info.
            tlineb=str2num(tlineb);%only need the coordination of quake source.
            y1=tlineb(1,2);y2=tlineb(1,3);y3=tlineb(1,4);
            
            for i=1:length(x)
                gama(i,1) = (x(i,1)-y1)/(((x(i,1)-y1)^2+(x(i,2)-y2)^2+(x(i,3)-y3)^2)^0.5);
                gama(i,2) = (x(i,2)-y2)/(((x(i,1)-y1)^2+(x(i,2)-y2)^2+(x(i,3)-y3)^2)^0.5);
                gama(i,3) = (x(i,3)-y3)/(((x(i,1)-y1)^2+(x(i,2)-y2)^2+(x(i,3)-y3)^2)^0.5);
            end

            tongdao=sortrows(tongdao,2);
            [m,n]=size(tongdao);
            displacement=ones(m,3)*nan;
            tdh=tongdao(:,2);% sort of the sensor according to the series of sensor. 
            fd=tongdao(:,4);% the max amplitude value of each motivated sensor.
            for r=1:3
             displacement(:,r)=fd;
            end
            gama1=gama(tdh,:);
            displacement=displacement.*gama1;
            displacement=reshape(displacement,3*m,1);
            c=1;
            for r=1:3:length(gama)*3
                g(r,1)=gama(c,1)*gama(c,1)*gama(c,1);g(r+1,1)=gama(c,2)*gama(c,1)*gama(c,1);g(r+2,1)=gama(c,3)*gama(c,1)*gama(c,1);
                g(r,2)=2*gama(c,1)*gama(c,1)*gama(c,2);g(r+1,2)=2*gama(c,2)*gama(c,1)*gama(c,2);g(r+2,2)=2*gama(c,3)*gama(c,1)*gama(c,2);
                g(r,3)=2*gama(c,1)*gama(c,1)*gama(c,3);g(r+1,3)=2*gama(c,2)*gama(c,1)*gama(c,3);g(r+2,3)=2*gama(c,3)*gama(c,1)*gama(c,3);
                g(r,4)=gama(c,1)*gama(c,2)*gama(c,2);g(r+1,4)=gama(c,2)*gama(c,2)*gama(c,2);g(r+2,4)=gama(c,3)*gama(c,2)*gama(c,2);
                g(r,5)=2*gama(c,1)*gama(c,2)*gama(c,3);g(r+1,5)=2*gama(c,2)*gama(c,2)*gama(c,3);g(r+2,5)=2*gama(c,3)*gama(c,2)*gama(c,3);
                g(r,6)=gama(c,1)*gama(c,3)*gama(c,3);g(r+1,6)=gama(c,2)*gama(c,3)*gama(c,3);g(r+2,6)=gama(c,3)*gama(c,3)*gama(c,3); 
                c=c+1;
            end
            c=1;
            for r=1:3:length(g)
                g(r,:) = g(r,:)./(((x(c,1)-y1)^2+(x(c,2)-y2)^2+(x(c,3)-y3)^2)^0.5);
                g(r+1,:) = g(r+1,:)./(((x(c,1)-y1)^2+(x(c,2)-y2)^2+(x(c,3)-y3)^2)^0.5);
                g(r+2,:) = g(r+2,:)./(((x(c,1)-y1)^2+(x(c,2)-y2)^2+(x(c,3)-y3)^2)^0.5);
                c=c+1;
            end
            
           
            coordinate = g;
            
            tdh1=[tdh*3-1;tdh*3-2;tdh*3];
            tdh1=sortrows(tdh1);
            coordinate=coordinate(tdh1,:);


            density=2650;
            velocity=4100;
            Green=coordinate./(4*pi*density*(velocity^3));%coordinate为坐标矩阵；density为密度；r为震源到台站的距离；velocity为P波波�?;*r
            % Green=Green.^-1;
            %inv(A'*A)*A'*B'
            M=Green\displacement;%M为矩张量；displacement为位移u；Green为格林函�?
            m11=M(1,1);m12=M(2,1);m13=M(3,1);m22=M(4,1);m23=M(5,1);m33=M(6,1);
            m21=m12;m31=m13;m32=m23;
            M1=[m11 m12 m13;m21 m22 m23;m31 m32 m33];
            %%矩张量分�?
            [V,D]=eig(M1);%D为特征�?�，V为特征向�?;矩阵V的每�?列对应一个特征向�?
            [D_sort,index] = sort(diag(D),'descend');%给特征�?�排�?
            D_sort = D_sort(index);
            V_sort = V(:,index);
            m1=D_sort(1,1);%�?大特征�??
            m2=D_sort(2,1);
            m3=D_sort(3,1);%�?小特征�??
            Miso=(m1+m2+m3)/3/m1;
            Mdc=(m2-m3)/m1;
            Mclvd=(2*m1+2*m3-4*m2)/3/m1;
            Pdc=abs(Mdc)/(abs(Miso)+abs(Mdc)+abs(Mclvd));

            %%破裂方位及破裂面
            v1=V_sort(:,1);
            v2=V_sort(:,2);
            v3=V_sort(:,3);
            l=v1.*sqrt((m1-m2)/(m1-m3))+v3.*sqrt((m2-m3)/(m1-m3));%运动方向
            n=v1.*sqrt((m1-m2)/(m1-m3))-v3.*sqrt((m2-m3)/(m1-m3));%法向方向

            %%计算相对裂缝体积
            mkk=m1+m2+m3;
            % l=l';n=n';
            % lk=sqrt(sum(l.*l));
            % nk=sqrt(sum(n.*n));
            fx=dot(l,n);
            dr=mkk/fx;
            dr=dr/(10^20);

            % fprintf(fid,'%8.4f  %8.4f  %8.4f\n',M');
            fprintf(fid,'%f  ',Pdc);
            fprintf(fid,'%f  ',dr);
            fprintf(fid,'%f  ',mkk);
            fprintf(fid,'%f  ',fx);
            fprintf(fid,'%8.4f  %8.4f  %8.4f ',l');
            fprintf(fid,'%8.4f  %8.4f  %8.4f\n ',n');
            i=i+1;
            tongdao=[];
            tongdao=[tongdao;tlinec];
        end
    end
end
fclose(b);
fclose(c);
fclose(fid);

