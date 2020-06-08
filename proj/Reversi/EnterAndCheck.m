function [rn,cn,map]=EnterAndCheck(player,map)                                  %Check if enter correct
    fprintf('Player %d please choose a row and a column\n',player)
    while true
        rn=input('Enter row number: ');
        cn=input('Enter column number: ');
        if (rn~=8 && rn~=7 && rn~=6 && rn~=5 && rn~=4 && rn~=3 && rn~=2 && rn~=1) || (cn~=8 && cn~=7 && cn~=6 && cn~=5 && cn~=4 && cn~=3 && cn~=2 && cn~=1) 
            fprintf('Please enter a valid row/column number\n')
        elseif isempty(find(map(rn,:)==0))
            fprintf('Row %d has no space left. Enter again\n',rn)
        elseif isempty(find(map(:,cn)==0))
            fprintf('Column %d has no space left. Enter again\n',cn)
        elseif map(rn,cn)~=0
            fprintf('This position has been occupied. Choose again\n')
        else
            [flip,map]=CheckValid(map,player,rn,cn);
            if flip==1
                break
            end
            fprintf('This is not a valid move. Enter again\n')
        end
    end
end 