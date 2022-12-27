using HorizonSideRobots

function do_ur_job!(robot)
    num_vert,num_hori=to_corner!(robot)
    numvert=11-1-num_vert
    numhori=12-1-num_hori
    for side in (Ost,Nord,West,Sud)
        if side==Ost
            moves!(robot,side,num_hori)
            while !isborder(robot,side)
                move!(robot,side)
            end
        elseif side==Nord
            moves!(robot,side,num_vert)
            while !isborder(robot,side)
                move!(robot,side)
            end
        elseif side==West
            moves!(robot,side,numhori)
            while !isborder(robot,side)
                move!(robot,side)
            end
        elseif side==Sud
            moves!(robot,side,numvert)
            while !isborder(robot,side)
                move!(robot,side)
            end
        end
    end
end

function to_corner!(robot)
    num_vertical=0
    num_horizontal=0
    while !isborder(robot,West)||!isborder(robot,Sud)
        if isborder(robot,West)
            move!(robot,Sud)
            num_vertical+=1
        else
            move!(robot,West)
            num_horizontal+=1
        end
    end
    return num_vertical, num_horizontal
end

function moves!(robot,side,num_steps)
    for _ in 1:num_steps
        move!(robot,side)
    end
    putmarker!(robot)
end

inverse(side::HorizonSide)=HorizonSide((Int(side)+2)%4)
