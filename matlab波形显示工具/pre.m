function newch1=pre(ch11)
newch1(:)=0;%�½�һ�����δ洢����
k=60;
l = length(ch11(:,1))-k;%���ȼ�kΪ�˱�������Խ��
sum1=0;%���
newch1 = filter(ones(1,k)/k,1,ch11);
% for i=1:l
%    for j=i:i+k%������������ѭ����ͬʱ����4�����������ֵ��Сֵ֮��������ƽ��ֵ
%        [minch,ind1]=min(ch11(i:i+k,1));%��ch11��ÿ6���������ֵ����Сֵ���������ǵ���ż�¼��ind1��ind2��
%        [maxch,ind2]=max(ch11(i:i+k,1));
%        if(j~=ind1 && j~=ind2)%ind1��ind2����ʵ�ʵ�λ�ã���j��������������ţ��Ž�ֵ����ٷ���sum
%            sum1=sum1+ch11(j,1);
%        end
%    end
%    newch1(i) = sum1/(k-2);sum1=0;%��sum��������ƽ��������ȡ
%    
% end
% for i=length(newch1):length(ch11)
%     newch1(i) = 0;
% end
% fprintf('newch1%d',length(newch1));
% fprintf('ch11%d',length(ch11));

