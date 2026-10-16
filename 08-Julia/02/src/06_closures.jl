# Слайд 6. Замыкания

function make_counter()
    count = 0

    return function ()
        count += 1
        count
    end
end

counter = make_counter()
println(counter())
println(counter())
println(counter())
