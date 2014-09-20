Getting-and-cleaning-data-project
=================================

<p>This repo is about cleaning a set of data from an experiment where the 30 volunteers within an age bracket of 19-48 years, have had their physical activity recorded with a smartphone (Samsung Galaxy S II).</p>
<p>The initial data set contains several files reporting the different smartphone measurements for different activities. These files are tidied up to produce a single result file containing the average of each variable per subject/activity.</p>
<p>The initial data set is publicly available and get be downloaded from <a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip">here</a>.</p>
<p>The repo contains:</p>
<ul>
<li>A R script (<b>run_analysis.R</b>) that produces the result file (<b>tidyData.txt</b>). The script creates a directory named <b>tmpGetCleanDataProj</b> within the current working directory of R, download the data set and tidy up the data to produce <b>tidyData.txt</b>.</li>
<li>The code book describing the data (<b>CodeBook.md</b>)</li>
</ul>

