%{
    ***************************************************************************************
    * Abstract:   Determine Minimal Cycle Basis of an imported Graph
    * Uses:       This file has been compiled using Matlab R2017b
    * Author:     Michael Vasquez Otazu
    * Email:      mitxael@hotmail.it
    * History:    V1.0 - Determine the MCB from a graph imported from a text file
    ********************************* START LICENSE BLOCK *********************************
    * The MIT License (MIT)
    * Copyright (C) 2017 Michael Vasquez Otazu
    *
    * Permission is hereby granted, free of charge, to any person obtaining a copy of this 
    * software and associated documentation files (the "Software"), to deal in the Software 
    * without restriction, including without limitation the rights to use, copy, modify, merge, 
    * publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons 
    * to whom the Software is furnished to do so, subject to the following conditions:
    * 
    * The above Copyright notice and this Permission Notice shall be included in all copies 
    * or substantial portions of the Software.
    ********************************** END LICENSE BLOCK **********************************
%}

clear;

path='G:\DOCUMENTS\DEVELOPMENT\C++\Graph-library\resources\';
%filename='input_5_nonisometricA.txt';
%filename='input_6_isometric.txt';
%filename='input_6_depina.txt';
filename='input_6_depina_de.txt';
%filename='input_7_complex.txt';
%filename='input_10_amalditriangle.txt';
%filename='input_12_dodecahedron.txt';
%filename='input_250_medium.txt';
G = ImportGraph(path, filename);

%%%Plot G with MST
p = PlotGraph(G,0,0,0);

%%%Plot G with SP between u and v
%%u = 1;
%%v = G.numnodes;
%%p = PlotGraph(G,1,u,v);

%FCB = FundamentalCycleBasis(G);
MCB = MinimumCycleBasis(G);

%%%Detailed view of MCB
E = G.Edges{:, {'EndNodes','Weight'}};
En = [(1:G.numedges)',E]; 
[rows,cols] = size(MCB); 
MCB_show = string([MCB;(1:cols)]);
MCB_weight = 0;
for j = 1:cols
    w = 0;
    for i = 1:rows
        if (MCB(i,j) == 1)
            MCB_show(i,j) = strcat( '(', num2str(En(i,2)), ',',num2str(En(i,3)), ',',num2str(En(i,4)),')');
            w = w + En(i,4);
        end
    end
	MCB_show(i+1,j) = string(w);
    MCB_weight = MCB_weight + w;
end

MCB_show = MCB_show';
MCB_show = circshift(MCB_show, [0 -rows]);
clear cols E En filename i j MCB p path rows w