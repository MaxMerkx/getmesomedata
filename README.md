Cleaning and summarizing the UCI HAR Dataset
========================================================

This is an R Markdown document describing how the run_analysis.R skript works. 

The run_analysis skript is not very well named because no actual analysis is done. Instead, the UCI HAR Dataset is loaded, merged, cleansed and summarized.

The first step is the loading of relevant .txt files of the UCI HAR Dataset. This is done with the read.table function and will work if the dataset has been extraced as is in the working directory.

Secondly, the variable names that are provided in the features.txt file of the dataset are used to name the columns of both the test and the train X datasets.

The y_* text files containing the activities that belong to the X datasets are mapped to the human-readable activity names.

These properly named activities are then added as an extra column to each X* dataframe as the activity is really a variable that is observed as well. Note that the added columns are factors.

Both X* datasets are merged vertically using rbind since both sets have the same and equal columns.

From this merged dataset we extract a dataset containing only tha variables that are means or standard deviations. We also keep the Activity column.

Finally, we summarize each variable as grouped by the levels of the Activity column: the mean for all observations that belong to one activity of one variable are averaged.

The result is a tidy dataset which is exported to the working directory.