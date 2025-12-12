
# summary(Groceries)
# 
# inspect(Groceries[1:10])

# freq_items <- apriori(Groceries,
#                       parameter = list(supp = 0.01, conf = 0.5, target = "frequent itemsets"))
# inspect(freq_items[1:10])
# 
# rules_sorted <- sort(rules, by = "lift", decreasing = TRUE)
# inspect(rules_sorted[1:10])


# n <- length(rules_sorted)
# plot(rules_sorted[1:n], method = "graph")
# 

# n <- length(rules_sorted)
# plot(rules_sorted[1:n], method = "scatterplot")


n <- length(rules_sorted)
plot(rules_sorted[1:n], method = "grouped")