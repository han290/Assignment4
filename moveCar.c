#include<R.h>
#include<string.h>


void movecars(int *g, int *new_g, int *g_nrow, int *g_ncol, int *pos_red, int *pos_blue, int *num_red, int *num_blue, int *nstep)
{
    int g_nrows = g_nrow[0], g_ncols = g_ncol[0], num_reds = num_red[0], num_blues = num_blue[0], nSteps = nstep[0];
	
	int t, a;
	
	int curP_x, curP_y ,nextP_x, nextP_y;
	
	int NextPosGrid, CurPosGrid;
	
	
	
	for(t = 1; t < nSteps + 1; t++){
	
		memcpy(g, new_g, sizeof(int) * g_nrows * g_ncols);
		
		if(t%2 == 1)
		{   
		   
			for(a = 0; a < num_blues; a++)
			{
				
				curP_x = pos_blue[a];
				
				curP_y = pos_blue[num_blues + a];
				
				if(curP_x == 1){
					
					nextP_x = g_nrows;
					
				} else{
					
					nextP_x =curP_x - 1;
				}
				
				NextPosGrid = nextP_x + (curP_y - 1) * g_nrows - 1;
				
				CurPosGrid = curP_x + (curP_y - 1) * g_nrows - 1;
				
				if(g[NextPosGrid] == 1)
				{
					new_g[NextPosGrid] = 10;
					
					new_g[CurPosGrid] = 1;	
					
					pos_blue[a] = nextP_x;
				} 
				
			}	
		} else{
		
			for(a = 0; a < num_reds; a++)
			{
				
				curP_x = pos_red[a];
				
				curP_y = pos_red[num_reds + a];
				
				if(curP_y == g_ncols){
					
					nextP_y = 1;
					
				} else{
					
					nextP_y = curP_y + 1;
				}
				
				NextPosGrid = curP_x + (nextP_y - 1) * g_nrows - 1;
				
				CurPosGrid = curP_x + (curP_y - 1) * g_nrows - 1;
				
				if(g[NextPosGrid] == 1)
				{
					new_g[NextPosGrid] = 5;
					
					new_g[CurPosGrid] = 1;	
					
					pos_red[num_reds + a] = nextP_y;
				} 
	
			}	
			
		}
	}
}