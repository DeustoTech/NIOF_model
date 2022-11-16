fig = figure(7)
fig.Color = 'w'
clf 
stepss= 5;

subplot(3,1,1)
hold on
sty = {'LineWidth',2}

plot(niof.DateTime,    niof.ambient_temp_Biological_filter_P_5,'color','k',sty{:})

plot(DT_span,IC_st.("GH1").Temp.Tair - 273.15,'color','r',sty{:})
plot(niof.DateTime(1:stepss:end),    niof.ambient_temp_Fish_Pond_P_1(1:stepss:end),'color','r','marker','o','LineStyle','none')

plot(DT_span,IC_st.("GH2").Temp.Tair - 273.15,'color','g',sty{:})
plot(niof.DateTime(1:stepss:end),    niof.ambient_temp_NFT_P_9(1:stepss:end),'color','g','marker','o','LineStyle','none')

plot(DT_span,IC_st.("GH3").Temp.Tair - 273.15,'color','b',sty{:})
plot(niof.DateTime(1:stepss:end),    niof.ambient_temp_RT_P_6(1:stepss:end),'color','b','marker','o','LineStyle','none')
xlim(xlims)

legend('T_e','GH1','GH1^{real}','GH2','GH2^{real}','GH3','GH3^{real}')

title('Temperature [ºC]')
grid on
subplot(3,1,2)

hold on
plot(niof.DateTime,    niof.ambinet_Humi_Biological_filter_P_5,'color','k',sty{:})

stepss= 5;
plot(DT_span,IC_st.GH1.Gas.HRInt,'color','r',sty{:})
plot(niof.DateTime(1:stepss:end),    niof.ambinet_Humi_NFT_P_9(1:stepss:end),'color','r','marker','o','LineStyle','none')

plot(DT_span,IC_st.GH2.Gas.HRInt,'color','g',sty{:})
plot(niof.DateTime(1:stepss:end),    niof.ambinet_Humi_RT_P_6(1:stepss:end),'color','g','marker','o','LineStyle','none')

plot(DT_span,IC_st.GH3.Gas.HRInt,'color','b',sty{:})
plot(niof.DateTime(1:stepss:end),    niof.ambinet_Humi_Fish_Pond_P_1(1:stepss:end),'color','b','marker','o','LineStyle','none')

xlim(xlims)

title('Humidity [%]')
legend('H_e','GH1','GH1^{real}','GH2','GH2^{real}','GH3','GH3^{real}')

grid on

subplot(3,1,3)
hold on
vars = {'T','C','M','S'};
colors = {'r','g','b','c'};

iter = 0;
for i = vars
    iter = iter + 1;
    plot(DT_span,WT_st.GH3.(i{:}).Fout.T - 273.15,'color',colors{iter},sty{:})
    plot(niof.DateTime(1:stepss:end),niof.("Temp_Bot_Fish_Pond_P_"+iter)(1:stepss:end),'Marker','o','color',colors{iter},'LineStyle','none')
end
xlim(xlims)

lvar = [vars ;vars+"_{real}"];

legend(lvar(:))
title('Water Temperature [ºC]')
%yyaxis right

%plot(DT_span,IC_st.("GH1").Temp.Tair - 273.15,'color','k')
%plot(niof.DateTime,    niof.ambient_temp_Fish_Pond_P_1,'color','k','marker','o','LineStyle','none')


%legend([lvar(:);"T_{GH3}";"T_{GH3}^{real}"])
legend(lvar(:))
grid on

