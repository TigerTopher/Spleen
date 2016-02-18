# Christopher Ivan Vizcarra | 2013-58235 | CS 131 THR

#{
	1. You can run main.m to get all the linear, quadratic, and cubic splines.
	2. Or you can run each one individually:
		linear_spline
		quadratic_spline
		cubic_spline

	Note: If the variable data has not been passed as a parameter for the spline functions,
	(say you called the functions individually and not using main),
	then the function itself calls the get_the_file function (with the default
	filename as "input.txt") to get the data itself, then proceed to the spline function.
#}


data = get_the_file("input.txt");

linear_spline(data);
quadratic_spline(data);
cubic_spline(data);



# Developed by: Toph Vizcarra, 2016