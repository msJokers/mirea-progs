using HorizonSideRobots

function mark_cross!(r::Robot)
    for side in (Nord, Sud, West, Ost)
        n_steps = putmarkers_until_border!(r, side)
        moves!(r, inverse_side(side), n_steps)
    end
    putmarker!(r)
end


function putmarkers_until_border!(r::Robot, side::HorizonSide)::Int
    n_steps = 0
    while !isborder(r, side) 
        move!(r, side)
        putmarker!(r)
        n_steps += 1
    end 
    return n_steps
end

function inverse_side(side::HorizonSide)::HorizonSide
    inv_side = HorizonSide((Int(side) + 2) % 4)
    return inv_side
end

mark_cross!(Robot("pole1.sit", animate=true))
