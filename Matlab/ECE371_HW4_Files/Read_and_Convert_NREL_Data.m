%Read and save NREF Data in MATLAB Format
fn=uigetfile('.csv');
NREL_Data=csvread(fn);
year=NREL_Data(:,1);
month=NREL_Data(:,2);
day=NREL_Data(:,3);
hour=NREL_Data(:,4);
min=NREL_Data(:,5);
DHI=NREL_Data(:,6); %W/m^2 Diffuse Horizontal Irradiance
DNI=NREL_Data(:,7);%W/m^2 Direct Normal Irradiance
GHI=NREL_Data(:,8);%W/m^2 Global Horizontal Irradiance, GHI = DHI + DNI * cos (Z)where Z is the solar zenith angle. 
Clear_Sky_DHI=NREL_Data(:,9);%W/m^2
Clear_Sky_DNI=NREL_Data(:,10);%W/m^2
Clear_Sky_GHI=NREL_Data(:,11);%W/m^2
Cloud_Type=NREL_Data(:,12);
Dew_Point=NREL_Data(:,13); %Degrees C
Temperature=NREL_Data(:,14); %Degrees C
Pressure=NREL_Data(:,15); %mbar
Relative_Humidity=NREL_Data(:,16); %Percent
Solar_Zenith=NREL_Data(:,17);% Degrees times 100
Solar_Inclination = 90-Solar_Zenith/100; % This is what we call beta.
Precipitable_Water=NREL_Data(:,18);% mm
Wind_Direction=NREL_Data(:,19); % Degrees
Wind_Speed=NREL_Data(:,20); %m/s
Fill_Flag=NREL_Data(:,21);
Surface_Albedo=NREL_Data(:,22);
time = datenum(year, month, day, hour, min,0);
%%


plot(datetime(datestr(time)),DHI,'r', datetime(datestr(time)),DNI, 'b');
legend('Diffuse Horizontal', 'Direct Normal');
xlabel('Date');
ylabel('Irradiance W/m^2');
tn=sprintf('Direct Normal Irradiance and Diffuse Horizontal Irradiance\n%s', strrep(fn,'_',' '));
title(tn);



%%
subplot(2,1,1)
plot(datetime(datestr(time)),DHI,'r', datetime(datestr(time)),DNI, 'b');
legend('Diffuse Horizontal', 'Direct Normal');
xlabel('Date');
ylabel('Irradiance W/m^2');
tn=sprintf('Direct Normal Irradiance and Diffuse Horizontal Irradiance\n%s', strrep(fn,'_',' '));
title(tn);
subplot(2,1,2)
plot(datetime(datestr(time)),Cloud_Type);
legend('Cloud Type');
xlabel('Date');
ylabel('Cloud Type');
title('Cloud Cover');

%%

plot(datetime(datestr(time)),Clear_Sky_DHI,'r', datetime(datestr(time)),Clear_Sky_DNI, 'b');
legend('Diffuse Horizontal', 'Direct Normal');
xlabel('Date');
ylabel('Irradiance W/m^2');
tn=sprintf('Clear Sky Direct Normal Irradiance and Diffuse Horizontal Irradiance\n%s', strrep(fn,'_',' '));
title(tn);


%%
subplot(2,1,1)
plot(datetime(datestr(time)),Clear_Sky_DHI,'r', datetime(datestr(time)),Clear_Sky_DNI, 'b');
legend('Diffuse Horizontal', 'Direct Normal');
xlabel('Date');
ylabel('Irradiance W/m^2');
tn=sprintf('Clear Sky Direct Normal Irradiance and Diffuse Horizontal Irradiance\n%s', strrep(fn,'_',' '));
title(tn);
subplot(2,1,2)
plot(datetime(datestr(time)),(Solar_Inclination>0).*Solar_Inclination);
legend('Solar Inclination');
xlabel('Date');
ylabel('Solar Inclination (Degrees)');
title('Solar Inclination');

%%
% The March Equinox
Day1=datenum(2016,3,21,0,0,0);
Day2=datenum(2016,3,22,0,0,0);
Day1_Index=find(time==Day1,1);
Day2_Index=find(time==Day2,1);

subplot(2,1,1)
plot(datetime(datestr(time(Day1_Index:Day2_Index))),DHI(Day1_Index:Day2_Index),'r',...
    datetime(datestr(time(Day1_Index:Day2_Index))),DNI(Day1_Index:Day2_Index), 'b');
legend('Diffuse Horizontal', 'Direct Normal');
xlabel('Date');
ylabel('Irradiance W/m^2');
tn=sprintf('Direct Normal Irradiance and Diffuse Horizontal Irradiance\n%s', strrep(fn,'_',' '));
title(tn);
subplot(2,1,2)
plot(datetime(datestr(time(Day1_Index:Day2_Index))),Clear_Sky_DHI(Day1_Index:Day2_Index),'r',...
    datetime(datestr(time(Day1_Index:Day2_Index))),Clear_Sky_DNI(Day1_Index:Day2_Index), 'b');
legend('Diffuse Horizontal', 'Direct Normal');
xlabel('Date');
ylabel('Irradiance W/m^2');
title('Clear Sky Direct Normal Irradiance and Diffuse Horizontal Irradiance');
%%
% The March Equinox
Day1=datenum(2016,3,21,0,0,0);
Day2=datenum(2016,3,22,0,0,0);
Day1_Index=find(time==Day1,1);
Day2_Index=find(time==Day2,1);

subplot(2,1,1)
plot(datetime(datestr(time(Day1_Index:Day2_Index))),Clear_Sky_DHI(Day1_Index:Day2_Index),'r',...
    datetime(datestr(time(Day1_Index:Day2_Index))),Clear_Sky_DNI(Day1_Index:Day2_Index), 'b');
legend('Diffuse Horizontal', 'Direct Normal');
xlabel('Date');
ylabel('Irradiance W/m^2');
tn=sprintf('Clear Sky Direct Normal Irradiance and Diffuse Horizontal Irradiance\n%s', strrep(fn,'_',' '));
title(tn);
subplot(2,1,2)
plot(datetime(datestr(time(Day1_Index:Day2_Index))),(Solar_Inclination(Day1_Index:Day2_Index)>0).*Solar_Inclination(Day1_Index:Day2_Index));
legend('Solar Inclination');
xlabel('Date');
ylabel('Solar Inclination (Degrees)');
title('Solar Inclination');
%%
% The Summer Solstice
Day1=datenum(2016,6,21,0,0,0);
Day2=datenum(2016,6,22,0,0,0);
Day1_Index=find(time==Day1,1);
Day2_Index=find(time==Day2,1);

subplot(2,1,1)
plot(datetime(datestr(time(Day1_Index:Day2_Index))),DHI(Day1_Index:Day2_Index),'r',...
    datetime(datestr(time(Day1_Index:Day2_Index))),DNI(Day1_Index:Day2_Index), 'b');
legend('Diffuse Horizontal', 'Direct Normal');
xlabel('Date');
ylabel('Irradiance W/m^2');
tn=sprintf('Direct Normal Irradiance and Diffuse Horizontal Irradiance\n%s', strrep(fn,'_',' '));
title(tn);
subplot(2,1,2)
plot(datetime(datestr(time(Day1_Index:Day2_Index))),Clear_Sky_DHI(Day1_Index:Day2_Index),'r',...
    datetime(datestr(time(Day1_Index:Day2_Index))),Clear_Sky_DNI(Day1_Index:Day2_Index), 'b');
legend('Diffuse Horizontal', 'Direct Normal');
xlabel('Date');
ylabel('Irradiance W/m^2');
title('Clear Sky Direct Normal Irradiance and Diffuse Horizontal Irradiance');

%%
% The September Equinox
Day1=datenum(2016,9,21,0,0,0);
Day2=datenum(2016,9,22,0,0,0);
Day1_Index=find(time==Day1,1);
Day2_Index=find(time==Day2,1);

subplot(2,1,1)
plot(datetime(datestr(time(Day1_Index:Day2_Index))),DHI(Day1_Index:Day2_Index),'r',...
    datetime(datestr(time(Day1_Index:Day2_Index))),DNI(Day1_Index:Day2_Index), 'b');
legend('Diffuse Horizontal', 'Direct Normal');
xlabel('Date');
ylabel('Irradiance W/m^2');
tn=sprintf('Direct Normal Irradiance and Diffuse Horizontal Irradiance\n%s', strrep(fn,'_',' '));
title(tn);
subplot(2,1,2)
plot(datetime(datestr(time(Day1_Index:Day2_Index))),Clear_Sky_DHI(Day1_Index:Day2_Index),'r',...
    datetime(datestr(time(Day1_Index:Day2_Index))),Clear_Sky_DNI(Day1_Index:Day2_Index), 'b');
legend('Diffuse Horizontal', 'Direct Normal');
xlabel('Date');
ylabel('Irradiance W/m^2');
title('Clear Sky Direct Normal Irradiance and Diffuse Horizontal Irradiance');

%%
% The Winter Solstice
Day1=datenum(2016,12,21,0,0,0);
Day2=datenum(2016,12,22,0,0,0);
Day1_Index=find(time==Day1,1);
Day2_Index=find(time==Day2,1);

subplot(2,1,1)
plot(datetime(datestr(time(Day1_Index:Day2_Index))),DHI(Day1_Index:Day2_Index),'r',...
    datetime(datestr(time(Day1_Index:Day2_Index))),DNI(Day1_Index:Day2_Index), 'b');
legend('Diffuse Horizontal', 'Direct Normal');
xlabel('Date');
ylabel('Irradiance W/m^2');
tn=sprintf('Direct Normal Irradiance and Diffuse Horizontal Irradiance\n%s', strrep(fn,'_',' '));
title(tn);
subplot(2,1,2)
plot(datetime(datestr(time(Day1_Index:Day2_Index))),Clear_Sky_DHI(Day1_Index:Day2_Index),'r',...
    datetime(datestr(time(Day1_Index:Day2_Index))),Clear_Sky_DNI(Day1_Index:Day2_Index), 'b');
legend('Diffuse Horizontal', 'Direct Normal');
xlabel('Date');
ylabel('Irradiance W/m^2');
title('Clear Sky Direct Normal Irradiance and Diffuse Horizontal Irradiance');

%%
%Calculate Energy
Seconds_per_Day = 60*60*24;

%Average Energy per day for the entire year
Average_Daily_Energy_J=trapz(time*Seconds_per_Day,Clear_Sky_DNI)/(time(end)-time(1)); %per Meter Squared
Average_Daily_Energy_kWh=Average_Daily_Energy_J/3.6e6; %kWh/m^2

%Average Energy in December
Day1=datenum(2016,12,1,0,0,0);
Day2=datenum(2016,12,31,0,0,0);
Day1_Index=find(time==Day1,1);
Day2_Index=find(time==Day2,1);
Average_Daily_Energy_Dec_J=trapz(time(Day1_Index:Day2_Index)*Seconds_per_Day,Clear_Sky_DNI(Day1_Index:Day2_Index))/(Day2-Day1); %per Meter Squared
Average_Daily_Energy_Dec_kWh=Average_Daily_Energy_Dec_J/3.6e6; %kWh/m^2


%Average Energy in March
Day1=datenum(2016,3,1,0,0,0);
Day2=datenum(2016,3,31,0,0,0);
Day1_Index=find(time==Day1,1);
Day2_Index=find(time==Day2,1);
Average_Daily_Energy_Mar_J=trapz(time(Day1_Index:Day2_Index)*Seconds_per_Day,Clear_Sky_DNI(Day1_Index:Day2_Index))/(Day2-Day1); %per Meter Squared
Average_Daily_Energy_Mar_kWh=Average_Daily_Energy_Mar_J/3.6e6; %kWh/m^2

%Average Energy in June
Day1=datenum(2016,6,1,0,0,0);
Day2=datenum(2016,6,30,0,0,0);
Day1_Index=find(time==Day1,1);
Day2_Index=find(time==Day2,1);
Average_Daily_Energy_Jun_J=trapz(time(Day1_Index:Day2_Index)*Seconds_per_Day,Clear_Sky_DNI(Day1_Index:Day2_Index))/(Day2-Day1); %per Meter Squared
Average_Daily_Energy_Jun_kWh=Average_Daily_Energy_Jun_J/3.6e6; %kWh/m^2

%Average Energy in September
Day1=datenum(2016,9,1,0,0,0);
Day2=datenum(2016,9,30,0,0,0);
Day1_Index=find(time==Day1,1);
Day2_Index=find(time==Day2,1);
Average_Daily_Energy_Sep_J=trapz(time(Day1_Index:Day2_Index)*Seconds_per_Day,Clear_Sky_DNI(Day1_Index:Day2_Index))/(Day2-Day1); %per Meter Squared
Average_Daily_Energy_Sep_kWh=Average_Daily_Energy_Sep_J/3.6e6; %kWh/m^2

%Average Energy in January
Day1=datenum(2016,1,1,0,0,0);
Day2=datenum(2016,1,31,0,0,0);
Day1_Index=find(time==Day1,1);
Day2_Index=find(time==Day2,1);
Average_Daily_Energy_Jan_J=trapz(time(Day1_Index:Day2_Index)*Seconds_per_Day,Clear_Sky_DNI(Day1_Index:Day2_Index))/(Day2-Day1); %per Meter Squared
Average_Daily_Energy_Jan_kWh=Average_Daily_Energy_Jan_J/3.6e6; %kWh/m^2

%Average Energy in February
Day1=datenum(2016,2,1,0,0,0);
Day2=datenum(2016,2,28,0,0,0);
Day1_Index=find(time==Day1,1);
Day2_Index=find(time==Day2,1);
Average_Daily_Energy_Feb_J=trapz(time(Day1_Index:Day2_Index)*Seconds_per_Day,Clear_Sky_DNI(Day1_Index:Day2_Index))/(Day2-Day1); %per Meter Squared
Average_Daily_Energy_Feb_kWh=Average_Daily_Energy_Feb_J/3.6e6; %kWh/m^2

%Average Energy in April
Day1=datenum(2016,4,1,0,0,0);
Day2=datenum(2016,4,30,0,0,0);
Day1_Index=find(time==Day1,1);
Day2_Index=find(time==Day2,1);
Average_Daily_Energy_Apr_J=trapz(time(Day1_Index:Day2_Index)*Seconds_per_Day,Clear_Sky_DNI(Day1_Index:Day2_Index))/(Day2-Day1); %per Meter Squared
Average_Daily_Energy_Apr_kWh=Average_Daily_Energy_Apr_J/3.6e6; %kWh/m^2

%Average Energy in May
Day1=datenum(2016,5,1,0,0,0);
Day2=datenum(2016,5,31,0,0,0);
Day1_Index=find(time==Day1,1);
Day2_Index=find(time==Day2,1);
Average_Daily_Energy_May_J=trapz(time(Day1_Index:Day2_Index)*Seconds_per_Day,Clear_Sky_DNI(Day1_Index:Day2_Index))/(Day2-Day1); %per Meter Squared
Average_Daily_Energy_May_kWh=Average_Daily_Energy_May_J/3.6e6; %kWh/m^2

%Average Energy in July
Day1=datenum(2016,7,1,0,0,0);
Day2=datenum(2016,7,31,0,0,0);
Day1_Index=find(time==Day1,1);
Day2_Index=find(time==Day2,1);
Average_Daily_Energy_Jul_J=trapz(time(Day1_Index:Day2_Index)*Seconds_per_Day,Clear_Sky_DNI(Day1_Index:Day2_Index))/(Day2-Day1); %per Meter Squared
Average_Daily_Energy_Jul_kWh=Average_Daily_Energy_Jul_J/3.6e6; %kWh/m^2

%Average Energy in August
Day1=datenum(2016,8,1,0,0,0);
Day2=datenum(2016,8,31,0,0,0);
Day1_Index=find(time==Day1,1);
Day2_Index=find(time==Day2,1);
Average_Daily_Energy_Aug_J=trapz(time(Day1_Index:Day2_Index)*Seconds_per_Day,Clear_Sky_DNI(Day1_Index:Day2_Index))/(Day2-Day1); %per Meter Squared
Average_Daily_Energy_Aug_kWh=Average_Daily_Energy_Aug_J/3.6e6; %kWh/m^2

%Average Energy in October
Day1=datenum(2016,10,1,0,0,0);
Day2=datenum(2016,10,31,0,0,0);
Day1_Index=find(time==Day1,1);
Day2_Index=find(time==Day2,1);
Average_Daily_Energy_Oct_J=trapz(time(Day1_Index:Day2_Index)*Seconds_per_Day,Clear_Sky_DNI(Day1_Index:Day2_Index))/(Day2-Day1); %per Meter Squared
Average_Daily_Energy_Oct_kWh=Average_Daily_Energy_Oct_J/3.6e6; %kWh/m^2

%Average Energy in November
Day1=datenum(2016,11,1,0,0,0);
Day2=datenum(2016,11,30,0,0,0);
Day1_Index=find(time==Day1,1);
Day2_Index=find(time==Day2,1);
Average_Daily_Energy_Nov_J=trapz(time(Day1_Index:Day2_Index)*Seconds_per_Day,Clear_Sky_DNI(Day1_Index:Day2_Index))/(Day2-Day1); %per Meter Squared
Average_Daily_Energy_Nov_kWh=Average_Daily_Energy_Nov_J/3.6e6; %kWh/m^2

fprintf('\n\nAverage Daily Clear Sky Energy from Direct Normal Irradiance.\n');
fprintf('-------------------------------------------------------------\n');
fprintf('Daily Average for the entire year: %5.3f kWh/m^2\n', Average_Daily_Energy_kWh);
fprintf('Daily Average for January:         %5.3f kWh/m^2\n', Average_Daily_Energy_Jan_kWh);
fprintf('Daily Average for February:         %5.3f kWh/m^2\n', Average_Daily_Energy_Feb_kWh);
fprintf('Daily Average for March:           %5.3f kWh/m^2\n', Average_Daily_Energy_Mar_kWh);
fprintf('Daily Average for April:         %5.3f kWh/m^2\n', Average_Daily_Energy_Apr_kWh);
fprintf('Daily Average for May:         %5.3f kWh/m^2\n', Average_Daily_Energy_May_kWh);
fprintf('Daily Average for June:            %5.3f kWh/m^2\n', Average_Daily_Energy_Jun_kWh);
fprintf('Daily Average for July:         %5.3f kWh/m^2\n', Average_Daily_Energy_Jul_kWh);
fprintf('Daily Average for August:         %5.3f kWh/m^2\n', Average_Daily_Energy_Aug_kWh);
fprintf('Daily Average for September:       %5.3f kWh/m^2\n', Average_Daily_Energy_Sep_kWh);
fprintf('Daily Average for October:         %5.3f kWh/m^2\n', Average_Daily_Energy_Oct_kWh);
fprintf('Daily Average for November:         %5.3f kWh/m^2\n', Average_Daily_Energy_Nov_kWh);
fprintf('Daily Average for December:        %5.3f kWh/m^2\n', Average_Daily_Energy_Dec_kWh);
fprintf('\n\n');

%%
%Calculate Energy in DHI
Seconds_per_Day = 60*60*24;

%Average Energy per day for the entire year
Average_Daily_Energy_J=trapz(time*Seconds_per_Day,Clear_Sky_DHI)/(time(end)-time(1)); %per Meter Squared
Average_Daily_Energy_kWh=Average_Daily_Energy_J/3.6e6; %kWh/m^2

%Average Energy in December
Day1=datenum(2016,12,1,0,0,0);
Day2=datenum(2016,12,31,0,0,0);
Day1_Index=find(time==Day1,1);
Day2_Index=find(time==Day2,1);
Average_Daily_Energy_Dec_J=trapz(time(Day1_Index:Day2_Index)*Seconds_per_Day,Clear_Sky_DHI(Day1_Index:Day2_Index))/(Day2-Day1); %per Meter Squared
Average_Daily_Energy_Dec_kWh=Average_Daily_Energy_Dec_J/3.6e6; %kWh/m^2


%Average Energy in March
Day1=datenum(2016,3,1,0,0,0);
Day2=datenum(2016,3,31,0,0,0);
Day1_Index=find(time==Day1,1);
Day2_Index=find(time==Day2,1);
Average_Daily_Energy_Mar_J=trapz(time(Day1_Index:Day2_Index)*Seconds_per_Day,Clear_Sky_DHI(Day1_Index:Day2_Index))/(Day2-Day1); %per Meter Squared
Average_Daily_Energy_Mar_kWh=Average_Daily_Energy_Mar_J/3.6e6; %kWh/m^2

%Average Energy in June
Day1=datenum(2016,6,1,0,0,0);
Day2=datenum(2016,6,30,0,0,0);
Day1_Index=find(time==Day1,1);
Day2_Index=find(time==Day2,1);
Average_Daily_Energy_Jun_J=trapz(time(Day1_Index:Day2_Index)*Seconds_per_Day,Clear_Sky_DHI(Day1_Index:Day2_Index))/(Day2-Day1); %per Meter Squared
Average_Daily_Energy_Jun_kWh=Average_Daily_Energy_Jun_J/3.6e6; %kWh/m^2

%Average Energy in September
Day1=datenum(2016,9,1,0,0,0);
Day2=datenum(2016,9,30,0,0,0);
Day1_Index=find(time==Day1,1);
Day2_Index=find(time==Day2,1);
Average_Daily_Energy_Sep_J=trapz(time(Day1_Index:Day2_Index)*Seconds_per_Day,Clear_Sky_DHI(Day1_Index:Day2_Index))/(Day2-Day1); %per Meter Squared
Average_Daily_Energy_Sep_kWh=Average_Daily_Energy_Sep_J/3.6e6; %kWh/m^2

%Average Energy in January
Day1=datenum(2016,1,1,0,0,0);
Day2=datenum(2016,1,31,0,0,0);
Day1_Index=find(time==Day1,1);
Day2_Index=find(time==Day2,1);
Average_Daily_Energy_Jan_J=trapz(time(Day1_Index:Day2_Index)*Seconds_per_Day,Clear_Sky_DHI(Day1_Index:Day2_Index))/(Day2-Day1); %per Meter Squared
Average_Daily_Energy_Jan_kWh=Average_Daily_Energy_Jan_J/3.6e6; %kWh/m^2

%Average Energy in February
Day1=datenum(2016,2,1,0,0,0);
Day2=datenum(2016,2,28,0,0,0);
Day1_Index=find(time==Day1,1);
Day2_Index=find(time==Day2,1);
Average_Daily_Energy_Feb_J=trapz(time(Day1_Index:Day2_Index)*Seconds_per_Day,Clear_Sky_DHI(Day1_Index:Day2_Index))/(Day2-Day1); %per Meter Squared
Average_Daily_Energy_Feb_kWh=Average_Daily_Energy_Feb_J/3.6e6; %kWh/m^2

%Average Energy in April
Day1=datenum(2016,4,1,0,0,0);
Day2=datenum(2016,4,30,0,0,0);
Day1_Index=find(time==Day1,1);
Day2_Index=find(time==Day2,1);
Average_Daily_Energy_Apr_J=trapz(time(Day1_Index:Day2_Index)*Seconds_per_Day,Clear_Sky_DHI(Day1_Index:Day2_Index))/(Day2-Day1); %per Meter Squared
Average_Daily_Energy_Apr_kWh=Average_Daily_Energy_Apr_J/3.6e6; %kWh/m^2

%Average Energy in May
Day1=datenum(2016,5,1,0,0,0);
Day2=datenum(2016,5,31,0,0,0);
Day1_Index=find(time==Day1,1);
Day2_Index=find(time==Day2,1);
Average_Daily_Energy_May_J=trapz(time(Day1_Index:Day2_Index)*Seconds_per_Day,Clear_Sky_DHI(Day1_Index:Day2_Index))/(Day2-Day1); %per Meter Squared
Average_Daily_Energy_May_kWh=Average_Daily_Energy_May_J/3.6e6; %kWh/m^2

%Average Energy in July
Day1=datenum(2016,7,1,0,0,0);
Day2=datenum(2016,7,31,0,0,0);
Day1_Index=find(time==Day1,1);
Day2_Index=find(time==Day2,1);
Average_Daily_Energy_Jul_J=trapz(time(Day1_Index:Day2_Index)*Seconds_per_Day,Clear_Sky_DHI(Day1_Index:Day2_Index))/(Day2-Day1); %per Meter Squared
Average_Daily_Energy_Jul_kWh=Average_Daily_Energy_Jul_J/3.6e6; %kWh/m^2

%Average Energy in August
Day1=datenum(2016,8,1,0,0,0);
Day2=datenum(2016,8,31,0,0,0);
Day1_Index=find(time==Day1,1);
Day2_Index=find(time==Day2,1);
Average_Daily_Energy_Aug_J=trapz(time(Day1_Index:Day2_Index)*Seconds_per_Day,Clear_Sky_DHI(Day1_Index:Day2_Index))/(Day2-Day1); %per Meter Squared
Average_Daily_Energy_Aug_kWh=Average_Daily_Energy_Aug_J/3.6e6; %kWh/m^2

%Average Energy in October
Day1=datenum(2016,10,1,0,0,0);
Day2=datenum(2016,10,31,0,0,0);
Day1_Index=find(time==Day1,1);
Day2_Index=find(time==Day2,1);
Average_Daily_Energy_Oct_J=trapz(time(Day1_Index:Day2_Index)*Seconds_per_Day,Clear_Sky_DHI(Day1_Index:Day2_Index))/(Day2-Day1); %per Meter Squared
Average_Daily_Energy_Oct_kWh=Average_Daily_Energy_Oct_J/3.6e6; %kWh/m^2

%Average Energy in November
Day1=datenum(2016,11,1,0,0,0);
Day2=datenum(2016,11,30,0,0,0);
Day1_Index=find(time==Day1,1);
Day2_Index=find(time==Day2,1);
Average_Daily_Energy_Nov_J=trapz(time(Day1_Index:Day2_Index)*Seconds_per_Day,Clear_Sky_DHI(Day1_Index:Day2_Index))/(Day2-Day1); %per Meter Squared
Average_Daily_Energy_Nov_kWh=Average_Daily_Energy_Nov_J/3.6e6; %kWh/m^2

fprintf('\n\nAverage Daily Clear Sky Energy from Direct Horizontal Irradiance.\n');
fprintf('-------------------------------------------------------------\n');
fprintf('Daily Average for the entire year: %5.3f kWh/m^2\n', Average_Daily_Energy_kWh);
fprintf('Daily Average for January:         %5.3f kWh/m^2\n', Average_Daily_Energy_Jan_kWh);
fprintf('Daily Average for February:         %5.3f kWh/m^2\n', Average_Daily_Energy_Feb_kWh);
fprintf('Daily Average for March:           %5.3f kWh/m^2\n', Average_Daily_Energy_Mar_kWh);
fprintf('Daily Average for April:         %5.3f kWh/m^2\n', Average_Daily_Energy_Apr_kWh);
fprintf('Daily Average for May:         %5.3f kWh/m^2\n', Average_Daily_Energy_May_kWh);
fprintf('Daily Average for June:            %5.3f kWh/m^2\n', Average_Daily_Energy_Jun_kWh);
fprintf('Daily Average for July:         %5.3f kWh/m^2\n', Average_Daily_Energy_Jul_kWh);
fprintf('Daily Average for August:         %5.3f kWh/m^2\n', Average_Daily_Energy_Aug_kWh);
fprintf('Daily Average for September:       %5.3f kWh/m^2\n', Average_Daily_Energy_Sep_kWh);
fprintf('Daily Average for October:         %5.3f kWh/m^2\n', Average_Daily_Energy_Oct_kWh);
fprintf('Daily Average for November:         %5.3f kWh/m^2\n', Average_Daily_Energy_Nov_kWh);
fprintf('Daily Average for December:        %5.3f kWh/m^2\n', Average_Daily_Energy_Dec_kWh);
fprintf('\n\n');

%% Read and save NREF Data in MATLAB Format
fn=uigetfile('.csv');
NREL_Data=csvread(fn);
year=NREL_Data(:,1);
month=NREL_Data(:,2);
day=NREL_Data(:,3);
hour=NREL_Data(:,4);
min=NREL_Data(:,5);
Clear_Sky_DNI1=NREL_Data(:,10);%W/m^2
Solar_Zenith=NREL_Data(:,17);% Degrees times 100
Solar_Inclination1 = 90-Solar_Zenith/100; % This is what we call beta.

time = datenum(year, month, day, hour, min,0);

fn=uigetfile('.csv');
NREL_Data=csvread(fn);
year=NREL_Data(:,1);
month=NREL_Data(:,2);
day=NREL_Data(:,3);
hour=NREL_Data(:,4);
min=NREL_Data(:,5);
Clear_Sky_DNI2=NREL_Data(:,10);%W/m^2
Solar_Zenith=NREL_Data(:,17);% Degrees times 100
Solar_Inclination2 = 90-Solar_Zenith/100; % This is what we call beta.

time = datenum(year, month, day, hour, min,0);

fn=uigetfile('.csv');
NREL_Data=csvread(fn);
year=NREL_Data(:,1);
month=NREL_Data(:,2);
day=NREL_Data(:,3);
hour=NREL_Data(:,4);
min=NREL_Data(:,5);
Clear_Sky_DNI3=NREL_Data(:,10);%W/m^2
Solar_Zenith=NREL_Data(:,17);% Degrees times 100
Solar_Inclination3 = 90-Solar_Zenith/100; % This is what we call beta.

time = datenum(year, month, day, hour, min,0);

fn=uigetfile('.csv');
NREL_Data=csvread(fn);
year=NREL_Data(:,1);
month=NREL_Data(:,2);
day=NREL_Data(:,3);
hour=NREL_Data(:,4);
min=NREL_Data(:,5);
Clear_Sky_DNI4=NREL_Data(:,10);%W/m^2
Solar_Zenith=NREL_Data(:,17);% Degrees times 100
Solar_Inclination4 = 90-Solar_Zenith/100; % This is what we call beta.

time = datenum(year, month, day, hour, min,0);

%%
subplot(2,1,1)
plot(datetime(datestr(time)),Clear_Sky_DNI1, datetime(datestr(time)), Clear_Sky_DNI2, datetime(datestr(time)), Clear_Sky_DNI3, datetime(datestr(time)), Clear_Sky_DNI4);
legend('Terre Haute', 'Southern California', 'Brazil Equator', 'Moore Haven Florida');
xlabel('Date');
ylabel('Irradiance W/m^2');
tn=sprintf('Clear Sky Direct Normal Irradiance\n%s');
title(tn);
subplot(2,1,2)
plot(datetime(datestr(time)),(Solar_Inclination1>0).*Solar_Inclination1, datetime(datestr(time)),(Solar_Inclination2>0).*Solar_Inclination2, datetime(datestr(time)),(Solar_Inclination3>0).*Solar_Inclination3, datetime(datestr(time)),(Solar_Inclination4>0).*Solar_Inclination4);
legend('Terre Haute', 'Southern California', 'Brazil Equator', 'Moore Haven Florida');
xlabel('Date');
ylabel('Solar Inclination (Degrees)');
title('Solar Inclination');