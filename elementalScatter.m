function elementalScatter(data, itemList)

    e1 = itemList{1};
    e2 = itemList{2};
    
    x = data.(e1);
    y = data.(e2);
    
    titleText = (e2 + " vs " + e1);
    
    figure('Name', titleText);
    
    plot(x, y, 'm^');
    xlabel(e1);
    ylabel(e2);

end