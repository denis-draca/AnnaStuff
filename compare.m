%% Compare Enochs

data = tdfread("Enoch1.txt", "\t");
data2 = tdfread("Enoch2.txt", "\t");

seperator = 10000;
useTolerance = 4.8;
fields = fieldnames(data);

elementNames = [1,2,3,4,5,6,7,8,9,10];

for x = 1:10
    name = fields{x + 2};
    dataHolder{x}.fitted = frequencyGraph([data.(fields{1}), data.(name)], seperator, useTolerance);
    dataHolder2{x}.fitted = frequencyGraph([data2.(fields{1}), data2.(name)], seperator, useTolerance);
end
axis([0 7.5 0 1]);
for x = 1:length(dataHolder)
    result1 = dataHolder{x}.fitted;
    result2 = dataHolder2{x}.fitted;
    
    evaluated1 = feval(result1,[1 2 3 4 5 6 7 8]);
    evaluated2= feval(result2,[1 2 3 4 5 6 7 8]);
    
    hold on;
    
    plot([1 2 3 4 5 6 7 8], (evaluated1 - evaluated2)');
   
end

legend(string(elementNames));
title("Enoch1 vs Enoch2");
xlabel("Time x1000 (s)");
ylabel("Frequency Difference");

%% Everyone Else

list = ["Anna.txt", "Denis.txt", "Somaia.txt", "Enoch1.txt", "Enoch2.txt", "Martin.txt"]; %you can change these, the code will process these txt files
tolerance = [4.9, 4.9, 4.1, 4.8, 4.8, 4.9]; %these are the tolerances for each person. This is inline with the above order
dataHolder = [];
seperator = 10000; %change this if you want to reduce to increase the amount of readings you get back. Making this number smaller will make the code check the frequency more often

listNames = ["participant1", "participant2", "participant3", "participant4", "participant5", "participant6"];

elementNames = [1,2,3,4,5,6,7,8,9,10];

rangeEvaluate = 1:0.1:8;

averagedList = zeros(length(rangeEvaluate),1, length(list));
for i = 1:length(list)
   
    useTolerance = tolerance(1,i);
    data = tdfread(list(1,i), "\t");
    
    result1 = frequencyGraph([data.time, data.x1], seperator, useTolerance);
    result2 = frequencyGraph([data.time, data.x7], seperator, useTolerance);
    
    evaluated1 = feval(result1,rangeEvaluate);
    evaluated2= feval(result2,rangeEvaluate);
    
    averagedResult = (evaluated1 + evaluated2)./2;
    
    averagedList(:,:,i) = averagedResult;
    
end

for i = 1:length(list)
    hold on;
    plot(rangeEvaluate, averagedList(:,:,i));
end

hold on;
xlabel("time x1000 (s)");
ylabel("Averaged frequency (Hz)");
legend(listNames);
title("Average sensors x1 and x7");
