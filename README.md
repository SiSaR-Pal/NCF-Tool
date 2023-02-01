# NCF-Tool
WSN Nodes Replacement Priority tools
NCF Tool
•	Obtain network topology using traceroute network applicate
•	Create Nodes Geometry file for the network according to NCF files format section.
•	Create Nodes network neighbors file according to NCF files format section.
•	Run NCF Tool
•	Click “Load Nodes” Button  to draw network nodes according to Nodes Geometry file
•	Click “Load Nodes Table” Button to create the original WSN network before Failure.
•	Click “Branch A Failure” Button to simulate specific network branch failure, the configuration can be changed according to NCF files format section.
•	Click “Branch B Failure” Button to simulate specific network branch failure, the configuration can be changed according to NCF files format section.
•	In each case the tool will calculate the total network coverage and total number of Hops

NCF File Format
Nodes Data are stored in two tables, the first table stores the nodes geometrical information  and it includes the following data 
ID, IP address , location coordinates , color , radius
For example
2, '10.0.0.2', 128, 182, 'cyan',20;

The second table stores nodes network toplogy extracted from traceroute application and it incudes the following data
Sink Node IP Address ,  Neighbors IP address ,  Node IP Address
'10.0.0.1', '10.0.0.18, 10.0.0.7, 10.0.0.5, 10.0.0.2';
This shows that node 2 must pass through nodes (5 , 7, 18) till it reaches the sink node
