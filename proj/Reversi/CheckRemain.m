function win=CheckRemain(map,player)                            %check if still have color 
    if isempty(find(map==(3-player)))
        fprintf('Player %d loses all discs\n',3-player)
        fprintf('Player %d wins\n',player)
        win=1;
    else
        win=0;
    end
end