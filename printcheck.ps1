$folder = "L:\"
$archiveFolder = "C:\Users\Mark\Documents\forPrint\archive"
while ($true) {
    $pdfFiles = Get-ChildItem -Path $folder -Filter *.pdf
    foreach ($file in $pdfFiles) {
        Write-Host "Printing $($file.Name)"
        Start-Process -FilePath $file.FullName -Verb Print
        Start-Sleep -Seconds 10  # Adjust the delay as needed
        # Get current date and time with seconds
        $currentDateTime = Get-Date -Format "yyyyMMddHHmmss"
        # Construct the archived filename with date and time
        $archivedFilename = "{0}_{1}" -f $currentDateTime, $file.Name
        $archivedFilePath = Join-Path -Path $archiveFolder -ChildPath $archivedFilename
        # Move the file to the archive folder
        Move-Item -Path $file.FullName -Destination $archivedFilePath -Force
    }
    Start-Sleep -Seconds 5
}