% Définir une plage de valeurs pour le paramètre t (par exemple, de 0 à 2*pi)
t = linspace(0, 2*pi, 1000);

% Définir les équations paramétriques pour le cœur
x = 16*sin(t).^3;
y = 13*cos(t) - 5*cos(2*t) - 2*cos(3*t) - cos(4*t);

% Tracer le cœur
plot(x, y);
axis equal; % Pour avoir un aspect proportionnel
title('Cœur dessiné en MATLAB');
xlabel('X');
ylabel('Y');
grid on;

% Créer une nouvelle figure
figure;

% Dessiner la tête de l'ours (un cercle)
radius = 2; % Rayon de la tête
theta = linspace(0, 2*pi, 100); % Plage d'angle
x_head = radius * cos(theta);
y_head = radius * sin(theta);

% Dessiner le corps de l'ours (un ovale)
a = 4; % Demi-grand axe en x
b = 6; % Demi-grand axe en y
x_body = a * cos(theta);
y_body = b * sin(theta);

% Dessiner les oreilles (deux cercles)
ear_radius = 0.5;
x_ear_left = -1.5;
x_ear_right = 1.5;
y_ear = 3;
x_left_ear = x_ear_left + ear_radius * cos(theta);
x_right_ear = x_ear_right + ear_radius * cos(theta);
y_ears = y_ear + ear_radius * sin(theta);

% Dessiner les yeux (deux cercles)
eye_radius = 0.2;
x_eye_left = -0.7;
x_eye_right = 0.7;
y_eye = 1.2;
x_left_eye = x_eye_left + eye_radius * cos(theta);
x_right_eye = x_eye_right + eye_radius * cos(theta);
y_eyes = y_eye + eye_radius * sin(theta);

% Tracer le tout
hold on;
plot(x_head, y_head, 'k', 'LineWidth', 2);
plot(x_body, y_body, 'k', 'LineWidth', 2);
plot(x_left_ear, y_ears, 'k', 'LineWidth', 2);
plot(x_right_ear, y_ears, 'k', 'LineWidth', 2);
plot(x_left_eye, y_eyes, 'k', 'LineWidth', 2);
plot(x_right_eye, y_eyes, 'k', 'LineWidth', 2);

axis equal; % Pour avoir un aspect proportionnel
title('Dessin rudimentaire d''un ours en MATLAB');
xlabel('X');
ylabel('Y');
grid on;

% Éventuellement, vous pouvez ajouter plus de détails pour améliorer le dessin.
