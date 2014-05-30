#-------------------------- variables
# Population size
n = 100
# no of specimens carrying the focal allele
f = 1
# build the pop
PARENTpop = c(rep(0, times = f), rep(1, times = (n - f)))
PARENTpop

# -----------------------------------
# 1 Bernoulli trial
bt <- function(pop) {
    return(sample(pop, 1, replace = TRUE))
}
# PARENTpop are actually gametes not specimens!
bt(PARENTpop)

# -----------------------------------
# Children population made of BTs
childrens <- function(currPOP) {
    newPOP <- rep(NA, times = length(currPOP))
    for (i in 1:length(newPOP)) newPOP[i] <- bt(currPOP)
    return(newPOP)
}
childrens(PARENTpop)
hist(childrens(PARENTpop))

# -----------------------------------
# get the Frequency
getFrequency <- function(pop) {
    nul <- length(which(pop == "0"))
    freq = nul/length(pop)
    return(freq)
}
getFrequency(childrens(PARENTpop))

# -----------------------------------
# Start pop does not change!
# Stochastic drawing -> lets look at the distribution
Repeat <- 3000
noOfPops <- rep(NA, times = Repeat)
for (i in 1:Repeat) {
    noOfPops[i] <- getFrequency(childrens(PARENTpop))
}
hist(noOfPops)

# -----------------------------------
# Let's evolve
generations <- 100
noOfGen <- rep(NA, times = generations)
currPARENTS <- PARENTpop
for (i in 1:length(noOfGen)) {
    currCHILDREN <- childrens(currPARENTS)
    noOfGen[i] <- getFrequency(currCHILDREN)
    currPARENTS <- currCHILDREN
}
noOfGen
plot(noOfGen, type = "l")
