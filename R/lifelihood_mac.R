
rm(list = ls())
infile = "100%mort_Pierrick211genoparinteraction.txt"
customfile = "custom.txt"
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

# Construct the full path to the input files
infile <- paste(getwd(), infile, sep = "/")
customfile <- paste(getwd(), customfile, sep = "/")

# Concatenate all arguments into a single string
arg_string <- paste(infile, customfile, GbyG, MCMC, interval, SEcal, 
                    saveprobevent, fitness, r, seed1, seed2, seed3, 
                    seed4, ntr, nst, To, Tf, climbrate, precision, sep = " ")

# Print the command arguments for debugging
print(arg_string)

# Define the path to the executable
app_path <- "../Lifelihood/src/compilation/project1.app/Contents/MacOS/project1"
command <- paste("open", app_path, "--args", arg_string)

# Run the executable with the constructed arguments string
output = system(command, intern = TRUE, wait = TRUE)
print(output)
