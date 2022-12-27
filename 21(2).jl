function final!(robot)
    recursivemarker!(robot,Nord)
end

function recursivemarker!(robot,side)
    n=0
    move!(robot,side)
    if !isborder(robot,side)
        recursivemarker!(robot,side)
        n+=1
    else
        putmarker!(robot)
    end
    for _ in 1:n
        move!(robot,inverse_side(side))
    end
end

function inverse_side(side::HorizonSide)::HorizonSide
    inv_side = HorizonSide((Int(side) + 2) % 4)
    return inv_side
end

final!(r)
