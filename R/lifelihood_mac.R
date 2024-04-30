
rm(list = ls())
infile = "data/testdata.txt"
customfile = "data/custom.txt"
GbyG = 0
MCMC = 0
interval = 25
SEcal = 0
saveprobevent = 0
fitness = 0
r = 0
seed1 = 12
seed2 = 13
seed3 = 14
seed4 = 15
ntr = 2
nst = 2
To = 50
Tf = 1
climbrate = 1
precision = 0.001

# concatenate all arguments into a single string
arg_string <- paste(infile, customfile, GbyG, MCMC, interval, SEcal, 
                    saveprobevent, fitness, r, seed1, seed2, seed3, 
                    seed4, ntr, nst, To, Tf, climbrate, precision, sep = " ")

# define the path to the executable
command <- "compilation/setUp/lib/x86_64-darwin/lifelihoodC2023"

# run the command
system(
    command,
    input = arg_string,  # pass the arguments to the command
    intern = FALSE, # capture the output
    wait = TRUE, # wait for the command to finish
)
