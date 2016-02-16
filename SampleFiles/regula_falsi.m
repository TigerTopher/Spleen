function sol = regula_falsi(a,b)
  tb = test_function(b);
  ta = test_function(a);
  c = b - (tb*(a - b)/(ta - tb));
  tc = test_function(c);
  tol = 0.00001;
  iter = 0;

  while(abs(tc) > tol);
      iter = iter+1;
      printf("i = %d\t a = %f\t b = %f\t c = %f\t fa = %f\t fb = %f\t fc = %f \n",iter,a,b,c,ta,tb,tc);
      if (ta*tc>0)
          a =c;
          ta = tc;
     else
      b = c;
      tb = tc;
     endif
      c = b - (tb*(a - b)/(ta - tb));
      tc = test_function(c);
  endwhile
 
  