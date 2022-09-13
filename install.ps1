Invoke-WebRequest https://dlcdn.apache.org/maven/maven-3/3.8.6/binaries/apache-maven-3.8.6-bin.zip -O $env:TEMP\apache-maven.zip

Expand-Archive -Path $env:TEMP\apache-maven.zip -DestinationPath $env:TEMP\apache-maven -Force

Copy-Item -Path $env:TEMP\apache-maven\apache-maven-*\* -Destination c:\apache-maven -Force

if ( (Get-ChildItem -Path Env:Path).Value -split ';'  -contains  'c:\apache-maven\bin' -eq $false)
{
setx Path ('c:\apache-maven\bin;' + [Environment]::GetEnvironmentVariable('Path'))
}

