# Wright-Fisher model, under assumptin of neutrality

# Let's consider a population with N haploid individuals.
# The population size is constant over time (N).
# Each generation is separated from the previous and the next
# (no overlap).

# Let's call the generation t0, t1, ...

# Let's consider a biallelic locus, with alleles a and A.

# Let p and q be the frequencies of a and A.





# function to generate the next genotypes

generate.next.genotypes = function(pop.size, a.freq, A.freq) {

  haplotypes = sample(c("a", "A"),
    size = pop.size,
    replace = T,
    prob = c(a.freq, A.freq))

  return(haplotypes)

}



# function to calculate the allele frequencies

allele.frequencies = function(pop.genotypes) {

  return(c("a" = sum(pop.genotypes == "a") / length(pop.genotypes),
           "A" = sum(pop.genotypes == "A") / length(pop.genotypes)))

}



# function to convert one population to the next generation

next.generation = function(population) {

  # population: list containing N, p, q

  next.pop = list()

  N = population[["N"]]

  p = population[["p"]]

  q = population[["q"]]
  
  next.pop[["N"]] = N

  next.genotypes = generate.next.genotypes(N, p, q)

  frequencies = allele.frequencies(next.genotypes)

  next.pop[["p"]] = frequencies[1]

  next.pop[["q"]] = frequencies[2]

  return(next.pop)

}



# function to let a population evolve during n generations

evolve = function(initial.pop, n.generations) {

  stopifnot(n.generations > 0)
  
  pop.history = list()

  pop.history[[1]] = next.generation(initial.pop)

  if (n.generations > 1) {
    
    for (i in 2:n.generations) {

      pop.history[[i]] = next.generation(pop.history[[i - 1]])

    }
  
  }
  
  return(pop.history)
  
}



# function to get time to fixation

time.to.fixation = function(initial.pop, max.n.generations = 10000) {

  # Returns the number of generations needed to fix one of the alleles
  # If no allele is fixed before max.n.generations, returns NA.

  out = NA

  n.generations = 0

  pop = initial.pop
  
  while (pop[["p"]] * pop[["q"]] != 0 & n.generations < max.n.generations) {

    pop = next.generation(pop)

    n.generations = n.generations + 1
    
  }

  if (pop[["p"]] * pop[["q"]] == 0) {

    return(n.generations)

  } else {

    return(NA)

  }
  
}



simulate.times.to.fixation = function(initial.pop, n.simulations, max.n.generations.per.simulation = 10000) {

  simulated.times = vector(length = n.simulations)

  for (i in 1:n.simulations) {

    simulated.times[i] = time.to.fixation(initial.pop = initial.pop,
                     max.n.generations = max.n.generations.per.simulation)

  }

  return(simulated.times)
  
}




# plot one allele frequency over generations

plot.allele.frequency = function(pop.history, frequency = "p") {

  steps = 1:length(pop.history)

  frequencies = unlist(lapply(pop.history, function(x) x[[frequency]]))

  plot(steps, frequencies, bty = "n", xlab = "Generation",
       ylab = frequency, ylim = c(0, 1), type = "l")

}



# test

pop = list(N = 1000,
  p = 0.5,
  q = 0.5)

h = evolve(pop, 200)

plot.allele.frequency(h)



a = simulate.times.to.fixation(pop, 100, 500)

a.density = density(a, na.rm = T)

plot(a.density)

a.mode = a.density$x[which.max(a.density$y)]

abline(v = a.mode)

a.mode



pop.size = c(10, 20, 30, 40, 80, 120, 160, 200, 240, 300)

x.size = rep(pop.size, 2)

y.mode.time.fixation = vector(length = length(x.size))

pb = txtProgressBar(min = 0, max = length(x.size), style = 3)

for (i in 1:length(x.size)) {

  pop = list(N = x.size[i],
    p = 0.5,
    q = 0.5)

  a = simulate.times.to.fixation(pop, 500, 1000)

  a.density = density(a, na.rm = T)

  a.mode = a.density$x[which.max(a.density$y)]

  y.mode.time.fixation[i] = a.mode

  setTxtProgressBar(pb, i)
  
}



plot(log(x.size), log(y.mode.time.fixation), asp = 1, bty = "n")

m = lm(log(y.mode.time.fixation) ~ log(x.size))

abline(m)

m$coefficients




# to do

# cf Felsenstein's book
#
# go diploid
# remove self-fecundation
# add sexes
# add fitness (selection)
# add variable population size
# add mutation

