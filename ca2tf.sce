
//This function is used to get the coefficients of transfer function and  power complementary filter made using two coupled allpass filter
//NAME:=PRANIT J. THAKUR
//Function name:-ca2tf()
//INPUTS:-d1(coefficient of denominator of allpass filter),d2(coefficient of denominator of allpass filter) and beta.
//OUTPUTS:-b,q are coefficient of numerator of impulse response of coupled filter and power complementary filter and 'a' is denominator coeff of impulse response

function [b,a,q]=ca2tf(d1,d2,beta)//d1&d2 are denominator coefficient of an allpass filter in the form 1+a1*z+a2*z^2.........
 
 if ~exists("beta","local") then  //checking if beta is passed in the calling or not
    beta = 1
 end
H1=(poly((flipdim(d1,2)),"z","coeff"))/(poly(d1,"z","coeff"))//making the impulse response of an allpass filter using the coefficient given to us using the fact that coeff of numerators are flipped version of denominator i.e if denominator =1+a1*z+a2*z^2.....
                                                                                     // numerator=z^m+a1+z^m-1.....
H2=(poly((flipdim(d2,2)),"z","coeff"))/(poly(d2,"z","coeff"))

H=((conj(beta)*H1)+(beta*H2))/2//finding the impuse transform for the coupled filter

//finding the power complementary filter
if (isreal(d1)&isreal(d2)&(beta==1)) then
    G=(H1-H2)/2
else
    G=((-conj(beta)*H1)+(beta*H2))/(2*%i)
end

den1=denom(H)//extracting the coefficient from the resultant filter's numerator and denominator
num1=numer(H)
num2=numer(G)
q=coeff(num2)
b=coeff(num1)
a=coeff(den1)

endfunction
