# Christopher Ivan Vizcarra | 2013-58235 | CS 131 THR

# [Citing my Reference]
# My documentation and comments are based from the book
# "Numerical Methods for Engineers Sixth Edition" by Canale and Capra since this was 
# my go-to reference book in understanding quadratic and cubic splines.
# Nevertheless, all the codes here are my creation. 

function quadratic_spline(data)
	# figure;
	for i = 1:length(data)		# Loop the entries that was split by the delimiter 'SHAPE' from earlier
								# First, get the number of data points and intervals
								# Note that we have n + 1 data points and
								# n intervals
		n = length(data{i}) - 1;
		n
								# 1.) Let us now set a1 to be zero. Thus, this becomes our first equation
		a1 = 0;
								# Note that we need 3*n equations
								# Solve for     a2, ... an,
								#    	    b1, b2, ... bn,
								#	        c1, c2, ... cn,
								# With a1 = 0, we only need 3*n - 1 equations.
								
								# Prepare Matrix A and Matrix B
								# Note that the format for the columns of the coefficient
								# will always be a2, ..., an, b1, ..., bn, c1, ..., cn for Matrix A
								# Matrix B on the other hand contains the constant values per equation (RHS)
		matrix_A = [];
		matrix_B = [];
								# 2.) We need to show that the function values of adjacent
								# polynomials must be equal at their interior knots.
								# This will provide 2n-2 conditions. After this, we only need n-3 equations.
		data{i}
		for j = 2:n				# from the range i = 2 to n
								# Because of the format, we know that we have 3*n - 1 entries
								# x1 = data{i}{j-1}{1}; and y1 = data{i}{j-1}{2};
								# First Equation:  Ai-1*(Xi-1)^2 + Bi-1*Xi-1 + Ci-1 = f(Xi-1)
			temp = [];
			for k = 1:(3*n-1) 	# Set the default values for the columns for the row in the matrix (a1, a2,..., cn) be zero
				temp = [temp, 0];
			endfor
								# Write A
			if(j != 2)			# We know that a0 is already zero, so we check that condition.
				temp(j-2) = (data{i}{j}{1})**2;
			endif
								# Write B
			temp(n+j-2) = data{i}{j}{1};
								# Write C
			temp(2*n+j-2) = 1;
			matrix_A = [matrix_A; temp];
			matrix_B = [matrix_B; data{i}{j}{2}];
								# Second Equation: Ai*(Xi-1)^2   + Bi*Xi-1   + C    = f(Xi-1)
			temp = [];
			for k = 1:(3*n-1) 	# Set the default values for the columns for the row in the matrix (a1, a2,..., cn) be zero
				value = 0;
				temp = [temp, value];
			endfor
								# Write A
			temp(j-1) = (data{i}{j}{1})**2;
								# Write B
			temp(n+j-1) = data{i}{j}{1};
								# Write C
			temp(2*n+j-1) = 1;
			matrix_A = [matrix_A; temp]
			matrix_B = [matrix_B; data{i}{j}{2}];
		endfor

		# matrix_A				# Un-comment to print the status of Matrix A
		# matrix_B				# Un-comment to print the status of Matrix B
								# 3.) The first and last functions must pass through the end points.
								# Initialize temp that is going to be added to matrix
		temp = []
		for k = 1:(3*n-1) 		# Set the default values for the columns for the row in the matrix (a1, a2,..., cn) be zero
			temp = [temp, 0];
		endfor
								# The two equations are:
								# A1(X0)^(2) + B1X0 + C1 = f(X0)
								# Since we have set A1 to be zero from earlier, we can remove A1 in the equation.
								# We have: B1X0 + C1 = f(X0)
		temp(n) = data{i}{1}{1};
		temp(2*n) = 1;
								# Add to Matrix A
		matrix_A = [matrix_A; temp];
		temp = []
		for k = 1:(3*n-1) 		# Set the default values for the columns for the row in the matrix (a1, a2,..., cn) be zero
			temp = [temp, 0];
		endfor
								# An(Xn)^(2) + BnXn + Cn = f(Xn)
		temp(n-1) = (data{i}{n+1}{1})**2;
		temp(2*n-1) = (data{i}{n+1}{1});
		temp(3*n-1) = 1;
								# Add to Matrix A
		matrix_A = [matrix_A; temp];

								# This gives 2 additional equations. After this, we only need n-1 equations
								# Add the entry f(X0) to Matrix B
		matrix_B = [matrix_B; data{i}{1}{2}];
								# Add the entry f(Xn) to Matrix B
		matrix_B = [matrix_B; data{i}{n+1}{2}];

								# 4.) The first derivative at the interior knots must be equal. The two conditions 
								# can be represented generally as 2Ai-1*Xi-1 +Bi-1 - 2Ai*Xi - Bi = 0
								# for i = 2 to n.
								# This will provide n-1 conditions/equations. We now have all the needed equations.

		matrix_A				# Un-comment to print the status of Matrix A
		matrix_B				# Un-comment to print the status of Matrix B
		# for j = 1:length(data{i})-1		# Per pair of entry
		# endfor
	endfor
								# Let the plotting begin here


	# hold off;
endfunction