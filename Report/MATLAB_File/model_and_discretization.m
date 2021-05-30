k = 1;          % spring constant 
lam = 0;        % damping constant 
a = -2*k;
b = -2*lam;
c = k;
d = lam;

n = 12; % state dimension
m = 3; % input dimension

Ac = [zeros(n/2) eye(n/2);
     [a,c,0,0,0,0,b,d,0,0,0,0;
     c,a,c,0,0,0,d,b,d,0,0,0;
     0,c,a,c,0,0,0,d,b,d,0,0;
     0,0,c,a,c,0,0,0,d,b,d,0;
     0,0,0,c,a,c,0,0,0,d,b,d;
     0,0,0,0,c,a,0,0,0,0,d,b]];

Bc = [zeros(n/2,m);
      [1, 0, 0;
      -1, 0, 0;
       0, 1, 0;
       0, 0, 1;
       0,-1, 0;
       0, 0,-1]];

% convert to discrete-time system
ts = 0.5;       % sampling time
A = expm(ts*Ac);
B = (Ac\(expm(ts*Ac)-eye(n)))*Bc;