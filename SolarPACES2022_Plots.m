%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plots for SolarPACES 2022 Conference
% Kaden Plewe 
% 10/10/2022
%
% The data and plots generated by this script have not
% been rigorously validated and are meant only to be 
% supporting material to the 2022 SolarPACES contribution
% titled "Seasonal Performance Characterization of a 
% Gen3 Parti-cle-Based Concentrating Solar Plant with a 
% Spatially Re-solved Transient Thermal Storage Model"
%
% Sections of the code must be commented/uncommented to
% generate results for the four seasonal simulations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear, clc, close all

chargeDurration = 6*3600;
holdDurration = 10*3600;
dischargeDurration = 8*3600;
numCycles = 7;

%% Reciever Temperature
dt1 = 10;
t1 = 0:dt1:(chargeDurration + holdDurration + dischargeDurration)*numCycles;
recieverData = load('sysData1_WinterPlot.mat'); recieverData = recieverData.sysData1;
% recieverData = load('sysData1_SpringPlot.mat'); recieverData = recieverData.sysData1;
% recieverData = load('sysData1_SummerPlot.mat'); recieverData = recieverData.sysData1;
% recieverData = load('sysData1_FallPlot.mat'); recieverData = recieverData.sysData1;

f = figure('Units', 'normalized', 'Position', [0 0 0.2 0.2], 'Visible', 'on');
plot(t1/3600, recieverData.Qsolar, '-', 'Color', [0.6350 0.0780 0.1840], 'LineWidth', 1.5); hold on;
ylabel('$Q_{solar}$ (W)', 'interpreter', 'latex', 'FontSize', 14);
ylim([0, 2.5e6]);

yyaxis right
plot(t1/3600, recieverData.Ts_out_FPR, '-', 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 1.5);
ylabel('Reciever $T_{out}$ ($^\circ$C)', 'interpreter', 'latex', 'FontSize', 14);
ylim([590, 785]);
xlim([2, 160]);

xlabel('$t$ (hours)', 'interpreter', 'latex', 'FontSize', 14);

ax = gca;
ax.YAxis(1).Color = [0.6350 0.0780 0.1840];
ax.YAxis(2).Color = [0.8500 0.3250 0.0980];

set(f,'defaultAxesColorOrder',[[0.8500 0.3250 0.0980]; [0.6350 0.0780 0.1840]]);

set(gca, 'box', 'off', 'TickDir', 'both', ...
                'TickLength', [0.01, 0.025], ...
                'TickLabelInterpreter', 'latex', 'FontSize', 12)
            
%% Storage Temperature
dt2 = 1200;
t2 = 0:dt2:(chargeDurration + holdDurration + dischargeDurration)*numCycles;
storageData = load('sysData2_WinterPlot.mat'); storageData = storageData.sysData2;
% storageData = load('sysData2_SpringPlot.mat'); storageData = storageData.sysData2;
% storageData = load('sysData2_SummerPlot.mat'); storageData = storageData.sysData2;
% storageData = load('sysData2_FallPlot.mat'); storageData = storageData.sysData2;

f = figure('Units', 'normalized', 'Position', [0 0 0.2 0.2], 'Visible', 'on');
plot(t2/3600, storageData.Ts_in_hotTES, '-', 'Color', [0.4940 0.1840 0.5560], 'LineWidth', 1.5); hold on;
ylabel('TES Inlet $T_{in}$ ($^\circ$C)', 'interpreter', 'latex', 'FontSize', 14);
ylim([590, 775]);

yyaxis right
plot(t2/3600, storageData.Ts_out_hotTES, '-', 'Color', [0 0.4470 0.7410], 'LineWidth', 1.5);
ylabel('TES Outlet $T_{out}$ ($^\circ$C)', 'interpreter', 'latex', 'FontSize', 14);
ylim([590, 775]);
xlim([2, 160]);

xlabel('$t$ (hours)', 'interpreter', 'latex', 'FontSize', 14);

ax = gca;
ax.YAxis(1).Color = [0.4940 0.1840 0.5560];
ax.YAxis(2).Color = [0 0.4470 0.7410];

set(f,'defaultAxesColorOrder',[[0 0.4470 0.7410]; [0.4940 0.1840 0.5560]]);

set(gca, 'box', 'off', 'TickDir', 'both', ...
                'TickLength', [0.01, 0.025], ...
                'TickLabelInterpreter', 'latex', 'FontSize', 12)
            
%% Heat Exchanger Temperature
dt3 = 10;
t3 = 0:dt3:(chargeDurration + holdDurration + dischargeDurration)*numCycles;
hxData = load('sysData3_WinterPlot.mat'); hxData = hxData.sysData3;
% hxData = load('sysData3_SpringPlot.mat'); hxData = hxData.sysData3;
% hxData = load('sysData3_SummerPlot.mat'); hxData = hxData.sysData3;
% hxData = load('sysData3_FallPlot.mat'); hxData = hxData.sysData3;

f = figure('Units', 'normalized', 'Position', [0 0 0.2 0.2], 'Visible', 'on');
plot(t3/3600, hxData.Ts_in_HX, '-', 'Color', [0 0.4470 0.7410], 'LineWidth', 1.5); hold on;
ylabel('Particle Inlet $T_{in}$ ($^\circ$C)', 'interpreter', 'latex', 'FontSize', 14);
ylim([590, 775]);

yyaxis right
plot(t3/3600, hxData.Tco2_out_HX, '-', 'Color', [0.3010 0.7450 0.9330], 'LineWidth', 1.5);
ylabel('sCO$_2$ Outlet $T_{out}$ ($^\circ$C)', 'interpreter', 'latex', 'FontSize', 14);
ylim([590, 775]);
xlim([2, 160]);

xlabel('$t$ (hours)', 'interpreter', 'latex', 'FontSize', 14);

ax = gca;
ax.YAxis(1).Color = [0 0.4470 0.7410];
ax.YAxis(2).Color = [0.3010 0.7450 0.9330];

set(f,'defaultAxesColorOrder',[[0.3010 0.7450 0.9330]; [0 0.4470 0.7410]]);

set(gca, 'box', 'off', 'TickDir', 'both', ...
                'TickLength', [0.01, 0.025], ...
                'TickLabelInterpreter', 'latex', 'FontSize', 12)
            
%% Particle Inlet Ramp Rate

dTsdt = zeros(size(t3));

for i = 1:length(t3)
   if i == 1 
       dTsdt(i) = (hxData.Ts_in_HX(i+1) - hxData.Ts_in_HX(i))/dt3;
   elseif i == length(t3)
       dTsdt(i) = (hxData.Ts_in_HX(i) - hxData.Ts_in_HX(i-1))/dt3;
   else
       dTsdt(i) = (hxData.Ts_in_HX(i+1) - hxData.Ts_in_HX(i-1))/(2*dt3);
   end  
end

f = figure('Units', 'normalized', 'Position', [0 0 0.2 0.2], 'Visible', 'on');
plot(t3/3600, dTsdt*60, '.k', 'LineWidth', 1.5); hold on;
ylabel('$\frac{dT_{s,in}}{dt}$ ($^\circ$C/min)', 'interpreter', 'latex', 'FontSize', 14);
xlabel('$t$ (hours)', 'interpreter', 'latex', 'FontSize', 14);
ylim([-15, 50]);
xlim([2, 160]);

set(gca, 'box', 'off', 'TickDir', 'both', ...
                'TickLength', [0.01, 0.025], ...
                'TickLabelInterpreter', 'latex', 'FontSize', 12)
            