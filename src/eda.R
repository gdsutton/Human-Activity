library('ProjectTemplate')
load.project()

for (dataset in project.info$data)
{
  message(paste('Showing top 5 rows of', dataset))
  print(head(get(dataset)))
}

# 560 variables
names(X.train)

# counts of column data types
table(sapply(X.train, class))
summary(X.train)

# classes are well balanced
table(y.train)

library(caret)
