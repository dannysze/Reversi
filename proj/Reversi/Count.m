function Count(map)                                     %count the number of color at the end
    L1=length(find(map==1));
    L2=length(find(map==2));
    if L1==L2
        fprintf('DRAW!\n')
    elseif L1>L2
        fprintf('Player 1: %d    vs    Player 2: %d\n',L1,L2)
        fprintf('Player 1 WIN!\n')
    elseif L2>L1
        fprintf('Player 1: %d    vs    Player 2: %d\n',L1,L2)
        fprintf('Player 2 WIN!\n')
    end
end