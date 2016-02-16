function sol = BisectionMethod(a,b)
tol = 0.00000001;
i = 0
fa = test_function(a);
fb = test_function(b);
if (fa*fb > 0)
     printf("Bisection method can't work if end points produce same signs");
     return;
 endif
    c = (a+b)/2;
    sol(1) = c;
    fc = test_function(c);

 for (i = 1:20)
    printf( "i = %d\t a = %f \t b = %f \t c = %f \t  fa = %f\t fb  = %f \t fc = %f \n",i,a,b,c,fa,fb,fc);
    if(fa*fc > 0)
      a = c;
    elseif(fa*fc<0)
      b = c;
     else
        sol(i) = c;
        return;
     endif
     c = (a+b)/2;
     fc = test_function(c);
     fa = test_function(a);
    fb = test_function(b);
 endfor
 return;

  
 