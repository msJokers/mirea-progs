function final!(robot, side, n)
    if !isborder(robot, side)
        move!(robot, side)
        final!(robot, side, n+1)
        if !isborder(robot, inverse_side(side))
            n -= 1
            if n >= 0
                move!(robot, inverse_side(side))
                if isborder(robot, inverse_side(side))
                    return false
                end
                move!(robot, inverse_side(side))
            end
            if isborder(robot, inverse_side(side))
                if n - 1 < 0
                    return false
                else
                    return true
                end
            else
                return true
            end
        end
    end
end

function inverse_side(side::HorizonSide)::HorizonSide
    inv_side = HorizonSide((Int(side) + 2) % 4)
    return inv_side
end

side = readline()
side = parse(Int64, side)
final!(robot, HorizonSide(side), 1)
