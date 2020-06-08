function [rn,cn]=AI(map,player)
    corner=[1 8 8 1
            1 1 8 8];
    goodedge=[3 4 5 6 8 8 8 8 6 5 4 3 1 1 1 1
              1 1 1 1 3 4 5 6 8 8 8 8 6 5 4 3];
    dangerzone=[2 7 7 2 
                2 2 7 7];
    badplace=[2 2 2 2 3 3 4 4 5 5 6 6 7 7 7 7 
              3 4 5 6 2 7 2 7 2 7 2 7 3 4 5 6];
    safezone=[5 5 5 5 6 6 6 6 3 3 3 3 4 4 4 4
              3 4 5 6 3 4 5 6 3 4 5 6 3 4 5 6];
    verybadplace=[1 1 2 2 7 7 8 8 
                  2 7 1 8 1 8 2 7];
    if HappyCorner(map,corner,player)~=[0,0]
        [rn,cn]=HappyCorner(map,corner,player);
    elseif PreventOn9Move(map,goodedge,player)~=[0,0]
        [rn,cn]=PreventOn9Move(map,goodedge,player);
    elseif  StrategicPosition(map,safezone,player)~=[0,0]
        [rn,cn]=StrategicPosition(map,safezone,player);
    elseif StrategicPosition(map,badplace,player)~=[0,0]
        [rn,cn]=StrategicPosition(map,badplace,player);
    elseif PreventOn9Move(map,verybadplace,player)~=[0,0]
        [rn,cn]=PreventOn9Move(map,verybadplace,player);
    elseif StrategicPosition(map,goodedge,player)~=[0,0]
        [rn,cn]=StrategicPosition(map,goodedge,player);
    elseif StrategicPosition(map,verybadplace,player)~=[0,0]
        [rn,cn]=StrategicPosition(map,verybadplace,player);
    elseif StrategicPosition(map,dangerzone,player)~=[0,0]
        [rn,cn]=StrategicPosition(map,dangerzone,player);
    end
end