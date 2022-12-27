function zdvig_kuda!(r, Side)
    n=0
    while !isborder(r, Side)
        move!(r, Side)
        n+=1
    end
    return n
end

function putmarkers_until_border!(r, side)
    n_steps = 0
    while !isborder(r, side) 
        move!(r, side)
        putmarker!(r)
        n_steps += 1
    end 
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
    for side in (Nord, Ost, Sud, West)
        putmarkers_until_border!(r, side)
    end
    steps!(r, Nord, steps_sud)
    steps!(r, Ost, steps_West)
end

final(r)
