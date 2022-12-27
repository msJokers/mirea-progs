function putmarkers_until_border!(r, side1, side2)
    putmarker!(r)
    while !isborder(r, side1)
        move!(r, side1)
        move!(r, side2)
        putmarker!(r)
    end
end

function zdvig_kuda!(r, Side)
    n=0
    while !isborder(r, Side)
        move!(r, Side)
        n+=1
    end
    return n
end

function steps!(r, Side, p)
    for i in 1:p
        move!(r, Side)
    end
end 

function final(r)
    steps_sud=zdvig_kuda!(r, Sud)
    steps_West=zdvig_kuda!(r, West)
    putmarkers_until_border!(r, Nord, Ost)
    zdvig_kuda!(r, West)
    putmarkers_until_border!(r, Sud, Ost)
    zdvig_kuda!(r, West)
    steps!(r, Nord, steps_sud)
    steps!(r, Ost, steps_West)
end

final(r)
