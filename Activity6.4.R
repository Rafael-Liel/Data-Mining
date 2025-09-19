signal <- "red"

stoplight <- switch(signal,
                 "red"    = "Stop",
                 "yellow" = "Ready",
                 "green"  = "Go",
                 "Invalid signal"
)

print(stoplight)
