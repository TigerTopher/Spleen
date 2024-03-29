# Christopher Ivan Vizcarra | 2013-58235 | CS 131 THR

function linear_spline(data)

	# If this is called without the parameter data, then let's get the data first.
	try
		data;
	catch
		data = get_the_file("input.txt");
	end_try_catch

	figure('name','Linear Spline | Vizcarra, Christopher');
	for i = 1:length(data)				# Loop the entries that was split by the delimiter 'SHAPE' from earlier
		for j = 1:length(data{i})-1		# Per pair of entry
			x0 = data{i}{j}{1};
			y0 = data{i}{j}{2};
			x1 = data{i}{j+1}{1};
			y1 = data{i}{j+1}{2};

			if(x0 == x1)				# The slope of this is undefined so let's have a separate if-block for this.
				if(y0 > y1)				# Since range is from lower to higher value, we might need to swap
					temp = y1;
					y1 = y0;
					y0 = temp;
				endif

				range_of_y = y0:0.01:y1;
				domain_of_x = x0 + 0*range_of_y;

				plot(domain_of_x, range_of_y, "color", "r");
				hold on;
			else
				if(x0 > x1)				# We might need to swap the points since we have a range that always go from left to right
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
				plot(domain_of_x, our_function, "color", "r");
				hold on;
			endif		
		endfor
	endfor
	hold off;
	disp("Plotted Linear Spline...");
	figure;								# Without this, the last plotted graph doesn't appear as the program terminates before it is displayed. (in Windows)
	close;
endfunction

# Developed by: Toph Vizcarra, 2016