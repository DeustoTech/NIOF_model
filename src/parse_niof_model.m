function results= parse_niof_model(rt_yout)
ncolum = 62;
ncrops = 4*4;
crop_sl_st = 1:ncolum:ncolum*ncrops;
crop_sl_st = [crop_sl_st ncolum*ncrops+1];
%
crops_cell = [];
for i = 1:ncrops
    mt = rt_yout.signals(1).values(:,crop_sl_st(i):crop_sl_st(i+1)-1);
    crops_cell{i} = parseTable2Struct(parseCrop_matrix(permute(mt,[2 3 1])));
end

crops = [];
crops.GH1.NFT  = crops_cell(1:4);
crops.GH1.RF   = crops_cell(5:8);
crops.GH2.RF   = crops_cell(9:12);
crops.GH2.TRAD = crops_cell(13:16);
clear crops_cell
results.crops =  crops;
clear crops
%
IC.GH1 = parseTable2Struct(parseIndoorClimate_matrix(rt_yout.signals(3).values));
IC.GH2 = parseTable2Struct(parseIndoorClimate_matrix(rt_yout.signals(4).values));
IC.GH3 = parseTable2Struct(parseIndoorClimate_matrix(rt_yout.signals(5).values));
results.IC =  IC;
clear IC
%

Fishes.C = parseTable2Struct(parseFish_matrix(rt_yout.signals(6).values));
Fishes.M = parseTable2Struct(parseFish_matrix(rt_yout.signals(7).values));
Fishes.S = parseTable2Struct(parseFish_matrix(rt_yout.signals(8).values));
Fishes.T = parseTable2Struct(parseFish_matrix(rt_yout.signals(9).values));

results.Fishes = Fishes;
clear Fishes;

%

results.control.PumpBio2GH1 = rt_yout.signals(2).values(:,1);
results.control.PumpBio2GH2 = rt_yout.signals(2).values(:,2);
results.control.PumpGH32Bio = rt_yout.signals(2).values(:,3);
results.control.PumpIn      = rt_yout.signals(2).values(:,4);

%%
Tanks.GH1.Filter = parsesTank_matrix(rt_yout.signals(10).values);
Tanks.GH1.NFT    = parsesTank_matrix(rt_yout.signals(11).values);
Tanks.GH1.RF     = parsesTank_matrix(rt_yout.signals(12).values);
Tanks.GH2.RF     = parsesTank_matrix(rt_yout.signals(13).values);
Tanks.GH2.TRAD   = parsesTank_matrix(rt_yout.signals(14).values);

Tanks.GH3.CLAMS   = parsesTank_matrix(rt_yout.signals(15).values);
Tanks.GH3.MULLET  = parsesTank_matrix(rt_yout.signals(16).values);
Tanks.GH3.TILAPIA = parsesTank_matrix(rt_yout.signals(17).values);
Tanks.GH3.SEDIM   = parsesTank_matrix(rt_yout.signals(18).values);

%%
results.Tanks = Tanks;
clear Tanks