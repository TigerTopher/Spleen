# Plot y = floor(x) for all elements in 0, 15

hold on;
# sets whether you want successive plots to be drawn together on the same axes or to replace the previous plot.

x = linspace(0, 15, 50);
# linspace(start, stop, length)
# The length parameter is optional and specifies the number of values in the returned vector.
# If you leave out this parameter, the vector will contain 100 elements with start as the first
# value and stop as the last.
y = floor(x);
plot (x, cos (x));
plot(x,y);

hold off;

