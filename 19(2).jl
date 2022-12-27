function final!(robot)
    spiral!(r->ismarker(robot), robot)
end

function spiral!(stop_condition::Function, robot)
    side=Nord
    n=0
    while !stop_condition(robot)
        for _ in 1:2
            along!(robot,side,n)
            side=right(side)
        end
        n+=1
    end
end

function try_move!(robot,side,stop_condition::Function)
    if !stop_condition(robot)
        
        if (isborder(robot, side))
            move_next!(robot, side)
        end
        move!(robot,side)
        return true
    else
        return false
    end
end

function along!(robot,side,max_num_steps)
    num_steps=0
    while num_steps<max_num_steps && try_move!(robot,side,_->ismarker(robot))
        num_steps+=1
        
    end
    return num_steps
end

function aroundlinetoo!(robot)
    numlilhori=0
    numlilvert=0
    while isborder(robot,Nord)||isborder(robot,Sud)
        move!(robot,Ost)
        numlilhori+=1
    end
    while isborder(robot,Ost)||isborder(robot,Nord)
        move!(robot,Sud)
        numlilvert+=1
    end
    return numlilvert,numlilhori
end

function aroundline!(robot,side,n)
    for _ in 1:n
        move!(robot,side)
    end
end

function move_next!(robot,side)
    if !isborder(robot,side)
        move!(robot,side)
    else
        move!(robot, right(side))
        move_next!(robot,side)
        move!(robot, left(side))
    end
end

function right(side)
    return HorizonSide((Int(side)+1) % 4)
end

function left(side)
    return HorizonSide((Int(side)+3) % 4)
end

final!(r)
