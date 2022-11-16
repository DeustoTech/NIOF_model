fig = figure(9)
clf
fig.Color = 'w'
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
