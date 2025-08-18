# prooflane-viewer - Repository Health Check

Write-Host 'Checking prooflane-viewer repository health...' -ForegroundColor Yellow

# Check git status
if (Test-Path '.git') {
    Write-Host '✅ Git repository detected' -ForegroundColor Green
} else {
    Write-Host '❌ Not a git repository' -ForegroundColor Red
}

# Check documentation
$indexPath = 'prooflane-viewer/src/index.html'
if (Test-Path $indexPath) {
    Write-Host "✅ Viewer index present: $indexPath" -ForegroundColor Green
} else {
    Write-Host "❌ Viewer index missing: $indexPath" -ForegroundColor Red
    exit 1
}

Write-Host 'Health check complete for prooflane-viewer' -ForegroundColor Cyan
