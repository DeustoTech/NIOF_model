figure(6)
clf
tanks_names = {'T','M','C','S'};
hold on
iter = 0;
for ivar = tanks_names
    iter = iter + 1;
    subplot(4,1,iter)
    hold on
    plot(DT_span,WT_st.(ivar{:}).Drainge.T-273.15)
    plot(niof.DateTime,niof.("Temp_Bot_Fish_Pond_P_"+iter),'o')
    xlim(xlims)
end
title('Temperature')