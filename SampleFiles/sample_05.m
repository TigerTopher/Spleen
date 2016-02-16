# Plot a circle of radius 1, centered at the origin.
# Equation of a circle: (x - h)^2 + (y - k)^2 = r^2
# Since origin h, k = 0; r = 1
# x^2 + y^2 = 1
# y = sqrt(1 - x^2);

x = -1:0.01:1;
a = sqrt(1 - x.^2);
figure;
plot(x, a);
hold on;
b = - sqrt(1 - x.^2);
plot(x, b);
hold off;