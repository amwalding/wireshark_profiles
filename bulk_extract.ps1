# Set the path to the directory containing the zip files
$sourceDirectory = "./"

# Set the path to the directory where you want to extract the files
$destinationDirectory = "$env:USERPROFILE\AppData\Roaming\Wireshark\profiles"

# Loop through all the files in the source directory
Get-ChildItem -Path $sourceDirectory -File | ForEach-Object {
    $file = $_

    # Check if the file has a .zip extension
    if ($file.Extension -eq ".zip") {
        # Construct the full path to the zip file
        $zipFilePath = Join-Path -Path $sourceDirectory -ChildPath $file.Name

        # Construct the destination path for extraction
        $extractedPath = Join-Path -Path $destinationDirectory -ChildPath ($file.BaseName)

        # Create the destination directory if it doesn't exist
        if (-not (Test-Path -Path $extractedPath -PathType Container)) {
            New-Item -Path $extractedPath -ItemType Directory
        }

        # Extract the zip file using Expand-Archive
        Expand-Archive -Path $zipFilePath -DestinationPath $extractedPath -Force
    }
}