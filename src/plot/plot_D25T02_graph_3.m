figure(3);
clf

subplot(3,1,1)
hold on
plot(DT_span,IC_st.QS.R_int)
plot(ds.DateTime,ds.radiation)
xlim(xlims)

subplot(3,1,2)
hold on
plot(DT_span,IC_st.Gas.MW.MW_i_e)
plot(DT_span,IC_st.Gas.MW.QP_i_c)
plot(DT_span,IC_st.Gas.MW.QP_i_f)
yyaxis right
plot(DT_span,IC_st.Gas.MW.QT)
legend
xlim(xlims)


subplot(3,1,3)
plot(DT_span,IC_st.R)
