function [dataHolderExtreme] = ProcessData()
list = ["Anna.txt", "Denis.txt", "Somaia.txt", "Enoch1.txt", "Enoch2.txt", "Martin.txt"]; %you can change these, the code will process these txt files
tolerance = [4.9, 4.9, 4.1, 4.8, 4.8, 4.9]; %these are the tolerances for each person. This is inline with the above order
dataHolder = [];
dataHolderExtreme = [];
seperator = 10000; %change this if you want to reduce to increase the amount of readings you get back. Making this number smaller will make the code check the frequency more often

listNames = ["Anna", "Denis", "Somaia", "Enoch1", "Enoch2", "Martin"];

elementNames = [1,2,3,4,5,6,7,8,9,10];
for i = 1:length(list)
    useTolerance = tolerance(1,i);
%     f = figure('Name',list(1,i));
%     axis([0 7.5 0 10]);

    data = tdfread(list(1,i), '\t');
    
    fields = fieldnames(data);
    
    for x = 1:10
        name = fields{x + 2};
        dataHolder{x}.fitted = frequencyGraph([data.(fields{1}), data.(name)], seperator, useTolerance);
    end
    
    dataHolderExtreme{i} = dataHolder;


%     plotHold = [];
%     for x = 1:length(dataHolder)
%        hold on;
%        plotHold(x) = plot(dataHolder{x}.fitted);
%     end
%    
%     for x = 1:length(plotHold)
%        set(plotHold(x),'color',rand(1,3));
%     end

%     legend("X" + string(elementNames),'location', 'northwest');
    
%     timeStep = data.time(seperator);
    
%     ylabel("Frequency (Hz)");
%     xlabel(["Time x", string(timeStep), " (s)"]);
%     filename = char(strcat('C:\Users\Denis\Desktop\AnnaTestData\', listNames(1,i), '.fig'));
    
%     saveas(f, filename);

end

end
