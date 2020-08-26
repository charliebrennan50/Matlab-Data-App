function gScatterUranium(data, SeriesList)

    if ismember('PROJECT_ID', data.Properties.VariableNames)
        data = renamevars(data, 'PROJECT_ID', 'AGENCY_NUMBER');
    end   

    if ~isempty(SeriesList)
        data = data(ismember(data.AGENCY_NUMBER, SeriesList),:);
    end
    
    figure;
    
    h = gscatter(data.U5P, data.U4P, data.AGENCY_NUMBER,[],'+xd<pv*s>oh^');
        
    ylabel('234U');
    xlabel('235U');
    title('234U vs 235U');
    legend('Location','northeastoutside');

    figure;

    h = gscatter(data.U5P, data.U6P, data.AGENCY_NUMBER,[],'+xd<pv*s>oh^');

    ylabel('236U');
    xlabel('235U');
    title('236U vs 235U');
    legend('Location','northeastoutside');
    
end