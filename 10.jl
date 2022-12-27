using HorizonSideRobots

function nnchessmarker!(robot)
    numSud,numWest=tocorner!(robot)
    imax,jmax=r.situation.frame_size
    if imax>jmax
        imaxi=jmax-1
    else
        imaxi=imax-1
    end
    num_steps=1
    side=Ost
    num1=0
    for _ in 1:imaxi
        for _ in 1:4
            num1=toirog!(robot,side,num_steps,num1)
            side=next(side)
        end
        num_steps+=1
    end
    firstplace!(robot,Nord,numSud)
    firstplace!(robot,Ost,numWest)
end

function tocorner!(robot)
    numvert=0
    numhori=0
    while !isborder(robot,West) || !isborder(robot,Sud)
        if isborder(robot,West)
            move!(robot,Sud)
            numvert+=1
        else
            move!(robot,West)
            numhori+=1
        end
    end
    return numvert,numhori
end

function firstplace!(robot,side,num_steps)
    for _ in 1:num_steps
        move!(robot,side)
    end
end

function toirog!(robot,side,num_steps,num1)
    for _ in 1:num_steps
        if num1%2==0
            putmarker!(robot)
        end
        move!(robot,side)
        num1+=1
    end
    return num1
end

next(side::HorizonSide)=HorizonSide((Int(side)+1)%4)
