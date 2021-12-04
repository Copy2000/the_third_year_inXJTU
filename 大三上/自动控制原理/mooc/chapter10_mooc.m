clear all
clc;
%% 开环传递函数
num=[0,0,0,2.5];
den=[0.25,1.25,1,0];
H=tf(num,den);
figure(1)
margin(H)
grid on
%% 超前装置
hold on
num_c=[0.8732 1];
den_c=[0.3803 1];
H1=tf(num_c,den_c);
margin(H1)
%% 设计之后的
hold on
den=conv(den,[0.3803,1])
num=conv(num,[0.8732,1])/2.296
H2=tf(num,den);
margin(H2)