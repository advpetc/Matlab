%{
Haoyang Chen
ITP 168 - Spring 2016
chenhaoy@usc.edu

Revision History
Date     Changes    Programmer
--------------------------------
2/23/16  Original   Haoyang Chen
%}
items=struct('purchasePrice',[],'inventory',[],'sellPrice',[]);%%create the struct that holds all three properties
items(1)=struct('purchasePrice',3.89,'inventory',100,'sellPrice',4.89);%%input data to the corresponding properties
items(2)=struct('purchasePrice',8.5,'inventory',100,'sellPrice',10.99);
items(3)=struct('purchasePrice',1.87,'inventory',100,'sellPrice',2.30);
items(4)=struct('purchasePrice',3.71,'inventory',100,'sellPrice',4.78);
totalCost=100*(3.89+8.5+1.87+3.71);%%calculate the total cost
itemsArray=struct('stapler',items(1), 'tape', items(2), 'paperClip', items(3), 'ballPointPens',items(4));%%stack in a new larger struct
fileName=input('Please enter filename to save data:','s');%%ask the file name and create the file
fileID= fopen(fileName,'w');
iteration=true;%%to iterate the loop
i=1;
totalRevenue=0;
totalProfit=0;
while(iteration)
    choice=input('Please choose from the following:\n1) New Sale\n2) End Day\nChoose:');%%to ask user to input a number to make choice
    switch (choice)%%switch to determine what to do next
        case 1%%user chooses to buy something
                %%staple
                staplerNum=input('How many staplers?: ');%%ask for quanatity of the sale for each item
                while(staplerNum>=items(1).inventory||staplerNum<0)
                    fprintf('Invalid Input\n');
                    staplerNum=input('How many staplers?: ');
                end
                staplerRevenue=items(1).sellPrice*staplerNum;
                staplerProfit=(items(1).sellPrice-items(1).purchasePrice)*staplerNum;
                
                %%tape
                tapeNum=input('How much tape?: ');
                while(tapeNum>=items(2).inventory||tapeNum<0)
                    fprintf('Invalid Input\n');
                    tapeNum=input('How much tape?: ');
                end
                tapeRevenue=items(2).sellPrice*tapeNum;
                tapeProfit=(items(2).sellPrice-items(2).purchasePrice)*tapeNum;
                
                %%paper
                paperNum=input('How many paper clips?:');
                while(paperNum>=items(3).inventory||paperNum<0)
                    fprintf('Invalid Input\n');
                    paperNum=input('How many paper clips?:');
                end
                penNum=input('How many ball point pens?:');
                paperRevenue=items(3).sellPrice*tapeNum;
                paperProfit=(items(3).sellPrice-items(3).purchasePrice)*tapeNum;
                
                %%pen
                while(penNum>=items(4).inventory||penNum<0)
                    fprintf('Invalid Input\n');
                    penNum=input('How many ball point pens?:');
                end
                penRevenue=items(4).sellPrice*penNum;
                penProfit=(items(4).sellPrice-items(4).purchasePrice)*penNum;
                
                items(1).inventory=items(1).inventory-staplerNum;
                items(2).inventory=items(2).inventory-tapeNum;
                items(3).inventory=items(3).inventory-paperNum;
                items(4).inventory=items(4).inventory-penNum;
                
                %%calculate the total revenue and profit
                totalRevenue=staplerRevenue+tapeRevenue+paperRevenue+penRevenue;
                totalProfit=staplerProfit+tapeProfit+paperProfit+penProfit;  
                
                %%writ into the file
                fprintf(fileID,'%s: %.0f\n','Sale',i);
                fprintf(fileID,'%s\n','*************************************');
                fprintf(fileID,'%s: %.0f\n', 'Staplers',staplerNum);
                fprintf(fileID,'%s: $%.1f\n', 'Revenue',staplerRevenue);
                fprintf(fileID,'%s: $%.1f\n', 'Net Profit',staplerProfit);
              
                fprintf(fileID,'%s: %.0f\n', 'Tapes',tapeNum);
                fprintf(fileID,'%s: $%.1f\n', 'Revenue',tapeRevenue);
                fprintf(fileID,'%s: $%.1f\n', 'Net Profit',tapeProfit);
                
                fprintf(fileID,'%s: %.0f\n', 'Paper Clips',paperNum);
                fprintf(fileID,'%s: $%.1f\n', 'Revenue',paperRevenue);
                fprintf(fileID,'%s: $%.1f\n', 'Net Profit',paperProfit);
                
                fprintf(fileID,'%s: %.0f\n', 'Pens',penNum);
                fprintf(fileID,'%s: $%.1f\n', 'Revenue',penRevenue);
                fprintf(fileID,'%s: $%.1f\n', 'Net Profit',penProfit);
        case 2%%user chooses to exit and stop buying
            iteration=false;
            sellNum=400-items(1).inventory-items(2).inventory-items(3).inventory-items(4).inventory;
        otherwise
            fprintf('Invaild input! Choose again!\n');
    end
end
fprintf(fileID,'%s\n','*************************************');
fprintf(fileID,'Daily Sale: %.0f\n',totalRevenue);
fprintf(fileID,'Daily Cost: %.0f\n',totalCost);
fprintf(fileID,'Daily Profit: %.0f\n',totalProfit);

        