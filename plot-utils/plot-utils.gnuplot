jitt(x) = (x >= 1000000) ? x + rand(0) * 400000 : (x == 0) ? .5 + rand(0) / 2 : (x == 1) ? .5 + rand(0) : x - .5 + rand(0)
slightjitt(x) = x - .3 * rand(0) * .6
cumux(x) = x==0 ? 1 : x
cumuy(x) = x>=1e6 ? 1e-10 : 1
