createBMLGrid = 
  function(r,c, ncars)
    
  { 
    if(length(c) == 0 & length(r)==0) stop('row or col is not given')
    
    if (r*c < sum(ncars)) stop('number of cars out of bound')
    
    Grids = matrix('',ncol = c, nrow = r)
    
    prod = sample(1:(r*c), sum(ncars))
    
    Grids[prod] = sample(rep( c('red', 'blue'), ncars))
    
    Grids = structure(Grids,class = 'BMLGrid')
    
    Grids
  }




IntGrid = 
  function(g) # g is the output grid from function 'createBMLGrid'
  {
    
    g[g == ''] = 1
    
    g[g == 'red'] = 5
    
    g[g == 'blue'] = 10
    
    g # g is a matrix with type of character
    
  }


CrunBML = 
  function(grids, numSteps)
  { 
    
    g = IntGrid(grids)
    
    new_g = g
    
    pos_red = cbind(row(g)[g == '5'], col(g)[g == '5'])
    
    pos_blue = cbind(row(g)[g == '10'], col(g)[g == '10'])
    
    num_red = nrow(pos_red)
    
    num_blue = nrow(pos_blue)
    
    g_nrow = nrow(g)
    
    g_ncol = ncol(g)
    
    NstepsGrid = .C("movecars",  g = as.integer(g), new_g = as.integer(new_g),
                    g_nrow = as.integer(g_nrow),g_ncol = as.integer(g_ncol),
                    pos_red = as.integer(pos_red), pos_blue = as.integer(pos_blue),
                    num_red = as.integer(num_red), num_blue = as.integer(num_blue),
                    nstep = as.integer(numSteps), PACKAGE = 'CBML')$new_g
    
    NstepsGrid = as.character(NstepsGrid)
    
    NstepsGrid[NstepsGrid=='1'] = ''
    
    NstepsGrid[NstepsGrid == '5'] = 'red'
    
    NstepsGrid[NstepsGrid == '10'] = 'blue'
    
    NstepsGrid = matrix(NstepsGrid, g_nrow, g_ncol)
    
    NstepsGrid = structure(NstepsGrid,class = 'BMLGrid')
  }


plot.BMLGrid = 
  function(x,...) 
  {
    z = matrix(match(x, c('','red', 'blue')), nrow(x), ncol(x))
    
    image(z, col = c('white','red','blue'))
    
    box()
  }
