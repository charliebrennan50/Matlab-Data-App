function plotUraniumData(data)

    x = data.U5P;
    y = data.U4P;
    z = data.U6P;
    
    figure('Name', 'Uranium Isotopics');
    
    plot(x, y, 'o', 'MarkerEdgeColor', 'b', 'MarkerFaceColor', [0, 0.8, 1],...
        'LineWidth', 0.5, 'MarkerSize', 4);
    
    hold on;
    
    plot(x, z, 'o', 'MarkerEdgeColor', 'r', 'MarkerFaceColor', [1.0, 0.8, 1],...
        'LineWidth', 0.5, 'MarkerSize', 4);
    
    hold off;
    
    ylabel('234U and 236U');
    xlabel('235U');
    title('Uranium Isotopics');
    legend('234U', '236U');
    legend('location', 'best');

end