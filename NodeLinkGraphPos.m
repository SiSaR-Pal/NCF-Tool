%Project WSN
% Load the table
clc 
clear all

load('table.mat');
load('nodes.mat');

% Create a graph object
G = graph;
nodeIP = {};
nodeTemp={};
nodeHops = [];

figure;
hold on;
for i = 1:size(NodeData,1)
    x= NodeData{i,3};
    y = 200- NodeData{i,4};
    r = NodeData{i,6};
    color = NodeData{i,5};
    Xg(i) = (100-x)/70;
    Yg(i)= (100-y)/70;
    z(i) = 0;
  % viscircles([x, y], r);
  c = [x y];
area(i) = pi*r.^2;
pos = [c-r 2*r 2*r];
r = rectangle('Position',pos,'Curvature',[1 1], 'FaceColor', color, 'Edgecolor','none')
axis equal

   str = {NodeData{i,2},' ',num2str(x),' ',num2str(y)};
    plot(x, y, '.', 'Color', 'black');
   
end

 TotalActiveNodeHops = 0;
 TotalArea = 0;
edgeCount = 0;
cnt =0;
% Add edges to the graph
for i = 1:size(tableData,1)
   nodeTemp = strsplit(tableData{i,1}, ', ');
   nodeIP{i} = nodeTemp{1};
    edgeCount = 0;
    %node = tableData{i,1};
    neighbors = strsplit(tableData{i,2}, ', ');
    if (length(neighbors)>=2)
        for j = 1:length(neighbors)-1
            node = neighbors{j};
            neighbor = neighbors{j+1};
            %if (~strcmp (neighbor,'10.0.0.14') && ~strcmp (node,'10.0.0.14'))
                G = addedge(G,node,neighbor);
        end
        TotalArea = TotalArea + area(i);
    else
        node = neighbors{1};
        G = addedge(G,node,node); 
    end
end

for i = 1:size(NodeData,1)
  x= NodeData{i,3};
  y = 200- NodeData{i,4};
              %  text(x,y,NodeData{i,2});
  NodePos = findnode(G,NodeData{i,2})
  Xg(NodePos) = x;
  Yg(NodePos) = y;
  z(NodePos) = 0;
  nodeHops(i) = length(shortestpath(G,findnode(G,NodeData{i,2}),findnode(G,'10.0.0.1')));
 


end



    %h=plot(G,'XData',xg,'YData',yg);
    p1 = plot(G,'XData',Xg,'YData',Yg,'ZData',z,'MarkerSize',5,'NodeColor','k','EdgeAlpha',1,'EdgeColor','k');
    title('Wireless Sensor Network');

    

path = shortestpath(G,findnode(G,'10.0.0.12'),findnode(G,'10.0.0.1'));

%highlight(p1,[11 37])
highlight(p1,path,'EdgeColor','g');

for i = 1:size(tableData,1)-2
    fprintf("Node IP address: %s, Hop Count: %d  \n", nodeIP{i},  nodeHops(i));
      if (NodeData{i,5} == "#317DFA")
       TotalActiveNodeHops = TotalActiveNodeHops + nodeHops(i);
   end

end



TotalActiveNodeHops
TotalArea/1000