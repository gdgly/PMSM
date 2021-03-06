% clear all;
% close all;
% clc;

pos = linspace(0, 4*pi, 1000);
sectors = linspace(1, 6, 5);

Vd = 1;
Vq = 0;

Va = (Vd * cos(pos) - Vq * sin(pos));
Vb = (Vd * sin(pos) + Vq * cos(pos));


V1 = Vb;
V2 = (-Vb + sqrt(3) * Va)./ 2;
V3 = (-Vb - sqrt(3) * Va)./ 2;

figure;
hold on;
plot(V1, 'r');
plot(V2, 'g');
plot(V3, 'b');
legend('V1','V2','V3');
title('Inverse Clark Transform Output');
i = 1;

while i < length(pos)
    sector(i) = atan2(Vb(i),Va(i));
    i = i + 1;
end

i = 1;
while i < 7
    A = [sin((i * pi)/3), -cos((i * pi)/3); -sin(((i - 1)*pi)/3), cos(((i - 1)*pi)/3)]
    i = i + 1;
end

figure;
plot(Va);
hold on;
plot(Vb, 'r');
legend('Va','Vb');
title('Inverse Park Transform Output');
plot(sector);
hold off