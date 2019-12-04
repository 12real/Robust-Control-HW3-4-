%H无穷控制器设计(DGKF和LMI两种方法)
%输出包括控制器K的bode图、传递函数表达式、系统阶跃信号响应，干扰响应，加权函数、灵敏度等bode图
%根据相应的准则，适当调整加权函数W1（干扰响应）和W4（控制输入大小）
% w1sys=tf(0.6*[1 188.8],[1 1e-4]);%w1传函(低通)，增大了干扰
% w4sys=tf(20*[1 2.5e4],[1 5e6]);%w4传函(高通)，低频时控制量增大
clear;
s=tf('s');
omega=logspace(-2,6,100);
psys=nd2sys([3.87e7],[1 0 0]);%p传递函数
% w1sys=nd2sys(0.5*[1 125.7],[1 1e-4]);%w1传函
w1sys=nd2sys(0.6*[1 188.8],[1 1e-4]);%w1传函(低通)
wnum1=[1 1e4 5.7e7];
wden1=[1 1.2e4 4.04e8];
wsys1=nd2sys(wnum1,wden1);
w2sys=mmult(wsys1,wsys1,23.9);%mmult表示系统串联
w3sys=0.1;
% w4sys=nd2sys(10*[1 2.5e4],[1 5e5]);
w4sys=nd2sys(20*[1 2.5e4],[1 5e6]);%w4传函(高通)

systemnames='psys w1sys w2sys w3sys w4sys';
inputvar='[r1;r2;u]';
outputvar='[w1sys;w2sys;w4sys;-r2-psys]';
input_to_psys='[u+w3sys]';
input_to_w1sys='[r2+psys]';
input_to_w2sys='[psys]';
input_to_w3sys='[r1]';
input_to_w4sys='[u]';
sysoutname='gpsys';
cleanupsysic='yes';
sysic;

[k,cl]=hinfsyn(gpsys,1,1,1e-1,1e5,1e-3);% DGKF

% [gopt,k]=hinflmi(gpsys,[1 1]);% LMI

% [ak1,bk1,ck1,dk1]=branch(k1);
% [ak2,bk2,ck2,dk2]=branch(k2);
[ak,bk,ck,dk]=branch(k);

figure(1)
clf;
bode(ak,bk,ck,dk);
% hold on;
% bode(ak2,bk2,ck2,dk2);
grid;
%hold on;

%%%阶跃响应%%%
systemnames='psys k';
inputvar='[r2]';
outputvar='[-psys]';
input_to_psys='[k]';
input_to_k='[-r2-psys]';
sysoutname='clsys';
cleanupsysic='yes';
sysic;

[acl,bcl,ccl,dcl]=branch(clsys);
figure(2);
clf;
step(acl,bcl,ccl,dcl)

%%%干扰响应%%%
systemnames='psys k';
inputvar='[d1]';
outputvar='[psys]';
input_to_psys='[k+d1]';
input_to_k='[-psys]';
sysoutname='dlsys';
cleanupsysic='yes';
sysic;

[ac2,bc2,cc2,dc2]=branch(dlsys);
figure(3);
clf;
step(ac2,bc2,cc2,dc2)

%%%鲁棒性能检验%%%
systemnames='psys k';
inputvar='[r2]';
outputvar='[-r2-psys]';
input_to_psys='[k]';
input_to_k='[-r2-psys]';
sysoutname='elsys';
cleanupsysic='yes';
sysic;%%%S

systemnames='psys k';
inputvar='[r2]';
outputvar='[k]';
input_to_psys='[k]';
input_to_k='[-r2-psys]';
sysoutname='flsys';
cleanupsysic='yes';
sysic;%%%KS

systemnames='psys k';
inputvar='[r2]';
outputvar='[-psys]';
input_to_psys='[k]';
input_to_k='[-r2-psys]';
sysoutname='glsys';
cleanupsysic='yes';
sysic;%%%T

[ac3,bc3,cc3,dc3]=branch(elsys);
[ac4,bc4,cc4,dc4]=branch(flsys);
[ac5,bc5,cc5,dc5]=branch(glsys);
w1sys=tf(0.6*[1 188.8],[1 1e-4]);%w1传函
% w1systest=tf(0.6*[1 188.8],[1 1e-4]);%w1传函(低通)
% w4systest=tf(20*[1 2.5e4],[1 5e6]);%w4传函(高通)
wnum1=[1 1e4 5.7e7];
wden1=[1 1.2e4 4.04e8];
wsys1=tf(wnum1,wden1);
w2sys=series(23.9*wsys1,wsys1);
w3sys=0.1;
w4sys=tf(20*[1 2.5e4],[1 5e6]);
figure(4);
bode(ac3,bc3,cc3,dc3)
hold on
bode(ac4,bc4,cc4,dc4)
hold on
bode(ac5,bc5,cc5,dc5)
hold on
bode(w1sys)
hold on
bode(w4sys)
hold on
bode(w2sys)
legend('S','KS','T','w1','w4','w2');

[b,a]=ss2tf(ak,bk,ck,dk);
G=tf(b,a)%求取控制器的传递函数
