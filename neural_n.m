clc; close all; clear all;
i=1.5;
w=0.8;
lr=0.1;

act_y=0.8;
for n=1:1:25
%pred_y=i*w;
der_err = i*2*(i*w-act_y);
w=w-lr*der_err;
end

y_actual=i*w;

i1=[0.05 0.10];
w1=[0.15 0.2];
act_y1=0.93;
%mse11=[];

for n1=1:1:5000000
    mse11=[];
    val=sum(i1.*w1);
    www = logsig(val);
    for j=1:1:2
       der_err = i1(j)*exp(-val)*((1+exp(-val))^-2)*(www-act_y1);
       mse11 = [mse11 der_err];
    end
    der_err = sum(mse11(:));
    for k=1:1:2
      w1(k)=w1(k)-lr*der_err;
    end
end
act=w1.*i1;
disp(logsig(sum(act)));