% ECE203 Lab 3: V-I characteristic curves
%
% INSTRUCTIONS:
% 1. Enter your data values, plot limits, and plot title
% 2. Run the script
% 3. Select "File | Print Preview" on the figure window
% 4. Click these buttons in order: "Landscape" and "Fill Page"
% 5. Click the "Print" button

%----------------------------------------------------------------

% Title of the plot
ptitle = 'I-V and P-V characteristic: LM317 6V Source';

% Data values in the order V (in volts) and I (in mA)
vi = [	0 	12.644 ;
	1	12.644 ;
	2	12.644 ;
    3   12.644;
	4	12.644;
    5   12.644;
    6   12.644
    
    % no semi-colon for final pair
];

% Plot limits
uselimits = 0; % 1 => use plot limits below, 0 => auto limits
vlim = [0 6];	% V minimum to maximum values
ilim = [0 20];	% I minimum to maximum values
plim = [0 100];	% P minimum to maximum values

%----------------------------------------------------------------

% Standard plot labels and styles
ilabel = 'I [mA]';
vlabel = 'V [V]';
plabel = 'P [mW]';
ivtitle = 'I vs. V';
pvtitle = 'P vs. V';
ilstyle = '-';
plstyle = '-';
imstyle = 'o';
pmstyle = 's';
lwidth = 0.5;

% Plot current and voltage on the same graph
figure
[ax,h1,h2] = plotyy(vi(:,1),vi(:,2),vi(:,1),vi(:,1).*vi(:,2));
set(get(ax(1),'Ylabel'),'String',ilabel) 
set(get(ax(2),'Ylabel'),'String',plabel) 
xlabel(vlabel)
title(ptitle)
set(h1,'LineStyle',ilstyle,'Marker',imstyle,'LineWidth',lwidth)
set(h2,'LineStyle',plstyle,'Marker',pmstyle,'LineWidth',lwidth)
if uselimits
   xlim = vlim;
   axes(ax(1)); set(ax(1),'YTickMode','auto'); axis(ax(1),[vlim ilim])
   axes(ax(2)); set(ax(2),'YTickMode','auto'); axis(ax(2),[vlim plim])
end
grid on

% All done!
