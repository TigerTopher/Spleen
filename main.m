# Christopher Ivan Vizcarra | 2013-58235 | CS 131 THR

#{
	Notes:
	1. You can run main.m to get all the linear, quadratic, and cubic splines.
	2. Or you can run each one individually:
		linear_spline.m
		quadratic_spline.m
		cubic_spline.m

	If the variable data has not been passed as a parameter for the spline functions,
	(say you called the functions individually and not using main),
	then the function itself calls the get_the_file function (with the default
	filename as "input.txt") to get the data itself, then proceed to the spline function.

	[Linux]
	I am using Octave 3.8.1 and it was configured for "x86_64-pc-linux-gnu".
	Runs perfectly in Linux.

	[Windows]
	I was able to run my program in Windows 8.1 using Octave 3.6.4.
	Since Octave 4.0.0 is unsupported in Windows 8.1 (buggy for plotting),
	I needed to change the graphics backend to 'gnuplot' (which was easily installed in Octave 3.6.4)
	(although it was around 4 times slower and sometimes needed to run the program twice
	for the last graph plotted on the first run appear). The Octave CLI was used.
	Moreover, my terminal says that Octave was configured for "i686-pc-mingw32"
#}

data = get_the_file("input.txt");
# disp(data);						# Uncomment this to display the data

disp("Program starts.");

disp("Starting to plot linear spline...");
linear_spline(data);

disp("Starting to plot quadratic spline...");
quadratic_spline(data);

disp("Starting to plot cubic spline...");
cubic_spline(data);
figure;
close;
disp("Program ends.");
# Programmed by: Toph Vizcarra, 2016