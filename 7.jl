function zdvig_kuda!(r, Side)
    n=0
    while !isborder(r, Side)
        move!(r, Side)
        n+=1
    end
    return n
end

function inverse_side(side::HorizonSide)::HorizonSide
    inv_side = HorizonSide((Int(side) + 2) % 4)
    return inv_side
end

function proverka!(r, Side)
    for i in range(Side, inverse_side(side))
        if !isborder(r, Side)
            move!(r, Side)
            if !isborder(r, Nord)
                p=1
                move!(r, inverse_side(side))
            end
        end
        return p
    end
end

function r_y_stenyi(r)
    zdvig_kuda!(r, West)
    side=Ost
        while !isborder(r, side)
            move!(r, side)
            if !isborder(r, Nord)
                p1=1
                break
            end
        end
        if p1==1
            break
        end
    end
end

function final!(r)
    p1=0
    if !isborder(r, Nord)
        while !isborder(r, Nord)
            if proverka!(r)==1
                p1=1
                break
            end
            move!(r, Nord)
        end
        if p1==1
            break
        else
            r_y_stenyi(r)
        end
    else
        r_y_stenyi(r)
    end
end

final!(r)
