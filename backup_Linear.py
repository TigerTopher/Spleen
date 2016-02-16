# Christopher Ivan Vizcarra | 2013-58235 | CS 131 THR

function linear_spline(data)
	figure;
	for i = 1:length(data)			# Loop the entries that was split by the delimiter 'SHAPE' from earlier
		# Do not forget to catch the case where there is only one point.
		for j = 1:length(data{i})-1	# Per entry
			x0 = data{i}{j}{1};
			y0 = data{i}{j}{2};
			x1 = data{i}{j+1}{1};
			y1 = data{i}{j+1}{2};

			x0 
			y0 
			x1
			y1

			if(x0 == x1)
				if(y0 > y1)
					temp = y1;
					y1 = y0;
					y0 = temp;
				endif

				range_of_y = y0:0.1:y1;
				domain_of_x = x0 + 0*range_of_y;

				plot(domain_of_x, range_of_y);
				hold on;
			else
				if(x0 > x1)
					temp = x1;
					x1 = x0;
					x0 = temp;
				endif

				m = (y1 - y0)/(x1 - x0);
				# This will be our equation...
				domain_of_x = x0:0.1:x1;
				our_function = m*domain_of_x - m*x0 + y0;
				plot(domain_of_x, our_function);
				hold on;
			endif		
		endfor
	endfor
	hold off;
endfunction