# Author: Daniel Hutama
def gi_of_norm(max_norm):
    Gaussian_primes = {}
    Gaussian_integers = {}
    Gaussian_integers[0] = [(0,0)]
    for x in range(1, ceil(sqrt(max_norm))):
        for y in range(0, ceil(sqrt(max_norm - x^2))):
            N = x^2 + y^2
            if Gaussian_integers.has_key(N):
                Gaussian_integers[N].append((x,y))
            else:
                Gaussian_integers[N] = [(x,y)]
            if(y == 0 and is_prime(x) and x%4==3):
                have_prime = True
            elif is_prime(N) and N%4==1 or N==2:
                have_prime = True
            else:
                have_prime =False
            if have_prime:
                if Gaussian_primes.has_key(N):
                    Gaussian_primes[N].append((x,y))
                else:
                    Gaussian_primes[N] = [(x,y)]
    return Gaussian_primes,Gaussian_integers

def all_gaussian_primes_up_to_norm(N):
    gips = gi_of_norm(N+1)[0]
    return flatten([uniq([(x,y), (-y,x), (y,-x), (-x,-y)]) for x,y in flatten(gips.values(), max_level=1)], max_level=1)

def all_gaussian_integers_up_to_norm(N):
    gis = gi_of_norm(N+1)[1]
    return flatten([uniq([(x,y), (-y,x), (y,-x), (-x,-y)]) for x,y in flatten(gis.values(), max_level=1)], max_level=1
    
# Calling all_gaussian_primes_up_to_norm(100) will yield a list of tuples that are the coordinates for the Gaussian primes with norm <= 100
# Calling all_gaussian_integers_up_to_norm(100) will yield a list of tupes that are the coordinates for the Gaussian integers with norm <=100
