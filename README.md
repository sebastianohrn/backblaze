## Backblaze harddrive data

I use [Backblaze](http://www.backblaze.com) to back up my data, and noticed that they publish [quarterly data](https://www.backblaze.com/b2/hard-drive-test-data.html) on every single one of the ~100,000 disks they use for their (at the time of writing) >600 petabyte capacity. 

I thought it could be a fun exercise to read this data into R and see what interesting insights and visualizations I could come up with.

### The data
The quarterly data, once extracted, is made available as daily .csv files (so ~90 files per quarter) with each row representing one hard drive operational at the given day. To run the report locally, the data files need to be saved in `/data/2018QX` subfolder where `X` represents the quarter (1-4). I broke out the data reading into a separate R script, see [read_data.R](read_data.R). 

### The report
I did the analysis as an interactive R Notebook in RStudio. This outputs two files: 

* the raw `.Rmd` file containing all code
*  a `.nb.html` file containing a rendered HTML version of the report as well as as an option to download the file above

To view the final report as intended, it is best to download [Report.nb.html](Report.nb.html) and open locally. For direct viewing in GitHub, [Report.md](Report.md) can also be opened, which gives an almost equal view.