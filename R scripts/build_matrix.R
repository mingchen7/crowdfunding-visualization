library(jsonlite)
setwd('/home/ming/Documents/bfit')
data = read.csv(file.choose(), header = TRUE)

# states = c('AL','AK','AZ','AR','CA','CO','CT','DE','FL','GA','HI','ID','IL','IN','IA','KS','KY','LA','ME','MD','MA',
#            'MI','MN','MS','MO','MT','NE','NV','NH','NJ','NM','NY','NC','ND','OH','OK','OR','PA','RI','SC','SD','TN',
#            'TX','UT','VT','VA','WA','WV','WI','WY')

west = c('WA','OR','ID','MT','WY','CA','NV','UT','CO','AZ','NM')
midwest = c('ND','SD','MN','WI','MI','NE','IA','IL','IN','OH','KS','MO')
south = c('TX','OK','AR','LA','MS','AL','FL','GA','TN','SC','NC','KY','VA','WV','MD','DE')
northeast = c('PA','NJ','NY','CT','RI','MA','VT','NH','ME')
pacific = c('AK','HI')

states = c(west, midwest, south, northeast, pacific)

mat = matrix(data = NA, nrow = 50, ncol = 50)

for(i in 1:50){
  for(j in 1:50){
    donor_state = states[i]
    project_state = states[j]
    amount = data[which(data$DONOR_STATE == donor_state & data$SCHOOL_STATE == project_state), 3]
    
    print(donor_state)
    print(project_state)
    print(amount)
    
    if(length(amount) != 0){
      mat[i,j] = amount  
    }
    else{
      mat[i,j] = 0
    }
  }
}

write.csv(mat, "matrix.csv", quote = FALSE, row.names = FALSE, col.names = FALSE)
toJSON(mat, pretty = TRUE)
write.csv(states, "states.csv", quote = FALSE, row.names = FALSE, col.names = FALSE)