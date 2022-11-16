figure(8)

clf 
subplot(2,1,1)
hold on

plot(niof.DateTime,    niof.ambient_temp_Biological_filter_P_5,'color','k')


plot(DT_span,IC_st.("GH1").Temp.Tair - 273.15,'color','r')
plot(niof.DateTime,    niof.ambient_temp_Fish_Pond_P_1,'color','r','marker','o','LineStyle','none')

plot(DT_span,IC_st.("GH2").Temp.Tair - 273.15,'color','g')
plot(niof.DateTime,    niof.ambient_temp_NFT_P_9,'color','g','marker','o','LineStyle','none')

plot(DT_span,IC_st.("GH3").Temp.Tair - 273.15,'color','b')
plot(niof.DateTime,    niof.ambient_temp_RT_P_6,'color','b','marker','o','LineStyle','none')
xlim(xlims)

legend('T_e','GH1','GH1^{real}','GH2','GH2^{real}','GH3','GH3^{real}')

subplot(2,1,2)
hold on
vars = fieldnames(WT_st.GH3.T.Q)';
it = 100;
%plot(DT_span(it:end),WT_st.GH3.T.Q.advection(it:end))
plot(DT_span(it:end),WT_st.GH3.T.Q.air(it:end))
plot(DT_span(it:end),WT_st.GH3.T.Q.walls(it:end))
plot(DT_span(it:end),-WT_st.GH3.T.Q.transpiration(it:end))

legend('Air','walls','trans')
