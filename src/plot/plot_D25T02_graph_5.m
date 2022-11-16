figure(5)
clf
tanks_names = {'T','M','C','S'};
subplot(3,1,1)
hold on

for ivar = tanks_names
   plot(DT_span,WT_st.(ivar{:}).Drainge.T - 273.15)
end
legend(tanks_names)
xlim(xlims);
subplot(3,1,2)
hold on
for ivar = tanks_names
   plot(DT_span,WT_st.(ivar{:}).QT)
end
legend(tanks_names)

xlim(xlims);

subplot(3,1,3)
hold on
for ivar = tanks_names
   plot(DT_span,WT_st.(ivar{:}).h)
end
legend(tanks_names)
xlim(xlims);