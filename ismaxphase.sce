function y=ismaxphase(b,a)//function to check if a given system is maximum phase system or not
                           //b and a are coefficient of the numerator and denominator resp.of impulse response of the system.
                           //NOTE:-the numerator and denominator are of form 1+a1*z+a2*z^2+a3*z^3........

p=poly(b,"x","coeff")      //generating the polynomial equation form the given coefficient for the numerator

sol=roots(p)               // finding the zeroes of the impulse response
nort = size (sol,sel="c")
count=0
//counting the no. of zeroes of the response that are outside the unit circle then only it is a maximum phase system
for i=sol
    mag=sqrt((real(i))^2+(imag(i))^2)
    if (mag>=1) then
        count=count+1
    end
end
//checking if all the zeroes are outside unit circle.
if(count==nort) then
   y=%t
else
   y=%f
end

endfunction
  
