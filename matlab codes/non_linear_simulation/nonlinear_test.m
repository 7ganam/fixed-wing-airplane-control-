global choice OC_ch uo vo wo po qo ro phio thetao epsaio deo dTo dao dro de dT da dr
choice =1;
 OC_ch=1;
 uo =237.1;
 vo =0;
 wo =10.7547;
 po =0;
 qo =0;
 ro =0;
 phio =0;
 thetao=0.0;
 epsaio=0;
 deo=0;
 dTo=0;
 dao=0;
 dro=0;
 de=0;
 dT=0;
 da=0;
 dr=0;
 figure(2)
 
 VEC =[237.1;0; 0; 0; 0; 0;0; .4; 0];
 global goal;
 goal=.2;
%  VEC=state_dot_fn2(VEC);clc
% state_dot=[udot vdot wdot pdot qdot rdot phidot thetadot epsaidot ]';
 [t,x] = ode45(@state_dot_fn4,[0 10],[237;0; 0; 0; 0; 0;0; 0; 0]);
 figure(1)
 title('theta')
 plot(t,x(:,8))
 
