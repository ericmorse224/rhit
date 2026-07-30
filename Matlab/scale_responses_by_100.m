%
%  remove the scaling by 100
%
   rr = load('response1.log');
   rr = rr/100;
   save('response1s','rr','-ascii');
   
   rr = load('response2.log');
   rr = rr/100;
   save('response2s','rr','-ascii');
   
   rr = load('response3.log');
   rr = rr/100;
   save('response3s','rr','-ascii');
   
   rr = load('response4.log');
   rr = rr/100;
   save('response4s','rr','-ascii');