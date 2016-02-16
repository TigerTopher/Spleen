function sol  = secant(a,b)
  tb = test_function(b);
  ta = test_function(a);
  c = b - (tb*(a - b)/(ta - tb));
  tc = test_function(c);
  tol = 0.00001;
  iter = 0;

  while(abs(tc) > tol);
      iter = iter+1;
      printf("i = %d\t a = %f\t b = %f\t c = %f\t fa = %f\t fb = %f\t fc = %f \n",iter,a,b,c,ta,tb,tc);
      c = b - (tb*(a - b)/(ta - tb));
      tc = test_function(c);
      a = b;
      b = c;
      tb = test_function(b);
      ta = test_function(a);

  endwhile
