%%
clear;
% Cargamos las variables:
% - NIOF_parameters_simulink_Structure
% - calendar
% - parameters

load('auxiliar_files/NIOF_parameters_simulink_Structure.mat')
 

calendar.GH2.RFSystem.Control3.tinit = 1;
calendar.GH2.RFSystem.Control3.tend = 4;

%%
update_params;
save('auxiliar_files/NIOF_parameters_simulink_Structure.mat','NIOF_parameters_simulink_Structure','calendar','parameters')

%%
system("./niof_model -tf 5 -p auxiliar_files/NIOF_parameters_simulink_Structure.mat")
%%
load('niof_model.mat')
%%
results = parse_niof_model(rt_yout);
%%
figure(1)
clf 
hold on
Tk = 273.15;
plot(rt_tout,results.control.PumpBio2GH1)
plot(rt_tout,results.control.PumpBio2GH2)
plot(rt_tout,results.control.PumpGH32Bio,'--')
plot(rt_tout,results.control.PumpIn)
ylabel('m^3/s')
legend('Bio->GH1','Bio->GH2','GH3->Bio','In')

%%
figure(2)
clf
hold on
for i = 1:4
    plot(rt_tout,results.crops.GH2.RF{i}.Carbon.Cleaf)
end
ylabel('Leaf - Dry Matter - [kg{CHO2}/m^2]')
title('crops')
legend(repmat("crop slot  - ",4,1) + (1:4)')