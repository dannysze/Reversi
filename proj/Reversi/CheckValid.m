function [flip,map]=CheckValid(map,player,rn,cn)                     %check if each step can eat sth
    dir=[0 -1 1 1
        -1 1 0 1];
    flip=0;
    for d=dir
        r=rn;
        c=cn;
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