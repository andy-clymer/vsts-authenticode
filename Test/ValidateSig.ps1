$path = "$env:SYSTEM_ARTIFACTSDIRECTORY\\$env:BUILD_DEFINITIONNAME\\Test Files\\ClassLibrary2.dll"

Write-Verbose "Path: $path"

$sigData = Get-AuthenticodeSignature -Verbose $path

Write-Verbose "Authenticode State: $sigData.Status"

if ($sigData.Status -eq "HashMismatch" -or $sigData.Status -eq "Incompatible" -or $sigData.Status -eq "NotSigned" -or $sigData.Status -eq "NotSupportedFileFormat") {
    Write-Host ("##vso[task.complete result=Failed;]Authenticode Status: " + $sigData.Status)
}