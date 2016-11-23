clc; clear;
N_sat=18;
N_planes=9;
h=545;
I=15;
phase=26;
t=0:10:24*2*60;
e_min=10;
lambda=70;
mu=0:120:240; long=length(mu);
lat=length(lambda);
l=length(t);

Xs=Orbital_position(N_sat,N_planes,h,I,phase,t);
L=zeros(lat,l);

for i=1:long
    Xg=Ground_position(lambda,mu(i),t);
    [L(i,:)]=Links(Xs,Xg,e_min);
end

%%
figure; plot(t/60,L); legend 0º 120º 240º; xlabel('time (h)'); ylabel('links');
