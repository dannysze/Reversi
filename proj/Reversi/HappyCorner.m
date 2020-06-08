function [rn,cn]=HappyCorner(map,corner,player)                             %take corner if possible & avoid giving corner
    flip=0;
    for i=corner
        if map(i(1),i(2))~=0
            continue
        end
        [flip,tempmap]=CheckValid(map,player,i(1),i(2));
        if flip==1
            rn=i(1);
            cn=i(2);
            break
        end
    end
    if flip==0
        rn=0;
        cn=0;
    end
end