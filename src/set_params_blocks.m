
load('src/dev/HortiMED-Data-Sources-main/data/MATLAB_FORMAT/CS1_5_fish.mat')
load('src/dev/HortiMED-Data-Sources-main/data/MATLAB_FORMAT/CS1_4_prod.mat')
%
S_area_hole = 0.01;

% calendar.GH3.tank1.tinit = days(fish.tilapia.DateTime(1) - t0);
% calendar.GH3.tank1.tend  = days(fish.tilapia.DateTime(end) - t0);
% 
% calendar.GH3.tank2.tinit = days(fish.mullet.DateTime(1) - t0);
% calendar.GH3.tank2.tend  = days(fish.mullet.DateTime(end) - t0);
% 
% calendar.GH3.tank3.tinit = days(fish.clams.DateTime(1) - t0);
% calendar.GH3.tank3.tend  = days(fish.clams.DateTime(end) - t0);
% 
% calendar.GH3.tank4.tinit = days(fish.silver.DateTime(1) - t0);
% calendar.GH3.tank4.tend  = days(fish.silver.DateTime(end) - t0);
% %
%% default 
calendar = [];
for ivar = find_system({'niof_model'},'Name','Start/Stop Window')'
    spp = strsplit(ivar{:},'/');
    spp{2} = replace(spp{2},' ','');
    spp{3} = replace(spp{3},' ','');
    spp{4} = replace(spp{4},' ','');

    if ~strcmp('GH3',spp{2})
        namevar_init = join([spp([2 3 4]),'tinit'],'_');
        namevar_end  = join([spp([2 3 4]),'tend'],'_');

        eval(namevar_init{:}+" = 0;")
        eval(namevar_end{:}+" = 0.0;")
        % 
        eval("calendar."+join([spp([2 3 4]),'tinit'],'.') + " = " + namevar_init+";")
        eval("calendar."+join([spp([2 3 4]),'tend'],'.')  + " = " + namevar_end +";")
    else
        namevar_init = join([spp([2 3]),'tinit'],'_');
        namevar_end  = join([spp([2 3]),'tend'],'_');

        eval(namevar_init{:}+" = 0;")
        eval(namevar_end{:}+" = 0.0;")
        % 
        eval("calendar."+join([spp([2 3]),'tinit'],'.') + " = " + namevar_init+";")
        eval("calendar."+join([spp([2 3]),'tend'],'.') + " = " + namevar_end+";") 

    end
    
    set_param(ivar{:},'tinit',namevar_init{:})
    set_param(ivar{:},'tend',namevar_end{:})

end 



%% 
tp_fish = tank_p;
%
tp_fish.ThermalConductivityWall = 500;
tp_fish.wall_gain = 500;
tp_fish.d_t = 1.5;
tp_fish.T = 16 + 273.15;
tp_fish.Tsubwall = 20 + 273.5;
tp_fish.h_max = 0.83;
tp_fish.S =48;
tp_fish.h = 0.8;

%%
tp_fish_T = tp_fish;
tp_fish_T.Tsubwall = 25 + 273.5;
tp_fish_T.T = 19 + 273.15;
%
tp_fish_M = tp_fish;
tp_fish_M.Tsubwall = 12 + 273.5;
tp_fish_M.T = 18 + 273.15;

%
tp_fish_C = tp_fish;
tp_fish_C.Tsubwall = 25 + 273.5;
%
tp_fish_S = tp_fish;
tp_fish_S.Tsubwall = 8 + 273.5;
%%


%% GH1 RF
tp_GH1_RF = tank_p;
tp_GH1_RF.S = 1.25*18;
tp_GH1_RF.h_max = 0.8;
%
crop_GH1_RF = crop_p;
crop_GH1_RF.A_v = tp_GH1_RF.S/6;

%% GH1 NFT

tp_GH1_NFT = tank_p;
tp_GH1_NFT.S = 1.25*18;
tp_GH1_NFT.h_max = 0.6;

%
crop_GH1_NFT = crop_p;
crop_GH1_NFT.A_v = tp_GH1_NFT.S/6;

%% GH2 RF
tp_GH2_RF = tank_p;
tp_GH2_RF.S = 1.5*28.5;
tp_GH2_RF.h_max = 0.8;
%
crop_GH2_RF = crop_p;
crop_GH2_RF.A_v = tp_GH2_RF.S/6;

%% GH2 TRADITIONAL
tp_GH2_TRAD = tank_p;
tp_GH2_TRAD.S = 1.5*28.5;
tp_GH2_TRAD.h_max = 0.8;
%
crop_GH2_TRAD = crop_p;
crop_GH2_TRAD.A_v = tp_GH2_TRAD.S/6;

%%

for iname = ["crop_GH1_RF","crop_GH1_NFT","crop_GH2_RF","crop_GH2_TRAD"]
    cmds= iname{:}+"_slot"+(1:4)'+"="+iname{:}+";";
    for icmd = cmds'
       eval(icmd) 
    end
end
%% CLIMA GH1
climate_GH1 = climate_p;
climate_GH1.A_c = 140;
climate_GH1.A_f = 140;
climate_GH1.H = 4;
climate_GH1.minWindows = 0.5;
climate_GH1.tau_c = 0.2;
climate_GH1.T_ss = 273.15 + 15;
climate_GH1.d_c = 5.5;
%% CLIMA GH2
climate_GH2 = climate_p;
climate_GH2.A_c = 210;
climate_GH2.A_f = 210;
climate_GH2.H = 4;
climate_GH2.minWindows = 0.3;
climate_GH2.tau_c = 0.2;
climate_GH2.T_ss = 273.15 + 15;

%% CLIMA GH3
climate_GH3 = climate_p;
climate_GH3.A_c = 240;
climate_GH3.A_f = 240;
climate_GH3.H = 4;
climate_GH3.minWindows = 0.3;
climate_GH3.tau_c = 0.2;
climate_GH3.T_ss = 273.15 + 15;
%% BIO OUTSIDE
tp_biofilter = tank_p;
tp_biofilter.S = 1.5*28.5;
tp_biofilter.h_max = 0.8;

%% %% BIO GH1
tp_GH1_bio = tank_p;
tp_GH1_bio.S = 1.5*5.3;
tp_GH1_bio.h_max = 0.8;
%%
ratio.tilapia = 0.018;
ratio.mullet  = 0.029;
ratio.clams   = 0.011;
ratio.cray    = 0.018;
ratio.silver  = 0.034;

mass_sat.tilapia = 250;
mass_sat.mullet  = 22;
mass_sat.clams   = 460;
mass_sat.cray    = 35;
mass_sat.silver  = 25;

%%

label_block = {["GH1/RF System/Tank Model"         ,"tp_GH1_RF"    ], ...
               ["GH1/NFT System/Tank Model"        ,"tp_GH1_NFT"   ], ...
               ["GH2/RF System/Tank Model"         ,"tp_GH2_RF"    ], ...
               ["GH2/TRAD System/Tank Model"       ,"tp_GH2_TRAD"  ], ...
               ["GH3/Tank Model 1"                 ,"tp_fish_T"  ], ...
               ["GH3/Tank Model 2"                 ,"tp_fish_M"  ], ...
               ["GH3/Tank Model 3"                 ,"tp_fish_C"  ], ...
               ["GH3/Tank Model 4"                 ,"tp_fish_S"  ], ...
               ["GH1/Climate Model"                ,"climate_GH1"  ], ...
               ["GH2/Climate Model"                ,"climate_GH2"  ], ...
               ["GH3/Climate Model"                ,"climate_GH3"  ], ...
               ["GH1/Bio Sump"                     ,"tp_GH1_bio"   ], ...
               ["BioFilter/Tank Model Bio"         ,"tp_biofilter" ] };
           

for ilabel = label_block
  eval("parameters."+ilabel{1}(2)+" = "+ilabel{1}(2)+";");
end

    %%
reset_params = false;

if reset_params

    for i = 1:length(label_block)
        path_block = "niof_model/"+label_block{i}{1};
        eval("set_params_block_no_struture(path_block,"+label_block{i}(2)+")")
    end
    
    for ivar = find_system({'niof_model'},'Name','Start/Stop Window')'
        spp = strsplit(ivar{:},'/');
        spp{2} = replace(spp{2},' ','');
        spp{3} = replace(spp{3},' ','');
        spp{4} = replace(spp{4},' ','');

        namevar_init = join(['tinit',spp([2 3 4])],'_');
        set_param(ivar{:},'tinit',namevar_init{:})

        namevar_end  = join(['tend',spp([2 3 4])],'_');
        set_param(ivar{:},'tend',namevar_end{:})
    end
    
    for iname = ["crop_GH1_RF","crop_GH1_NFT","crop_GH2_RF","crop_GH2_TRAD"]
        cmds= iname{:}+"_slot"+(1:4)'+"="+iname{:}+";";
        iter = 0;
        for icmd = cmds'
            iter = iter + 1;
           eval(icmd) 
           name_split = strsplit(iname,'_');
           path_block = "niof_model/"+name_split{2}+"/"+name_split{3}+" System/Crop "+iter;

           name_var = strsplit(icmd,'=');
           name_var = name_var{1};
           %eval("set_params_block(path_block,"+name_var+",'"+name_var+"')")
           eval("set_params_block_no_struture(path_block,"+name_var+")")
           
        end
    end
    
end

%%
% volcamos los parametros de las estructuras a variables simples
for i = 1:length(label_block)
    path_block = "niof_model/"+label_block{i}{1};
    names_of_variable = label_block{i}(2);
    eval("fnames = fieldnames("+names_of_variable+");")
    % creamos este parametro en el workspace
    for ifnames = fnames'
       eval(names_of_variable + "___"+ifnames  + "="+names_of_variable + "."+ifnames+";")
    end
end


for iname = ["crop_GH1_RF","crop_GH1_NFT","crop_GH2_RF","crop_GH2_TRAD"]
    
    cmds= iname{:}+"_slot"+(1:4)'+"="+iname{:}+";";
    iter = 0;
    for icmd = cmds'
        iter = iter + 1;
       eval(icmd) 
       name_split = strsplit(iname,'_');
       path_block = "niof_model/"+name_split{2}+"/"+name_split{3}+" System/Crop "+iter;

       name_var = strsplit(icmd,'=');
       name_var = name_var{1};

       names_of_variable = name_var;
       
      eval("parameters."+names_of_variable+" = "+names_of_variable+";");

        eval("fnames = fieldnames("+names_of_variable+");")
        % creamos este parametro en el workspace
        for ifnames = fnames'
           eval(names_of_variable + "___"+ifnames  + "="+names_of_variable + "."+ifnames+";")
        end
    end
end



