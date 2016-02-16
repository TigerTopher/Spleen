
#x = linspace(0, 2*pi);  # Setup vector of x values;
x = -2:0.5:2;
a = cos(2*x);
b = sin(4*x);
c = 2*sin(x);

figure;
plot(x, a, "-");
hold on;
plot(x, b, ":");
plot(x, c, 'k');
plot(x, a, x, b, x, c);
figure;
hold off;
plot(x, a+b+c, ':k');