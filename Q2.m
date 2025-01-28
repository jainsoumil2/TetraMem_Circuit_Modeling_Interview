N = 4;
%G = 0.0001*ones(N,1);  % Set all node conductances to 100uS
%Gwire = 0.1;    % Set wire conductance to 0.1S
G = 0.0001;    % 100uS
Gwire = 0.1;   % 0.1S

% Create symbolic variables correctly
Vin = sym('Vin', [1 N]);  % Creates array of Vin(1)...Vin(4)
Vz = sym('Vz', [1 N]);    % Creates array of Vz(1)...Vz(4)
syms Ioutb
    
% Define equations for N nodes
eq1 = (Vin(1) - Vz(1))*G == (Vz(1) - Vz(2))*Gwire;
eq2 = (Vin(2) - Vz(2))*G + (Vz(1) - Vz(2))*Gwire == (Vz(2) - Vz(3))*Gwire;
eq3 = (Vin(3) - Vz(3))*G + (Vz(2) - Vz(3))*Gwire == (Vz(3) - Vz(4))*Gwire;
eq4 = (Vin(4) - Vz(4))*G + (Vz(3) - Vz(4))*Gwire == (Vz(4))*Gwire;
eq5 = Vz(4) == Ioutb/Gwire;

% Solve the system
sol = solve([eq1, eq2, eq3, eq4, eq5], [Vz(1), Vz(2), Vz(3), Vz(4), Ioutb]);