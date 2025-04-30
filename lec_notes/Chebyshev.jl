# definine some chebyshev polynomial functions used in lecture 7

using CairoMakie
using FastGaussQuadrature

#apparently julia lets you define functions in shorthand way like this
cheb(i::Integer, x::Real) = cos(i * acos(x));

function plotchebs(n::Integer)
    fig = Figure(; size=(640, 480))
    ax = Axis(fig[1,1]; title="Chebyshev polynomial", xlabel="x", ylabel="T(x)")
    xs = -1:0.01:+1
    for i in 0:n
        lines!(xs, cheb.(i,xs))
    end
    return fig 
end;

const num_quadrature_points = 100
const chebdot_points, chebdot_weights = gausschebyshevt(num_quadrature_points)
const legdot_points, legdot_weights = gausslegendre(num_quadrature_points)

function chebdot(f, g)
    integral = sum(chebdot_weights .* f.(chebdot_points) .* g.(chebdot_points))
    return integral
end

chebnorm(f) = sqrt(chebdot(f, f) / pi)

function legdot(f, g)
    integral = sum(legdot_weights .* f.(legdot_points) .* g.(legdot_points))
    return integral
end

legnorm(f) = sqrt(legdot(f, f)/ 2)

function check_chebdot(n::Integer)
    chop(x) = abs(x) < 10*eps(typeof(x)) ? zero(x) : x
    for i in 0:n, j in 0:n
        val = chebdot(x -> cheb(i, x), x -> cheb(j, x))
        println("< T($i) | T($j) > = $(chop(val))")
    end
    return
end

function chebproject(f, n::Integer)
    cs = zeros(n+1)
    for i in 0:n 
        cs[i+1] = chebdot(x -> cheb(i, x), f) / (i == 0 ? pi : pi/2)
    end
    return cs
end

chebeval(cs::AbstractVector, x::Real) = sum(cs[i+1] * cheb(i, x) for i in 0:length(cs)-1)

function check_chebproject(f, n::Integer)
    cs = chebproject(f, n)
    f′(x) = chebeval(cs, x) # here i typed f \prime to get the '. wont work if you just use an apostrophe

    fig = Figure(; size=(640, 480))
    ax = Axis(fig[1, 1]; title="Chebyshev expansion (n=$n)", xlabel="x", ylabel="f(x)")
    xs = -1:0.01:+1
    lines!(ax, xs, f.(xs))
    lines!(ax, xs, f′.(xs))
    return fig
end

gaussian(x) = exp(-1/2 * ((x-0.1)/0.1)^2)

function check_convergence(f, nmax::Integer)
    errors = zeros(nmax+1)
    for n in 0:nmax
        cs = chebproject(f, n)
        f′(x) = chebeval(cs, x)
        Δf(x) = f′(x) - f(x)
        err = legnorm(Δf)
        errors[n+1] = err
    end

    fig = Figure(; size=(640, 480))
    ax = Axis(fig[1, 1]; title="Chebyshev convergence", xlabel="n", ylabel="Error", yscale=log10)
    scatter!(ax, 0:nmax, errors)
    return fig
end
