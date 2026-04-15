% Q2.2
%UPI: xdua444
%ID: 191864216

t = 0:0.1:12;
y0 = [2000 40 1 0 0];

[t,Y] = ode45(@ode_func,t,y0);

% find the maximum and index of infected people
[M, I] = max(Y(:,3));
M = round(M);
T = round(t(I),1);

function dY = ode_func(t,y)

    beta = 8.7;
    gamma = 0.2;
    sigma = 0.4;
    mu = 0.3;
    v = 0;

    S = y(1);
    E = y(2);
    I = y(3);
    R = y(4);
    D = y(5);

    N = S + E + I + R;

    dY = zeros(5,1);
    dY(1,1) = -beta*S*I/N - v*S;
    dY(2,1) = beta*S*I/N - sigma*E;
    dY(3,1) = sigma*E - (mu + gamma)*I;
    dY(4,1) = gamma*I + v*S;
    dY(5,1) = mu*I;

end