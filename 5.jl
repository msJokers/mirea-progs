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

function putmarkers_until_border!(r, side1, side2)
    n_steps = 0
    while !isborder(r, side2) 
        move!(r, side1)
        putmarker!(r)
        n_steps += 1
    end 
    return n_steps
end

function putmarkers_est_border!(r, side1, side2)
    n_steps = 0
    putmarker!(r)
    while isborder(r, side2) 
        move!(r, side1)
        putmarker!(r)
        n_steps += 1
    end 
    putmarker!(r)
    move!(r, side2)
    return n_steps
end

function steps!(r, Side, p)
    for i in 1:p
        move!(r, Side)
    end
end 

function final(r)
    steps_sud=zdvig_kuda!(r, Sud)
    steps_West=zdvig_kuda!(r, West)
    n_nord=putmarkers_until_border!(r, Nord, Nord)
    for side in (Ost, Sud, West)
        putmarkers_until_border!(r, side, side)
    end
    move!(r, Ost)
    move!(r, Nord)
    while true
        p=1
        for side in (Nord, Sud)
            n=0
            while n<n_nord-2
                move!(r, side)
                n+=1
                if isborder(r, side)
                    p=0
                    break
                end
            end
            if p==0
                break
            end
            move!(r, Ost)
        end
        if p==0
            break
        end
        if p==0
            break
        end
    end
    if isborder(r, Nord)
        putmarkers_est_border!(r, Ost, Nord)
        putmarkers_est_border!(r, Nord, West)
    else 
        putmarkers_est_border!(r, Ost, Sud)
        putmarkers_est_border!(r, Sud, West)
    end
    if isborder(r, Sud)
        putmarkers_est_border!(r, West, Sud)
        putmarkers_est_border!(r, Sud, Ost)
    else
        putmarkers_est_border!(r, West, Nord)
        putmarkers_est_border!(r, Nord, Ost)
    end
end

final(r)
