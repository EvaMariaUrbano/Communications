clc; clear;
N_sat=18;
N_planes=9;
h=500;
I=15;
mu=25;
t=0:5:24*60;
e_min=20;
lambda=0:30:90;
lat=length(lambda);
l=length(t);

Xs=Orbital_position(N_sat,N_planes,h,I,mu,t);
L=zeros(lat,l);

for i=1:lat
    Xg=Ground_position(lambda(i),t);
    [L(i,:)]=Links(Xs,Xg,e_min);
end

%%
figure; plot(t/60,L); legend 0º 30º 60º 90º; 
