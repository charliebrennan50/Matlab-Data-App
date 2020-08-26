function plotAgeDataVariable(data, xVariable)

% plots the age data in the file "dataFile" against the variable
% "xVariable". xVariable should be entered as a string, i.e. 'U5P'

    data = data(~ismissing(data.LOWER) & ~ismissing(data.UPPER),:);
    data.meanDate = mean([data.LOWER data.UPPER],2);

    X = data.(xVariable{1});
    Y = data.meanDate;
    
    figureText = "Age vs " + string(xVariable{1});
    figure('Name', figureText);
    plot(X, Y,'bo', X, data.LOWER,'b^', X, data.UPPER,'bv','MarkerSize',5)

    for i=1:height(data)
        line([X(i), X(i)], [data.LOWER(i),data.UPPER(i)],'Color', 'blue')
    end

    yLower = min(data.LOWER)-years(5);
    yUpper = max(data.UPPER)+years(5);
    ylim([yLower, yUpper])
    xlabel(xVariable{1});
    ylabel("Date");
    grid on
    title("Age Date vs " + string(xVariable{1}));

end