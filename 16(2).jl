function final!(robot)
    putmarker!(robot)
    for side in (Nord,West,Sud,Ost)
        n=mark_diagonal!(robot,side)
        bairluugaa!(robot,inverse_side(side),n)
    end
end

function next(side)
    return HorizonSide((Int(side) + 1) % 4)
end

function mark_diagonal!(robot,side)
    num_steps=0
    while !isborder(robot,side) && !isborder(robot,next(side))
        move!(robot,side)
        move!(robot,next(side))
        putmarker!(robot)
        num_steps+=1
    end
    return num_steps
end

function inverse_side(side::HorizonSide)::HorizonSide
    inv_side = HorizonSide((Int(side) + 2) % 4)
    return inv_side
end

function bairluugaa!(robot,side,num_steps)
    for _ in 1:num_steps
        move!(robot,side)
        move!(robot,next(side))
    end
end

final!(r)
