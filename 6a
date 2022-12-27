using HorizonSideRobots

function mark_all_perimeters!(robot)
    num_West1,num_Sud1=to_corner!(robot)
    for side in (Ost,Nord,West,Sud)
        while !isborder(robot,side)
            putmarker!(robot)
            move!(robot,side)
        end
    end
    find_border!(robot,Nord,Ost)
    drawinner!(robot)
    to_corner!(robot)
    moves!(robot,Nord,num_Sud1)
    moves!(robot,Ost,num_West1)
end

function drawinner!(robot)
    side=Ost
    while !isborder(robot,side) && isborder(robot,next(side))
        putmarker!(robot)
        move!(robot,side)
        if !isborder(robot,side) && !isborder(robot,next(side))
            putmarker!(robot)
            side = next(side)
            move!(robot, side)
            if side == Ost
                break
            end
        end
    end
    while isborder(robot,next(side))
        putmarker!(robot)
        move!(robot,side)
    end
end

function to_corner!(robot)
    num_West=0
    num_Sud=0
    while !isborder(robot,West) || !isborder(robot,Sud)
        if isborder(robot,West)
            move!(robot,Sud)
            num_Sud+=1
        else
            move!(robot,West)
            num_West+=1
        end
    end
    return num_West, num_Sud
end

function moves!(robot,side,num_steps)
    for _ in 1:num_steps
        move!(robot,side)
    end
end

function find_border!(robot,sideb,sidem)
    while isborder(robot,sideb)==false
        putmarker!(robot)
        if isborder(robot,sidem)==false
            move!(robot,sidem)
        else
            move!(robot,sideb)
            sidem=inverse(sidem)
        end
    end
    return sidem
end

inverse(side::HorizonSide)=HorizonSide((Int(side)+2)%4)
next(side::HorizonSide)=HorizonSide((Int(side)+1)%4)
