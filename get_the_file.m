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

	prev_x = {"X","X"};
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
				data{length(data)+1} = temp;		# Prev must be the last point in the group
				temp = cell();						# Then, we create a new group with the next point as the last one
				temp{length(temp)+1} = prev_x;
				temp{length(temp)+1} = curr_x;	
				data{length(data)+1} = temp;			
				temp = cell();
				temp{length(temp)+1} = curr_x;
			else
				temp{length(temp)+1} = curr_x;
			endif
			prev_x = curr_x;

		endif
	endwhile
	data{length(data)+1} = temp;
	temp = cell();
	fclose(fid);

	# Note that these data are still string. Let us convert them into floats using str2double(s)
	for i = 1:length(data)
		for j = 1:length(data{i})
			data{i}{j}{1} = str2double(data{i}{j}{1})*1.00;
			data{i}{j}{2} = str2double(data{i}{j}{2})*1.00;
		endfor
	endfor
	# Display the data...
	return
endfunction

# Developed by: Toph Vizcarra, 2016