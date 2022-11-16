%%
clear;
load_system('niof_model')
t0 = datetime('30-Apr-2021');

%% 
% Cargamos ds y 
load("src/data_ds_"+string(t0)+".mat");

%%
T = 2;
tspan = days(ds.DateTime - t0);
h0 = ds.DateTime(1).Hour + ds.DateTime(1).Minute/60;
%% 
% Formateamos la señal de clima exterior para 
clf
%
S01_EC = [];
S01_EC.signals.values = [ds.temperature+273.15 ds.radiation+5 ds.humidity ds.wind];
S01_EC.signals.dimensions = 4;
S01_EC.time = tspan;
%
%%
set_params_blocks
%%
%
BuildBusFlow;
set_param('niof_model', 'MinimalZcImpactIntegration', 'on')
slbuild('niof_model')
%% 
% Con el fin de ejecutar el modelo compilado con otros parametros 
% es necesario crear un fichero .mat que contenga una variable generada por
% la funcion de MATLAB rsimgetrtp. Esta funcion toma como entrada el nombre
% del modelo de Simulink, de manera que crear un variable tipo structura
% que tiene el formato concreto para la introducción de los paramtros del
% modelo. 
%
% La variable del modelo estan definidas en Simulink. En la pestana Model
% Data Editor, en la subpestana Model WorkSpace. Alli se encuentra la
% variables que existen en el modelo. 
%
%
NIOF_parameters_simulink_Structure = rsimgetrtp('niof_model');

mkdir('auxiliar_files')
%
save('auxiliar_files/NIOF_parameters_simulink_Structure.mat','NIOF_parameters_simulink_Structure','calendar','parameters')