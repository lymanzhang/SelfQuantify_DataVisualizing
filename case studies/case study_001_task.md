#case study_001
##runningGames: Interacting with Data

For this challenge, you're being asked to chart data from professional 
baseball teams in order to explore the relationship between a team's 
average runs per game (by year) and their winning average for that year.
The data set of over 2500 rows includes every major league team that 
played at least 100 games in a season between the years of 1883 (less
than 20 years after the end of the Civil War) and 2010. 

###Your job is to do the following:

1. Create a scatterplot that shows the relationship between average runs
   per game (on the X axis) and win percentage (on the Y axis).
   
2. When a user hovers over a data point on the plot, provide the name of
   the team, its average runs per game, and its win percentage.
   
3. Use keyboard commands to zoom in and out of the scatterplot.
   
4. Allow the user to drag the scatterplot with the mouse.
   
5. Make it possible for the user to reset the zooming and the panning to
   their original values by pressing a key or the mouse.
   
The data are in a tab-delimited text file called "bb.txt" (for "baseball").
You will need to save this file as a tsv file for use in Processing. The 
file has three columns: The first column has the team name (with year) as
a text variable, the second column has the win percentage (as a number from
0.000 to 1.000), and the third column has the average number of runs per
game. There are no headers in the file.