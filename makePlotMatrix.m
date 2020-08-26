function makePlotMatrix(data, Y)

figure("Name", "Plot Matrix");

X=[data.(Y{1}),data.(Y{2}),data.(Y{3}),data.(Y{4})];

[S,ax,BigAx,~,~]=plotmatrix(X);

ax(1,1).YLabel.String = Y{1};
ax(2,1).YLabel.String = Y{2}; 
ax(3,1).YLabel.String = Y{3}; 
ax(4,1).YLabel.String = Y{4}; 
ax(4,1).XLabel.String = Y{1};
ax(4,2).XLabel.String = Y{2};
ax(4,3).XLabel.String = Y{3};
ax(4,4).XLabel.String = Y{4}; 

S(2,3).Color = 'r';
S(2,3).Marker = 's';
S(2,3).MarkerSize = 6;
S(3,2).Color = 'r';
S(3,2).Marker = 's';
S(3,2).MarkerSize = 6;

S(3,1).Color = 'g';
S(3,1).Marker = '*';  
S(3,1).MarkerSize = 6;
S(1,3).Color = 'g';
S(1,3).Marker = '*';  
S(1,3).MarkerSize = 6;

S(2,1).Color = 'm';
S(2,1).Marker = '<';  
S(2,1).MarkerSize = 6;
S(1,2).Color = 'm';
S(1,2).Marker = '<';  
S(1,2).MarkerSize = 6;

S(4,1).Color = 'b';
S(4,1).Marker = 'o';  
S(4,1).MarkerSize = 6;
S(1,4).Color = 'b';
S(1,4).Marker = 'o';  
S(1,4).MarkerSize = 6;

S(4,2).Color = [0.4940 0.1840 0.5560]	;
S(4,2).Marker = '>';  
S(4,2).MarkerSize = 6;
S(2,4).Color = [0.4940 0.1840 0.5560]	;
S(2,4).Marker = '>';  
S(2,4).MarkerSize = 6;

S(4,3).Color = [0.9290 0.6940 0.1250]		;
S(4,3).Marker = 'd';  
S(4,3).MarkerSize = 6;
S(3,4).Color = [0.9290 0.6940 0.1250]		;
S(3,4).Marker = 'd';  
S(3,4).MarkerSize = 6;

title(BigAx,'Elemental Composition of Particles')

end