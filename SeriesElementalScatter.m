function SeriesElementalScatter(data, itemList, SeriesList)

    if ismember('PROJECT_ID', data.Properties.VariableNames)
        data = renamevars(data, 'PROJECT_ID', 'AGENCY_NUMBER');
    end  

    if ~isempty(SeriesList)
        data = data(ismember(data.AGENCY_NUMBER, SeriesList),:);
    end
    
    x = data.(itemList{1});
    
    optionList = ["bo","r*","gs","md","y^"];
    
    figure('Name','Elemental Scatter Plot')
    
    plot(x, data.(itemList{2}), 'bo');
    hold on
    legendList = [string(itemList{2})];
    
    if length(itemList) > 2
        for i=3:length(itemList)
            plot(x, data.(itemList{i}),optionList(i));
            legendList = [legendList, string(itemList{i})];
        end
    end
    
    hold off;
    xlabel(itemList{1});
    legend(legendList);
    legend('Location','northeastoutside'); 

end