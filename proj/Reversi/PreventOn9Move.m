function [rn,cn]=PreventOn9Move(map,goodedge,player)
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
        tempmap=map;
        rn=0;
        cn=0;
        for c=1:s
            m=min(find(L==min(L)));
            [flip,tempmap]=CheckOn9Valid(map,player,possible(1,m),possible(2,m));
            if flip==1
                if CheckOn9(map,possible(1,m),possible(2,m),player)==0
                    rn=possible(1,m);
                    cn=possible(2,m);
                    break
                else 
                    L(1,m)=65;
                end
            else
                if CheckOn9(map,possible(1,m),possible(2,m),player)==0
                    rn=possible(1,m);
                    cn=possible(2,m);
                    break
                else 
                    L(1,m)=65;
                end
            end
        end
    else
        rn=0;
        cn=0;
    end
end
function z=CheckOn9(map,rn,cn,player)
    z=0;
    if rn==1 || rn==8
        if map(rn,cn+1)==3-player && map(rn,cn-1)==3-player
            [flip,tempmap]=CheckValid(map,player,rn,cn);
            a1=find(tempmap(rn,:)==player);
            a2=find(tempmap(rn,:)==3-player);
            a3=find(tempmap(rn,:)==0);
            a1min=min(a1);
            a1max=max(a1);
            if ~isempty(find(a2==(a1min-1))) && ~isempty(find(a3==(a1max+1)))
                z=1;
            else
                z=0;
            end
        elseif map(rn,cn+1)==3-player || map(rn,cn-1)==3-player
            z=1;
        end
    elseif cn==1 || cn==8
        if map(rn+1,cn)==3-player && map(rn-1,cn)==3-player
            [flip,tempmap]=CheckValid(map,player,rn,cn);
            a1=find(tempmap(:,cn)==player);
            a2=find(tempmap(:,cn)==3-player);
            a3=find(tempmap(:,cn)==0);
            a1min=min(a1);
            a1max=max(a1);
            if ~isempty(find(a2==(a1min-1))) && ~isempty(find(a3==(a1max+1)))
                z=1;
            else
                z=0;
            end
        elseif map(rn+1,cn)==3-player || map(rn-1,cn)==3-player
            z=1;
        end
    end
end
function [flip,map]=CheckOn9Valid(map,player,rn,cn)                     %check if each step can eat sth
    dir=[0 1
        -1 0];
    flip=0;
    for d=dir
        r=rn;
        c=cn;
        if (rn==1 || rn==8) && d(1)~=0
            continue
        elseif (cn==1 || cn==8) && d(2)~=0
            continue
        end
        s=0;
        while true
            if r+d(1) > 8 || r+d(1) < 1 || c+d(2) > 8 || c+d(2) < 1
                break
            else
                r=r+d(1);
                c=c+d(2);
                s=s+1;
                if map(r,c)~=3-player 
                    break
                end
            end              
        end
        if s>1 &&  map(r,c)==player
            flip=1;
            r=rn;
            c=cn;
            for j=1:s
                map(r,c)=player;
                r=r+d(1);
                c=c+d(2);
            end
        end
        r=rn;
        c=cn;
        s=0;
        while true
            if r-d(1) > 8 || r-d(1) < 1 || c-d(2) > 8 || c-d(2) < 1
                break
            else
                r=r-d(1);
                c=c-d(2);
                s=s+1;
                if map(r,c)~=3-player 
                    break
                end
            end
        end
        if s>1 &&  map(r,c)==player
            flip=1;
            r=rn;
            c=cn;
            for k=1:s
                map(r,c)=player;
                r=r-d(1);
                c=c-d(2);
            end
        end
    end
end
