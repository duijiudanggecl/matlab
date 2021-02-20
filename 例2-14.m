P=[-0.5 -0.5 0.3 -0.1 -30;-0.5 0.5 -0.5 1.0 40];	%输入向量
T=[1 1 0 0 1];						%期望输出向量
plotpv(P,T);
%创建感知器神经网络
net=newp([-30,1;-1,40],1);
pause
plotpv(P,T);
linehandle=plotpc(net.IW{1},net.b{1});
cla;
plotpv(P,T);
linehandle=plotpc(net.IW{1},net.b{1});
%训练该网络
E=1;
net.adaptParam.passes=1;
net=init(net);
linehandle=plotpc(net.IW{1},net.b{1});
time=0							%循环的次数
while(sse(E))
    time=time+1
    [net,Y,E]=adapt(net,P,T);
    linehandle=plotpc(net.IW{1},net.b{1},linehandle);
    drawnow;
end;
pause
%检验该网络性能
p=[0.5;1.6];
a=net(p);
plotpv(p,a);
ThePoint=findobj(gca,'type','line');
set(ThePoint,'Color','red');
hold on;
plotpv(P,T);
plotpc(net.IW{1},net.b{1});
hold off;
axis([-2 2 -2 2]);
disp('End of percept2')