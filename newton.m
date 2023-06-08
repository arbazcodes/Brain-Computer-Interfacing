
syms f(x) x
f(x) = cos(x-1)+log(x-1);
g(x) = diff(f);
x(1)=0 ;
for i=1:1000 
        x(i+1) = x(i) - (f(x(i))/g(x(i)));
       
        if(  abs(f(x(i+1)))<0.00001)  
            disp(double(x(i+1)));
            break;
       end
end
