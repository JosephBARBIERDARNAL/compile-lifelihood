
rm(list = ls())
infile = "../data/100%mort_Pierrick211genoparinteraction.txt"
customfile = "../data/custom.txt"
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
app_path <- "compilation/setUp/lib/x86_64-darwin/lifelihoodC2023"
command <- paste(app_path, arg_string, sep=" ")
print(command)

# run the command
system(
    command,
    intern = FALSE, # capture the output
    wait = FALSE  # don't wait for the command to finish
)
