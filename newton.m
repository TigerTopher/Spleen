function sol = newton(a)
  tc = 1;
  tol = 0.00001;
  iter = 0

  while(abs(tc) > tol);
      iter = iter+1;
      c = a - test_function2(a)/derivative(a);
      tc = test_function2(c);
      printf("i = %d\t a = %f\t c = %f\t fc = %f\n",iter,a,c,tc);
     a = c;
    endwhile
