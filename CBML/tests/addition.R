
library(CBML)

is.loaded("movecars")

addition_test = 
  function()
    {
      G = createBMLGrid(5,5,c(5,5))
      
      newG = CrunBML(G, numSteps = 3)
      
      t = table(newG)
      
      if (identical(newG,G) || identical(t[2:3],c(5,5))){
        
        stop("error in addition")
      }
  }

addition_test()