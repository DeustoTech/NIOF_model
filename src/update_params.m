x0 = NIOF_parameters_simulink_Structure;

for i = 1:length(x0.parameters(3).map)
    
    nnn = strsplit(x0.parameters(3).map(i).Identifier,'___');
    if length(nnn) == 1
        try
            eval("value = "+replace("calendar."+nnn{1},'_','.')+";")
        end
    else
        %(x0.parameters(3).map(i).Identifier+"\n")
        eval("value = parameters."+nnn{1} + "." + nnn{2}+";")
        
    end
    
    indexs = x0.parameters(3).map(i).ValueIndices(1):x0.parameters(3).map(i).ValueIndices(2);
    
    x0.parameters(3).values(indexs) = value;
end

NIOF_parameters_simulink_Structure = x0;