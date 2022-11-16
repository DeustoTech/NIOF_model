main_name = 'INSTALL_DEPENDENCES_NIOF.m';
path_name = which(main_name);
path_name = replace(path_name,main_name,'');


%%
unzip('https://github.com/DeustoTech/HortiMED-Modelling-Platform/archive/refs/heads/main.zip','src/dev/')
%%
unzip('https://github.com/DeustoTech/HortiMED-Data-Sources/archive/refs/heads/main.zip','src/dev/')
%%
unzip('https://github.com/DeustoTech/HortiMED.ForecastExteriorClimate/archive/refs/heads/main.zip','src/dev/')
%%
%%
%unzip('https://github.com/DeustoTech/MechanisticSolarRadiationModel/archive/refs/heads/main.zip','src/dev/')

%%
%unzip('https://github.com/djoroya/ModellingAndControl/archive/refs/heads/master.zip','src/dev/')

%%
addpath(genpath(path_name))

