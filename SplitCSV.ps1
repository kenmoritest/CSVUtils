param(
    [parameter(Mandatory=$true,Position=0,ValueFromPipeLine=$true)]
    $sourcefile,
    [string[]]$selectfields,
    $maxrow = 5000
)

$csv = Import-Csv $sourcefile

$pagenumber = 0
$indexinpage = 0
$pagedata = New-Object System.Collections.ArrayList

function WriteToCSV($pagedata, $pagenumber)
{
    $pagedata | Export-Csv -Path $sourcefile.Replace(".csv", "_" + ($pagenumber.ToString(([int]($csv.Count / $maxrow).ToString() -replace "[0-9]", "0")) + ".csv")) -NoTypeInformation -Encoding ASCII
}

foreach ($row in $csv){
    if ($selectfields.Count -eq 0)
    {
        [void]$pagedata.Add($row)
    }
    else {
        $outdata = $row | select-object $selectfields
        [void]$pagedata.Add($outdata)
    }

    $indexinpage++;
    if ($indexinpage -ge $maxrow)
    {
      $indexinpage = 1;
      $pagenumber++;
      WriteToCSV -pagedata $pagedata -pagenumber $pagenumber
      $pagedata.Clear();
    }
}

WriteToCSV -pagedata $pagedata -pagenumber $pagenumber



