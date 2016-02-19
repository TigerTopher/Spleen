# Christopher Ivan Vizcarra | 2013-58235 | CS 131 THR

function data = get_the_file (filename)
	try
		filename;
	catch
		filename = "input.txt"
	end_try_catch

	fid = fopen(filename, "r");
	data = cell();
	temp = cell();

	prev_x = {"X","X"};									# This is just some random prev value for the initial compare
	curr_x = {};

	while (! feof (fid))
		txt = fgetl(fid);
		if(strcmp(txt,"SHAPE"))
			data{length(data)+1} = temp;
			temp = cell();
		else
			# If not SHAPE, we need to check if there is a case where there are two consecutive Xs with the same value
			curr_x = strsplit(txt, ",");

			if(strcmp(curr_x{1},prev_x{1}))				# If they have the same x
				data{length(data)+1} = temp;			# Prev must be the last point in the group
				temp = cell();							# Then, we create a new group with the next point as the last one

				temp{length(temp)+1} = prev_x;			# This is a new group with two points with the same X value
				temp{length(temp)+1} = curr_x;			# We create a separate group for them since we're going to plot a
				data{length(data)+1} = temp;			# vertical line between these two points.

				temp = cell();							# Create a new group with the current point as a
				temp{length(temp)+1} = curr_x;			# starting point
			else
				temp{length(temp)+1} = curr_x;			# If different x, let's just add to the group
			
			endif
			prev_x = curr_x;
		endif
	endwhile
	data{length(data)+1} = temp;						# Append the last one in data
	fclose(fid);

	# Note that these data are still string. Let us convert them into floats using str2double(s)
	for i = 1:length(data)
		for j = 1:length(data{i})
			data{i}{j}{1} = str2double(data{i}{j}{1})*1.00;
			data{i}{j}{2} = str2double(data{i}{j}{2})*1.00;
		endfor
	endfor
	#disp(data); 										# Uncomment this to display the data
	return
endfunction

# Programmed by: Toph Vizcarra, 2016