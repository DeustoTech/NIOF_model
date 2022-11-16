fig = figure(9)
clf
fig.Color = 'w'
subplot(4,1,1)
hold on
sty = {'LineWidth',2};
vars = {'T','M','C','S'}
for i = 1:4
plot(DT_span,WT_st.GH3.(vars{i}).V,sty{:})
end
legend('Tilapia','Mullet','Clams','Sedim')
ylabel('V(m^3)')
xlim([DT_span(1) DT_span(end)])
grid on

subplot(4,1,2)
hold on
plot(DT_span,WT_st.GH1.RFSystem.V,sty{:})
plot(DT_span,WT_st.GH1.NFTSystem.V,'-',sty{:})
plot(DT_span,WT_st.GH1.Bio_sump.V,sty{:})
xlim([DT_span(1) DT_span(end)])
legend('GH1-RF','GH1-NFT','Bio Sump')
ylabel('V(m^3)')
xlim([DT_span(1) DT_span(end)])
grid on
subplot(4,1,3)
hold on
plot(DT_span,WT_st.GH2.RFSystem.V,sty{:})
plot(DT_span,WT_st.GH2.TRADSystem.V,sty{:})

legend('GH2-RF','GH2-TRAD')
ylabel('V(m^3)')
xlim([DT_span(1) DT_span(end)])
grid on

subplot(4,1,4)
plot(DT_span,WT_st.Bio.V,sty{:})
legend('Bio Filter')
ylabel('V(m^3)')
xlim([DT_span(1) DT_span(end)])
grid on
