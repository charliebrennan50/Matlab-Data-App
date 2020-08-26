function plotAgeData(dataFile, sortValue, SeriesList)

    if ismember('PROJECT_ID', dataFile.Properties.VariableNames)
        dataFile = renamevars(dataFile, 'PROJECT_ID', 'AGENCY_NUMBER');
    end  

    % third input arguement is cell with selected series numbers
    % if it exists, only plot data for those numbers
    
    if ~isempty(SeriesList)
        dataFile = dataFile(ismember(dataFile.AGENCY_NUMBER, SeriesList),:);
    end
    
%     for s=SeriesList
%         s{1};
%     end

    ageData = dataFile(~ismissing(dataFile.LOWER) & ~ismissing(dataFile.UPPER),:);
    ageData.meanDate = mean([ageData.LOWER ageData.UPPER],2);

    if (sortValue == "Age")
        figure("Name","Sorted by Age");
        ageData = sortrows(ageData, "meanDate");
    elseif (sortValue == "Uncertainty")
        figure("Name",'Sorted by Uncertainty');
        ageData.uncertRange = ageData.UPPER - ageData.LOWER;
        ageData = sortrows(ageData, "uncertRange",'descend');
    end

    N = size(ageData,1);
    x = 1:N;

    plot(x, ageData.meanDate,'bo', x, ageData.LOWER,'b^', x, ageData.UPPER,'bv')

    for i=1:N
        line([i, i], [ageData.LOWER(i),ageData.UPPER(i)])
    end

    xlim([0,N+1]);
    yLower = min(ageData.LOWER)-years(5);
    yUpper = max(ageData.UPPER)+years(5);
    ylim([yLower, yUpper])
    xlabel("Particle Number");
    ylabel( "Date");
    title("Uranium Age Data");
    legend off;

end