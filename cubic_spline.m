# Christopher Ivan Vizcarra | 2013-58235 | CS 131 THR

# [Citing my Reference]
# My documentation and comments are based from the book
# "Numerical Methods for Engineers Sixth Edition" by Canale and Capra since this was 
# my go-to reference book in understanding quadratic and cubic splines.
# Nevertheless, all the codes here are my creation. 

function cubic_spline(data)
	try
		data;
	catch
		data = get_the_file("input.txt");
	end_try_catch

	figure('name','Cubic Spline | Vizcarra, Christopher');
	for i = 1:length(data)		# Loop the entries that was split by the delimiter 'SHAPE' from earlier
								# First, get the number of data points and intervals
								# Note that we have n + 1 data points and
								# n intervals
		n = length(data{i}) - 1;
		if( n > 1)
			matrix_A = [];
			matrix_B = [];
									# Since this is a cubic spline, we need to have 4n equations
			
			for j = 2:n
	 								# 1. The function value must be equal at the interior point
	 								# This gives 2n-2 condition
	 								# From the range i = 2 to n, we have
									# First Equation:  Ai-1*(Xi-1)^3 + Bi-1*(Xi-1)^2 + Ci-1*(Xi-1) + Di-1 = f(Xi-1)
									# Second Equation:  Ai*(Xi-1)^3 + Bi*(Xi-1)^2 + Ci*(Xi-1) + Di = f(Xi-1)
				temp = [];
									# Set the values to be zero first. Temp contains
									# a1, ... an, b1, ..., bn, c1  , ..., cn, d1,   ..., dn
									# 1,  ... N , N+1,..., 2N, 2N+1  ..., 3N, 3N+1, ..., 3N
				for k = 1:(4*n)
					temp = [temp, 0];
				endfor
									# Write Ai-1
				temp(j-1) = (data{i}{j}{1})^3;
									# Write Bi-1
				temp(n+j-1) = (data{i}{j}{1})^2; 
									# Write Ci-1
				temp(2*n+j-1) = (data{i}{j}{1}); 
									# Write Di-1
				temp(3*n+j-1) = 1;

				matrix_A = [matrix_A; temp]; 
				matrix_B = [matrix_B; data{i}{j}{2}];

				temp = [];
				for k = 1:(4*n)
					temp = [temp, 0];
				endfor
									# Write Ai-1
				temp(j) = (data{i}{j}{1})^3;
									# Write Bi-1
				temp(n+j) = (data{i}{j}{1})^2; 
									# Write Ci-1
				temp(2*n+j) = (data{i}{j}{1}); 
									# Write Di-1
				temp(3*n+j) = 1;
				
				matrix_A = [matrix_A; temp]; 
				matrix_B = [matrix_B; data{i}{j}{2}];

				# matrix_A			# Uncomment this to print the matrix_A
				# matrix_B			# Uncomment this to print the matrix_B
			endfor
									
									# 2. The first and last endpoint must pass through the end points (2 conditions)
									# A1(X0)^3 + B1(X0)^2 + C1X0   + D1 = f(X0)
			temp = [];

			for k = 1:(4*n)
				temp = [temp,0];
			endfor

			temp(1) = (data{i}{1}{1})^3;			
			temp(n+1) = (data{i}{1}{1})^2;
			temp(2*n+1) = (data{i}{1}{1});
			temp(3*n+1) = 1;

			matrix_A = [matrix_A; temp];
										# AN(Xn)^3 + Bn(Xn)^2 + CnXn + Dn = f(Xn)							
			temp = [];
			for k = 1:(4*n)
				temp = [temp,0];
			endfor

			temp(n) = (data{i}{n+1}{1})^3;			
			temp(2*n) = (data{i}{n+1}{1})^2;
			temp(3*n) = (data{i}{n+1}{1});
			temp(4*n) = 1;
			matrix_A = [matrix_A; temp];

			matrix_B = [matrix_B; data{i}{1}{2}];
			matrix_B = [matrix_B; data{i}{n+1}{2}];

									# 3. The first derivatives at the interior knots must be equal (n-1 conditions)
									# f'(x) = 3ax^2 + 2bx + c. So we have
									# From i = 2:n
									# 3*Ai-1*(Xi-1)^2 + 2*(Bi-1)*(Xi-1) + (Ci-1) = 3 Ai*(Xi-1)^2 + 2*(Bi)*(Xi-1) + (Ci)
									# 3*Ai-1*(Xi-1)^2 + 2*(Bi-1)*(Xi-1) + (Ci-1) - 3 Ai*(Xi-1)^2 - 2*(Bi)*(Xi-1) - (Ci) = 0

			for j = 2:n
				temp = [];
				for k = 1:(4*n)
					temp = [temp,0];
				endfor
									# 3*Ai-1*(Xi-1)^2 + 2*(Bi-1)*(Xi-1) + (Ci-1) - 3 Ai*(Xi-1)^2 - 2*(Bi)*(Xi-1) - (Ci) = 0

									# Write Ai-1
				temp(j-1) = 3*(data{i}{j}{1})^2;
									# Write Bi-1
				temp(n+j-1) = 2*(data{i}{j}{1}); 
									# Write Ci-1
				temp(2*n+j-1) = 1; 
									# Write Ai
				temp(j) = -3*(data{i}{j}{1})^2;
									# Write Bi
				temp(n+j) = -2*(data{i}{j}{1}); 
									# Write Ci
				temp(2*n+j) = -1; 

				matrix_A = [matrix_A; temp];
				matrix_B = [matrix_B; 0];
			endfor

									# 4. The 2nd derivatives at the interior point must be equal (n-1 conditions)
									# Note f''(x) = 6*Ax + 2B. So we have,
									# For i = 2:n
									# 6*Ai-1*Xi-1 + 2Bi-1 = 6Ai*Xi-1 + 2Bi
									# 6*Ai-1*Xi-1 + 2Bi-1 - 6Ai*Xi-1 - 2Bi = 0
			for j = 2:n
				temp = [];
				for k = 1:(4*n)
					temp = [temp, 0];
				endfor
									# Write Ai-1
				temp(j-1) = 6*data{i}{j}{1};
									# Write Bi-1
				temp(n+j-1) = 2; 
									# Write Ai
				temp(j) = -6*data{i}{j}{1};
									# Write Bi
				temp(n+j) = -2; 

				matrix_A = [matrix_A; temp];
				matrix_B = [matrix_B; 0];
			endfor

									# 5. 2nd derivatives at the end knots are zero (2 conditions)
									# 6*A1X0 + 2B1 = 0
									# 6*AnXn + 2Bn = 0
			temp = [];
			for k = 1:(4*n)
				temp = [temp, 0];
			endfor

			temp(1) = 6*(data{i}{1}{1});
			temp(n+1) = 2;

			matrix_A = [matrix_A; temp];
			matrix_B = [matrix_B; 0];

			temp = [];
			for k = 1:(4*n)
				temp = [temp, 0];
			endfor

			temp(n) = 6*(data{i}{n+1}{1});
			temp(2*n) = 2;

			matrix_A = [matrix_A; temp];
			matrix_B = [matrix_B; 0];


			solution = matrix_A\matrix_B;
			# matrix_A						# Uncomment this to print the Matrix A
			# matrix_B						# Uncomment this to print the Matrix B
			# solution						# Uncomment this to print the Solution (Coefficients)

			for j = 1:length(data{i})-1		# Per pair of entry
				x0 = data{i}{j}{1};
				y0 = data{i}{j}{2};
				x1 = data{i}{j+1}{1};
				y1 = data{i}{j+1}{2};
				if(x0 == x1)
					if(y0 > y1)
						temp = y1;
						y1 = y0;
						y0 = temp;
					endif

					range_of_y = y0:0.01:y1;
					domain_of_x = x0 + 0*range_of_y;

					plot(domain_of_x, range_of_y, "color", "b");
					hold on;
				else
					if(x0 > x1)			# We might need to swap the points since we have a range that always go from left to right
						temp1 = x1;
						temp2 = y1;
						x1 = x0;
						y1 = y0;
						x0 = temp1;
						y0 = temp2;
					endif
					domain_of_x = x0:0.01:x1;

					our_function = solution(j)*((domain_of_x).**3) + solution(n+j)*((domain_of_x).**2) + solution(2*n+j)*(domain_of_x) + solution(3*n+j);
					
					plot(domain_of_x, our_function, "color", "b");
					hold on;
				endif
			endfor
		elseif(n==2)
			x0 = data{i}{j}{1};
			y0 = data{i}{j}{2};
			x1 = data{i}{j+1}{1};
			y1 = data{i}{j+1}{2};

			if(x0 == x1)
				if(y0 > y1)
					temp = y1;
					y1 = y0;
					y0 = temp;
				endif

				range_of_y = y0:0.01:y1;
				domain_of_x = x0 + 0*range_of_y;

				plot(domain_of_x, range_of_y, "color", "b");
				hold on;
			else
				if(x0 > x1)			# We might need to swap the points since we have a range that always go from left to right
					temp1 = x1;
					temp2 = y1;
					x1 = x0;
					y1 = y0;
					x0 = temp1;
					y0 = temp2;
				endif

				m = (y1 - y0)/(x1 - x0);	# Slope

				# This will be our equation
				domain_of_x = x0:0.01:x1;
				our_function = m*domain_of_x - m*x0 + y0;
				plot(domain_of_x, our_function, "color", "b");
				hold on;
			endif
		endif
	endfor
	hold off;
endfunction 

# Developed by: Toph Vizcarra, 2016