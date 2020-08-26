function plotPuData(data)

    figure("Name","Pu240");
    histogram(data.P0P);
    xlabel("Pu240");
    title("Pu240 Distribution");

    figure("Name","Pu239 vs Pu240");
    errorbar(data.P0P, data.P9P, 2*data.P0E, 2*data.P0E, ...
        2*data.P9E, 2*data.P9E, 'mo',"MarkerSize", 2);
    xlabel("Pu240");
    ylabel("Pu239");
    title("Pu239 vs Pu240")
    
    figure("Name","Pu240 vs Pu 239");
    errorbar(data.P0P, data.P1P, 2*data.P1E, 2*data.P1E, ...
        2*data.P0E, 2*data.P0E, 'mo', "MarkerSize", 2);
    xlabel("Pu240");
    ylabel("Pu241");
    title("Pu241 vs Pu240")
    
    figure("Name","Pu242 vs Pu239");
    errorbar(data.P0P, data.P2P, 2*data.P2E, 2*data.P2E, ...
        2*data.P0E, 2*data.P0E, 'mo', "MarkerSize", 2);
    xlabel("Pu240");
    ylabel("Pu242");
    title("Pu242 vs Pu240")
    
end