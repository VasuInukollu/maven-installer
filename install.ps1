Invoke-WebRequest https://dlcdn.apache.org/maven/maven-3/3.8.6/binaries/apache-maven-3.8.6-bin.zip -O $env:TEMP\apache-maven.zip

Expand-Archive -Path $env:TEMP\apache-maven.zip -DestinationPath $env:TEMP\apache-maven -Force

$MavenPath = "c:\apache-maven"
If(!(test-path -PathType container $MavenPath)) {
      New-Item -ItemType Directory -Path $MavenPath
}

$Folder = (Get-ChildItem $env:TEMP\apache-maven | Select-Object -Last 1).Name
Copy-Item -Path $env:TEMP\apache-maven\$Folder\* -Destination c:\apache-maven\ -Force -Recurse

if ( [Environment]::GetEnvironmentVariable('Path', 'User') -split ';'  -contains  'c:\apache-maven\bin' -eq $false) {
Write-Host "Adding 'c:\apache-maven\bin' to the path"
setx Path ('c:\apache-maven\bin;' + [Environment]::GetEnvironmentVariable('Path', 'User'))
} else {
Write-Host "'c:\apache-maven\bin' is already in the path"
}
