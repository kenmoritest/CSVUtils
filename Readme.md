# CSV Utils

## SplitCSV.ps1
SplitCSV.ps1 is a module to split CSV files into multiple files.

Primary objective is to devide CSV rows with -maxrow parameter (Deafult: 5000).
And we can select fields by specifying the -selectfields paramter to reduce the CSV file size.

.\SplitCSV.ps1 -sourcefile .\sample.csv

.\SplitCSV.ps1 -sourcefile .\sample.csv -maxrow 100

.\SplitCSV.ps1 -sourcefile .\sample.csv -maxrow 100 -selectfields @("FieldA", "FieldB", "FieldC")

