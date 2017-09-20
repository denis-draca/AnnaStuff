function [ ] = RansacAnna( points, tests , offset)

count = 0;
Bhold = [0;0];

for i = 1:tests
    testPoints = datasample(points,2);
    
    Y = testPoints(:,2);
    X = testPoints(:,1);
    
    B = leastSquares(testPoints);
    
    countTemp = 0;

    for x = 1:length(points(:,1))
       
        Ynew = B(2,1)*X(1,1) + B(1,1);
        
        if(and((points(x ,2) < Ynew + offset),(points(x ,2) > Ynew - offset)))
            countTemp = countTemp + 1;
        end
        
    end
    
    if(countTemp > count)
       count = countTemp;
       Bhold = B;
    end
    
end

sizeX = length(points(:,1));

lastPoint = points(sizeX,1);

test =  Bhold(2,1)*(0:20:lastPoint) + Bhold(1,1);
hold on;
plot(0:20:lastPoint, test, 'color','r');


end

