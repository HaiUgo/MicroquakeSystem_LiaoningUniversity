function E=Energy(VarName1)
%     VarName1 = [0.1,0.2,0.3];
    len=length(VarName1);
    z=[1:len];
    zz=[1:10:len];
    yy= interp1(z,VarName1,zz,'spline');
    Fs=5000;
    NN=4501;
    x=yy';
    t=[1:NN];
    [imf]=emd(x);
    L=size(imf,1);
    E=0;
    for i=1:L
       E=sum(imf(i,:).^2).*1/Fs+E;
    end
    
end