# Christopher Ivan Vizcarra | 2013-58235 | CS 131 THR

filename = "input.txt";
fid = fopen(filename, "r");

data = cell();
temp = cell();
while (! feof (fid))
	txt = fgetl(fid);
	if(strcmp(txt,"SHAPE"))
		data{length(data)+1} = temp;
		temp = cell();
	else
		temp{length(temp)+1} = strsplit(txt	, ",");
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
# disp(data);

# linear_spline(data);
# quadratic_spline(data);
# disp(data);
cubic_spline(data);