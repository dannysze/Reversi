function reversi
    a=input('Enter ''1'' to vs player or ''2'' to vs AI: ');
    map=zeros(8,8);
    map(4,4)=1;
    map(5,5)=1;
    map(4,5)=2;
    map(5,4)=2;
    map=[0     0     0     0     0     0     0     0
     0     0     0     0     0     0     0     0
     2     0     0     0     0     1     0     0
     0     2     1     1     1     0     0     0
     0     0     2     2     2     2     0     0
     0     0     2     2     2     2     0     0
     0     0     0     0     0     0     0     0
     0     0     0     0     0     0     0     0];
    switch a
        case 1
            disp(map)
            player=1;
            win=0;
            max=0;
            while win==0
                s=CheckStillHaveMove(map,player);
                if isempty(find(s==1))
                    max=max+1;
                    if max==2
                        fprintf('Since both player has no valid move. GAME OVER\n')
                        Count(map);
                        break
                    end
                    fprintf('Player %d has no more valid move. Player %d continue\n',player,3-player)
                    player=3-player;
                    continue
                end
                max=0;
                [rn,cn,map]=EnterAndCheck(player,map);
                disp(map)
                fprintf('Player 1: %d    vs    Player 2: %d\n',length(find(map==1)),length(find(map==2)))
                win=CheckRemain(map,player);
                player=3-player;
            end
        case 2
            ask=input('Player first enter 1, AI first enter 2: ');
            if ask==1
                player=1;
                disp(map)
            elseif ask==2
                [rn,cn]=AI(map,1);
                [flip,map]=CheckValid(map,1,rn,cn);
                fprintf('Player 1 has chosen row %d and col %d\n',rn,cn)
                player=2;
                disp(map)
                fprintf('Player 1: %d    vs    Player 2: %d\n',length(find(map==1)),length(find(map==2)))
            else
                fprintf('Enter 1 or 2 ONLY!!!!!\n')
            end
            win=0;
            max=0;
            while win==0
                s=CheckStillHaveMove(map,player);
                if isempty(find(s==1))
                    max=max+1;
                    if isempty(find(map==0)) || max==2
                        fprintf('Since both player has no valid move. GAME OVER\n')
                        Count(map);
                        break
                    end
                    fprintf('Player %d has no more valid move. Player %d continue\n',player,3-player)
                    player=3-player;
                else
                    max=0;
                    [rn,cn,map]=EnterAndCheck(player,map);
                    disp(map)
                    fprintf('Player 1: %d    vs    Player 2: %d\n',length(find(map==1)),length(find(map==2)))
                    win=CheckRemain(map,player);
                    player=3-player;
                    s=CheckStillHaveMove(map,player);
                end
                if isempty(find(s==1))
                    max=max+1;
                    if isempty(find(map==0)) || max==2
                        fprintf('Since both player has no valid move. GAME OVER\n')
                        Count(map);
                        break
                    end
                    fprintf('Player %d has no more valid move. Player %d continue\n',player,3-player)
                    player=3-player;
                else
                    max=0;
                    [rn,cn]=AI(map,player);
                    [flip,map]=CheckValid(map,player,rn,cn);
                    fprintf('Player %d has chosen row %d col %d\n',player,rn,cn)
                    disp(map)
                    fprintf('Player 1: %d    vs    Player 2: %d\n',length(find(map==1)),length(find(map==2)))
                    player=3-player;
                end  
            end
    end
end
