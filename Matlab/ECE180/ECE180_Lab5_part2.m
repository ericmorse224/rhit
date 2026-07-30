tp=imread('smpte.png'); %imshow(tp);
tpn=imnoise(tp,'gaussian',0,0.01); %figure, %imshow(tpn)
tpnm = medfilt2(tpn);
tpnc = conv3X3(tpn, ones(3)/3^2);
%imshowpair(tpn,tpnm,'montage')
%imtool(tpnm);
%imtool(tpnc);
%3.9
tpn=imnoise(tp,'salt & pepper',0.02);
tpnm = medfilt2(tpn);
tpnc = conv3X3(tpn, ones(3)/3^2);
%imshowpair(tpn,tpnm,'montage')
%imshowpair(tpn,tpnc, 'montage')
imshowpair(tpnm,tpnc, 'montage')