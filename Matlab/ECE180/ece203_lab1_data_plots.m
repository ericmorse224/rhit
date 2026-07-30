% ECE203 Lab 1: Linear and log-log data plots
%
% INSTRUCTIONS:
% 1. Update the data values and plot labels with your own values
% 2. Run the script
% 3. Select "File | Print Preview" on the figure window
% 4. Click these buttons in order: "Landscape" and "Fill Page"
% 5. Click the "Print" button

%----------------------------------------------------------------
% Data values, axis labels, and plot title
x = [1.2 15 47 100 750];
y = [20.9 1.67 1.533 0.256 .0332];
xtext = 'Nominal Resistance (kOhm)';
ytext = 'Measured Power (mW)';
ptext = 'Power vs Resistance';
%----------------------------------------------------------------

% Create a figure window with room for two plots
subplot(2,1,1)

% Create the linear plot
plot(x,y,'.-')
grid on
xlabel(xtext)
ylabel(ytext)
title(ptext)

% Create the log-log plot
subplot(2,1,2)
loglog(x,y,'.-')
grid on
xlabel(xtext)
ylabel(ytext)
title(ptext)

% All done!