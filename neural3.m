clc; close all; clear all;

x=;

h=[0.05 0.1 0.15 0.2 0.25 0.3 0.35 0.4 0.45 0.5 0.55 0.6 0.65 0.70];
%h=[0.05 0.1 0.15];
%h1=logsig(h);

wh1=[0.0001 0.0001 0.0001];
wh2=[0.0001 0.0001 0.0001];
wh3=[0.0001 0.0001 0.0001];

w2=[0.0001 0.0001 0.0001];
bias_1=[0.0001 0.0001 0.0001]; % needs to be fed to 3 hidden layers
bias_2=0.0001;  % fed to only output layer

lr1=10;
lr2=10;
%mse11=[];

for n1=1:1:20000
    for n=0:1:length(x)-4
        i1=x(1,1+n:3+n);
        %i1=h;
        y_actual=x(n+4);
        %y_actual=0.38;
        mse=[];
        mse1=[];
        mse_b1=[];
        mse_b2=[];
        
        %multiplication of input and weights
        zh1=sum(i1.*wh1)+bias_1(1);
        zh2=sum(i1.*wh2)+bias_1(2);
        zh3=sum(i1.*wh3)+bias_1(3);
        zh=[zh1 zh2 zh3];
        %applying sigmoid function
        ph1 = logsig(zh1);
        ph2 = logsig(zh2);
        ph3 = logsig(zh3);
        ph=[ph1 ph2 ph3];
        %input to output layer
        y_cap= sum(ph.*w2)+bias_2;

        %output of output layer
        z_cap= logsig(y_cap);

        %calculating error for input layer
        for j=1:1:3
           first_term= (z_cap-y_actual)*(exp(-y_cap))*((1+exp(-y_cap))^-2);
           sec_term=i1(j);
           third_term=w2(j)*exp(-zh(j))*((1+exp(-zh(j)))^-2);
           error = first_term*sec_term*third_term;
           mse = [mse error];
        end
        %weights update of input layer
        err = sum(mse(:));
        for k=1:1:3
          wh1(k)=wh1(k)-lr1*err;
          wh2(k)=wh2(k)-lr1*err;
          wh3(k)=wh3(k)-lr1*err;
        end
        
        %calculating error for input bias_1
        for j=1:1:3
           first_term_b1= (z_cap-y_actual)*(exp(-y_cap))*((1+exp(-y_cap))^-2);
           sec_term_b1=bias_1(j);
           third_term_b1=w2(j)*exp(-zh(j))*((1+exp(-zh(j)))^-2);
           error_b1 = first_term_b1*sec_term_b1*third_term_b1;
           mse_b1 = [mse_b1 error_b1];
        end
        %weights update of input layer
        err_b1 = sum(mse_b1(:));
        for k=1:1:3
          bias_1(k)=bias_1(k)-lr1*err_b1;
        end
        
        
        %calculating error for output layer
        for j=1:1:3
           first_term1= (z_cap-y_actual)*(exp(-y_cap))*((1+exp(-y_cap))^-2);
           sec_term1=((1+exp(-zh(j)))^-1);
           error1 = first_term1*sec_term1;
           mse1 = [mse1 error1];
        end
        %weights update of output layer
        err1 = sum(mse1(:));
        for k=1:1:3
          w2(k)=w2(k)-lr2*err1;
        end
        
        
         %calculating error for output layeer bias_2
        for j=1:1:1
           first_term_b2= (z_cap-y_actual)*(exp(-y_cap))*((1+exp(-y_cap))^-2);
           sec_term_b2=bias_2;
           error_b2 = first_term_b2*sec_term_b2;
           mse_b2 = [mse_b2 error_b2];
        end
        %weights update of output layer
        err_b2 = sum(mse_b2(:));
        for k=1:1:1
          bias_2(k)=bias_2(k)-lr2*err_b2;
        end
    end
end

i1=[0.59868765,0.62245935,0.64565629];
%0.66818780
    %multiplication of input and weights
    zh1_new=sum(i1.*wh1)+bias_1(1);
    zh2_new=sum(i1.*wh2)+bias_1(2);
    zh3_new=sum(i1.*wh3)+bias_1(3);
    zh_new=[zh1_new zh2_new zh3_new];
    %applying sigmoid function
    ph1_new = logsig(zh1_new);
    ph2_new = logsig(zh2_new);
    ph3_new = logsig(zh3_new);
    ph_new=[ph1_new ph2_new ph3_new];
    %input to output layer
    y_cap_new= sum(ph1_new*w2)+bias_2;
    
    %output of output layer
    z_cap_new= logsig(y_cap_new);

    disp(z_cap_new);