function [rn,cn]=StrategicPosition(map,goodedge,player)
    possible=zeros(2,16);
    s=1;
    for i=goodedge
        if map(i(1),i(2))~=0
            continue
        end
        [flip,tempmap]=CheckValid(map,player,i(1),i(2));
        if flip==1           
            possible(1,s)=i(1);
            possible(2,s)=i(2);
            s=s+1;
        end
    end
    L=zeros(1,s-1);
    s=1;
    for j=possible
        if j(1)==0
            break
        else 
            tempmap=map;
            tempmap(j(1),j(2))=player;
            move=CheckStillHaveMove(tempmap,3-player);
            L(1,s)=length(find(move==1));
        end
        s=s+1;
    end
    if isempty(L)==0
        m=min(find(L==min(L)));
        rn=possible(1,m);
        cn=possible(2,m);
    else
        rn=0;
        cn=0;
    end
end