function [result] = particleElementList(data, elementQ)

if ismember('AGENCY_NUMBER', data.Properties.VariableNames)
    data = renamevars(data, 'AGENCY_NUMBER', 'PROJECT_ID'); 
end

if ismember('IAEA_NIT', data.Properties.VariableNames)
   data = renamevars(data, 'IAEA_NIT', 'PARTICLE_ID'); 
end

    k=0;
    result = {};
    for i=1:height(data)
        if data.(elementQ{1})(i) ~= 0
            temp1 = char(data.PROJECT_ID(i));
            temp2 = num2str(data.PARTICLE_ID(i));
            k = k + 1;
            result{k} = strjoin({temp1, temp2});
        end
    end
end