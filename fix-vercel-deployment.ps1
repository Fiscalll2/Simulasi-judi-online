# Script untuk memindahkan file dari subdirektori ke root untuk Vercel
# Jalankan script ini di PowerShell di folder repository Anda

Write-Host "Memindahkan file untuk Vercel deployment..." -ForegroundColor Green

# Cek apakah folder ada
if (Test-Path "Simulasi-Bahaya-Judi-Online-master") {
    Write-Host "Folder ditemukan, memindahkan file..." -ForegroundColor Yellow
    
    # Pindahkan semua file dan folder
    Get-ChildItem -Path "Simulasi-Bahaya-Judi-Online-master" | ForEach-Object {
        $destination = Join-Path -Path "." -ChildPath $_.Name
        if (Test-Path $destination) {
            Write-Host "File $($_.Name) sudah ada, melewati..." -ForegroundColor Yellow
        } else {
            Move-Item -Path $_.FullName -Destination $destination -Force
            Write-Host "Memindahkan: $($_.Name)" -ForegroundColor Green
        }
    }
    
    # Hapus folder kosong
    if ((Get-ChildItem -Path "Simulasi-Bahaya-Judi-Online-master" -Force | Measure-Object).Count -eq 0) {
        Remove-Item -Path "Simulasi-Bahaya-Judi-Online-master" -Force
        Write-Host "Folder subdirektori dihapus." -ForegroundColor Green
    }
    
    Write-Host "`nSelesai! File sudah dipindahkan ke root." -ForegroundColor Green
    Write-Host "Sekarang commit dan push ke GitHub:" -ForegroundColor Cyan
    Write-Host "  git add ." -ForegroundColor White
    Write-Host "  git commit -m 'Fix: Move files to root for Vercel'" -ForegroundColor White
    Write-Host "  git push" -ForegroundColor White
} else {
    Write-Host "Folder 'Simulasi-Bahaya-Judi-Online-master' tidak ditemukan." -ForegroundColor Red
    Write-Host "Pastikan Anda menjalankan script ini di root repository." -ForegroundColor Yellow
}

