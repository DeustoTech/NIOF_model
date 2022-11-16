figure(4);
clf

subplot(2,1,1)
hold on
plot(DT_span,-IC_st.Gas.MW.MW_i_e,'.-')
plot(DT_span,IC_st.Gas.MW.QT,'.-')
plot(DT_span,IC_st.Gas.MW.QP_i_c,'.-')
plot(DT_span,IC_st.Gas.MW.QP_i_f,'.-')

yyaxis right

plot(DT_span,IC_st.Gas.C_w,'.-')

legend('MW_{ie}','QT','QP','QP','C_w')
xlim(xlims)
grid on

subplot(2,1,2)
hold on
plot(ds.DateTime,ds.humidity,'.-')
plot(DT_span,IC_st.Gas.HRInt,'.-')
plot(niof.DateTime,niof.ambinet_Humi_Fish_Pond_P_1,'.-')
yyaxis right
plot(ds.DateTime,ds.temperature-273.15,'.-')

legend('H_e','H_i^{sim}','H_i^{real}')
xlim(xlims)
