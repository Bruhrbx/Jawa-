Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

function Take-Screenshot {
    param (
        [string]$outputPath
    )
    $bounds = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds
    $bitmap = New-Object System.Drawing.Bitmap $bounds.Width, $bounds.Height
    $graphics = [System.Drawing.Graphics]::FromImage($bitmap)
    $graphics.CopyFromScreen($bounds.Location, [System.Drawing.Point]::Empty, $bounds.Size)
    $bitmap.Save($outputPath, [System.Drawing.Imaging.ImageFormat]::Png)
    $graphics.Dispose()
    $bitmap.Dispose()
}

# Pertanyaan awal
Write-Host "Pertanyaan akan Di Mulai dalam 5 detik !"
Start-Sleep -Seconds 5
Clear-Host
$jawab = Read-Host "Apakah kamu ingin menjawab pertanyaan? (y/n)"
if ($jawab -ne 'y') {
    Write-Host "Batal."
    exit
}

# Pertanyaan asal
Clear-Host
$asal = Read-Host "Apakah Kamu Dari Mana? (J = Jawa, S = Sunda)"

if ($asal -eq 'J') {
    Write-Host "We ada orang Jawa!"
    Start-Process "https://www.youtube.com/watch?v=8NBQBYHI5tM"
    Start-Sleep -Seconds 2
    Start-Process "https://www.youtube.com/watch?v=eqm5xV2hC7I"
} elseif ($asal -eq 'S') {
    Write-Host "We ada orang Sunda!"
    Start-Process "https://www.youtube.com/watch?v=eqm5xV2hC7I"
} else {
    Write-Host "Input tidak dikenali."
    exit
}

# Tunggu 9 detik agar video YouTube mulai
Write-Host "`nLagu Jawa & Sunda..."
Start-Sleep -Seconds 4

# Buka halaman IP
Write-Host "Dimana yah si hitam ini."
Start-Sleep -Seconds 2
Write-Host "Mari Kita cekidot mari kita doxing Wkwkwkwk"
Start-Process "https://ipinfo.io/what-is-my-ip"
Start-Sleep -Seconds 5

# Simpan screenshot
$folder = "$env:USERPROFILE\Pictures\ipss"
$outputFile = Join-Path $folder "ipinfo.png"

if (!(Test-Path $folder)) {
    New-Item -ItemType Directory -Path $folder | Out-Null
}

Write-Host "Mengambil screenshot..."
Take-Screenshot -outputPath $outputFile

# Buka folder dan gambar
Start-Process "explorer.exe" $folder
Start-Process $outputFile
