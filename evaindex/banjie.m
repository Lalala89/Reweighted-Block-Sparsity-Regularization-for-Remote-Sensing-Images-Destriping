function [NonP_Stripe,S]   =  banjie(Ori,rate,mean)
%% 
%case1:
%%%%%%%%%%%%%%%%%%%%-----------Chang creat stripe noise---------%%%%%%
%��1����10�������������ʼ�У�Ȼ����10Ϊ���ڼ���������
%ǰ�����ͬʱ����һ���̶�������mean
%�������ͬʱ��ȥһ���̶�������mean
%������Ч���Ϳ��Դﵽ�ӵ���������Ϊ1
rand('seed',2);
[Row, Col] = size(Ori);
S=zeros(Row,Col);
Location = randperm(Col,round(rate*Col));
Location1 = randperm(Row,round(rate*Row));
for i=1:round(rate*Row)/2
S(1:Location1(i),Location(i))=mean;
end
for i=round(rate*Row)/2+1:round(rate*Row)
S(1:Location1(i),Location(i))=-mean;
end
NonP_Stripe=Ori+S;
%%
 %case2  ��   �����ϵ�ֵ��ͬ�����ǲ�ͬ�����ϵ�ֵ��ͬ(�����и���������Ҳ���Դﵽ��������Ϊ1
%  rand('seed',1);
% [Row, Col] = size(Ori);
% Location = randperm(Col,round(rate*Col));
% u=randi([0 100],1,length(Location));
% S=zeros(Row,Col);
% S(:,Location(1:round(rate*Col/2)))=S(:,Location(1:round(rate*Col/2)))...
%     + repmat(u(1:round(rate*Col/2)),Row,1);
% S(:,Location(round(rate*Col/2)+1:round(rate*Col)))=...
%            S(:,Location(round(rate*Col/2)+1:round(rate*Col))) - repmat(u(round(rate*Col/2)+1:length(Location)),Row,1);
%  NonP_Stripe=Ori+S;