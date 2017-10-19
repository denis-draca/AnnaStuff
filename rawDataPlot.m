list = ["Anna.txt", "Denis.txt", "Somaia.txt", "Enoch1.txt", "Enoch2.txt", "Martin.txt"]; %you can change these, the code will process these txt files
tolerance = [4.9, 4.9, 4.1, 4.8, 4.8, 4.9]; %these are the tolerances for each person. This is inline with the above order
dataHolder = [];
seperator = 10000; %change this if you want to reduce to increase the amount of readings you get back. Making this number smaller will make the code check the frequency more often

listNames = ["Anna", "Denis", "Somaia", "Enoch1", "Enoch2", "Martin"];

elementNames = [1,2,3,4,5,6,7,8,9,10];
for i = 1:length(list)
    f = figure('Name',list(1,i));
    
    data = tdfread(list(1,i), '\t');
    
    fields = fieldnames(data);
    
    for x = 1:10
        name = fields{x + 2};
        plot(data.time, data.(name));
        
        filename = char(strcat('C:\Users\Denis\Desktop\AnnaTestData\rawData\', listNames(1,i),'x' ,string(x) ,'.jpg'));
        ylabel("Voltage (v)");
        xlabel("Time (s)");
        title([listNames(1,i), "Sensor x", string(x), " Fidget over time"]); 
        saveas(f, filename);
    end
   
end
