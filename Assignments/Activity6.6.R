choice <- as.integer(readline("Select operation: 1:Add, 2:Subtract, 3:Multiply, 4:Divide: "))

a <- as.numeric(readline("Enter first number: "))
b <- as.numeric(readline("Enter second number: "))

result <- switch(as.character(choice),
                 "1" = paste(a, "+", b, "=", a + b),
                 "2" = paste(a, "-", b, "=", a - b),
                 "3" = paste(a, "*", b, "=", a * b),
                 "4" = if (b != 0) paste(a, "/", b, "=", a / b) else "Cannot divide by zero",
                 "Invalid choice"
)
print(result)
