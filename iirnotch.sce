//This function is used to get the filter that notch a value at a particular frequency w0
//NAME:=PRANIT J. THAKUR
//Function name:-iirnotch()
//INPUTS:-w0=frequency of interest,"bandwidth "=the bandwidth ,we want at the log magnitude ="lv" 
//OUTPUTS:-'num'=coefficient of numerator of filter and 'deno'=coefficient of denominator of filter

function [num,deno]=iirnotch(w0,bandwidth,lv)
//notch filter at w0 frequency

//normalisation by pi
bandwidth=bandwidth*(%pi)
w0=w0*(%pi)

//converting from decibal to original magnitude
g=10^(-abs(lv)/20)  

beta=(sqrt(1-g^2)/g)*tan(bandwidth/2)
gain=1/(1+beta)

num=gain*[1,-2*cos(w0),1]
deno=[1,-2*gain*cos(w0),(2*gain-1)]

endfunction 
