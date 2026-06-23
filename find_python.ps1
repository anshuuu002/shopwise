$searchPaths = @(
    "$env:LocalAppData\Programs\Python",
    "C:\Program Files",
    "C:\Program Files (x86)",
    "$env:APPDATA\npm"
)

foreach ($folder in $searchPaths) {
    if (Test-Path $folder) {
        $python = Get-ChildItem -Path $folder -Filter python.exe -Recurse -ErrorAction SilentlyContinue | Select-Object -First 1
        if ($python) {
            Write-Host "FOUND PYTHON: $($python.FullName)"
        }
        $node = Get-ChildItem -Path $folder -Filter node.exe -Recurse -ErrorAction SilentlyContinue | Select-Object -First 1
        if ($node) {
            Write-Host "FOUND NODE: $($node.FullName)"
        }
    }
}
