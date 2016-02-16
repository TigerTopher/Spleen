function sol = fixed_point(x);
y = test_function_1(x);
tol = 0.0000001;
iter = 0;
while (abs(y - x)>tol)
  iter = iter + 1;
  x = y;
  y = test_function_1(x);
  printf("i = %d\t x =%f\t y = %f\n",iter,x,y);
endwhile
  