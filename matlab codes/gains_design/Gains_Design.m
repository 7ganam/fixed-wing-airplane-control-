% the system 
A=[-1.33 237.1 0 ; -.051 -1.09 0 ; 0 1 0 ];
B=[-22.4 ; -14.5 ; 0];
C=[0 0 1];
D=[0];

% checking the controllabilty 
co = ctrb(A,B);
Controllability = rank(co);

% designing gains using lqr methond
p = 50;
Q = p*C'*C;
R =1;
[K] = lqr(A,B,Q,R)
Nbar = rscale(A,B,C,D,K);

% drawing the response
sys_cl = ss(A-B*K,B*Nbar,C,D);
step(0.2*sys_cl)
ylabel('theta (rad)');
