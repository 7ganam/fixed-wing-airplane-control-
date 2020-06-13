% function state_dot=state_dot_fn4(u, v, w, p, q, r, phi, theta, epsai)
function state_dot=state_dot_fn4(t,vector)

global  uo vo wo po qo ro phio thetao  deo dTo dao dro de dT da dr;
 Uo=237.1; %m/s
 
        alphao=2.6; %deg
        gammao=0; %deg
         %----------A/C Characteristics------
         Ix=162000; Iy=185000; Iz=330000; Ixz=6900; %kg.m^2
        %----------Stability Derivatives-------
        Xu=-0.0157; Xw=-0.0005; Xde=1.02; XdT=5.73*10^-5;
        Zu=-0.02; Zw=-1.33; Zwd=0; Zq=-1.25; Zde=-22.4; ZdT=0;
        Mu=-0.0015; Mw=-0.051; Mwd=-0.002; Mq=-1.09; Mde=-14.5; MdT=-0.6*10^-5;
        Yv=-0.167; Yp=0; Yr=0; Ydast=0; Ydrst=0.037;
        Lbetad=-4.93; Lpd=-1.34; Lrd=0.09; Ldad=5.83; Ldrd=2.43;
        Nbetad=5.63; Npd=-0.14; Nrd=-0.25; Ndad=-0.06; Ndrd=-2.66;
        
        g=9.801;
Lbeta=-(Nbetad*Ixz-Ix*Lbetad)/Ix; Nbeta=(Iz*Nbetad-Ixz*Lbetad)/Iz;
Lp=-(Npd*Ixz-Ix*Lpd)/Ix; Np=(Iz*Npd-Ixz*Lpd)/Iz;
Lr=-(Nrd*Ixz-Ix*Lrd)/Ix; Nr=(Iz*Nrd-Ixz*Lrd)/Iz;
Lda=-(Ndad*Ixz-Ix*Ldad)/Ix; Nda=(Iz*Ndad-Ixz*Ldad)/Iz;
Ldr=-(Ndrd*Ixz-Ix*Ldrd)/Ix; Ndr=(Iz*Ndrd-Ixz*Ldrd)/Iz;
u=vector(1); v=vector(2); w=vector(3); p=vector(4); q=vector(5); r=vector(6); phi=vector(7); theta=vector(8); epsai=vector(9);
 global goal;

de=goal*(-7.0711)-( 0.0033    )*w-( -0.8601 )*q-(-7.0711)*theta 
if de>.5
    de=.5
end
if de<-.5
    de=-.5
end
% figure(2)
% hold on
% plot(de)
%-----------------States Dots---------------

J=Ix*Iz-Ixz^2; c1=((Iy-Iz)*Iz-Ixz^2)/J; c2=(Ix-Iy+Iz)*Ixz/J; c3=Iz/J; c4=Ixz/J; c5=(Iz-Ix)/Iy; c6=Ixz/Iy; c7=1/Iy; c8=(Ix*(Ix-Iy)+Ixz^2)/J; c9=Ix/J;
Fx_m=g*(sin(thetao)-sin(theta))+Xu*(u-uo)+Xw*(w-wo)+Xde*(de-deo)+XdT*(dT-dTo);
udot=Fx_m-q*w+r*v;
Fy_m=g*(sin(phi)*cos(theta)-sin(phio)*cos(thetao))+Yv*(v-vo)+Yp*(p-po)+Yr*(r-ro)+Ydast*uo*(da-dao)+Ydrst*uo*(dr-dro);
vdot=Fy_m-r*u+p*w;
Fz_m=g*(cos(theta)*cos(phi)-cos(thetao)*cos(phio))+Zu*(u-uo)+Zw*(w-wo)+Zq*(q-qo)+Zde*(de-deo)+ZdT*(dT-dTo);
wdot=Fz_m+q*u-p*v;
L=Ix*(Lbeta*(atan(v/u)-atan(vo/uo))+Lp*(p-po)+Lr*(r-ro)+Lda*(da-dao)+Ldr*(dr-dro));
M=Iy*(Mu*(u-uo)+Mw*(w-wo)+Mq*(q-qo)+Mde*(de-deo)+MdT*(dT-dTo));
N=Iz*(Nbetad*(atan(v/u)-atan(vo/uo))+Np*(p-po)+Nr*(r-ro)+Nda*(da-dao)+Ndr*(dr-dro));
pdot=(c1*r+c2*p)*q+c3*L+c4*N;
qdot=c5*p*r-c6*(p^2-r^2)+c7*M;
rdot=(c8*p-c2*r)*q+c4*L+c9*N;
phidot=p+tan(theta)*(q*sin(phi)+r*cos(phi));
thetadot=q*cos(phi)-r*sin(phi);
epsaidot=(q*sin(phi)+r*cos(phi))/cos(theta);
xdot=u*cos(theta)*cos(epsai)+v*(sin(phi)*sin(theta)*cos(epsai)-cos(phi)*sin(epsai))+w*(sin(phi)*sin (epsai)+cos(phi)*sin(theta)*cos(epsai));
ydot=u*cos(theta)*sin(epsai)+v*(sin(phi)*sin(theta)*sin(epsai)+cos(phi)*cos(epsai))+w*(cos(phi)*sin(theta)*sin (epsai)-sin(phi)*cos(epsai));
zdot=-u*sin(theta)+v*sin(phi)*cos(theta)+w*cos(phi)*cos(theta);
% state_dot=[udot vdot wdot pdot qdot rdot phidot thetadot epsaidot xdot ydot zdot];
state_dot=[udot vdot wdot pdot qdot rdot phidot thetadot epsaidot ]';