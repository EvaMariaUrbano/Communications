clc; clear;
N_sat=21;
N_planes=8;
h=545;
I=18;
phase=210/(N_planes-1);
t=0:5:24*60*2;
e_min=20;
lambda=57; lat=length(lambda);
mu=0:120:240; long=length(mu);
l=length(t);

Xs=Orbital_position(N_sat,N_planes,h,I,phase,t);
L=zeros(lat,l);

for i=1:long
    Xg=Ground_position(lambda,mu(i),t);
    [L(i,:)]=Links(Xs,Xg,e_min);
end


%%
figure; plot(t/60,L); legend 0º 120º 240º ; xlabel('time (h)'); ylabel('links');
