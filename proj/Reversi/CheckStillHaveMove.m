function s=CheckStillHaveMove(map,player)                                %give the array 's' to show whether have valid move
    [row,col]=find(map==0);
    L=length(row);
    s=zeros(1,L);
    for i=1:L
        [s(1,i),tempmap]=CheckValid(map,player,row(i),col(i));
    end   
end