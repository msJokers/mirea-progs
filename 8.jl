function zdvig_kuda!(r, Side)
    n=0
    p=0
    while !isborder(r, Side)
        if ismarker!(r)
            p=1
            break
        end
        move!(r, Side)
        n+=1
    end
    if p==1
        return 1000
    else
        return n
    end
end

function steps!(r, Side, p)
    for i in 1:p
        move!(r, Side)
    end
end 

function inverse_side(side::HorizonSide)::HorizonSide
    inv_side = HorizonSide((Int(side) + 2) % 4)
    return inv_side
end

function final!(robot)
    p=0
    steps_sud=zdvig_kuda!(r, Sud)
    steps_West=zdvig_kuda!(r, West)
    if steps_sud==1000 or steps_West==1000
        p=1
    end
    if p!=1
        side=Nord
        while !isborder(r, side)
            if !ismarker(r)
                move!(r, side)
            else
                break
            end
        end
        if ismarker
            p=1
        end
        if p!=1
            move!(r, Ost)
            side=inverse_side(side)
        end
    end
end

final!(r)
