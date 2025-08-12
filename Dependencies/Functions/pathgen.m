function [path, t_path] = pathgen(Vr, R, x0, y0, z0, total_time, dt)
% Génère une trajectoire circulaire de rayon R

N = floor(total_time/dt);
t_path = linspace(0, total_time, N)';      % taille N×1
path = zeros(N, 4);                        % [x, y, z, θ]
z = linspace(z0, z0+1, N)';

for k = 1:N
    t = t_path(k);
    angle = (Vr/R)*t;
    x = R * cos(-pi/2 + angle);
    y = R * (sin(-pi/2 + angle)) + R/2;
    
    theta = angle;
    path(k,:) = [x, y, z(k), theta];
end
end




