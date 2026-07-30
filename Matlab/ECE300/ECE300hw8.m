[z,p,k] = buttap(5);
[num, den] = tfdata(zpk(z,p,k),'v');
num
den