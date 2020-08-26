function errorBarData(data)
    figure("Name", "Isotopic Plot");
    x = data.U5P;
    y = data.U4P;
    z = data.U6P;
    xE = 2*data.U5E;
    yE = 2*data.U4E;
    zE = 2*data.U6E;
    errorbar( x, y, yE, yE, xE, xE, 'bx',"MarkerSize",2,"CapSize",0);
    hold("on");
    errorbar(x, z, zE, zE, xE, xE, 'ro',"MarkerSize",2,"CapSize",0);
    hold("off");
    ylabel('U4 and U6');
    xlabel('U5');
    title('Isotopic Plot');
    legend('Location','best');
    end