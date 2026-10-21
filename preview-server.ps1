<#
.SYNOPSIS
  Local HTTP Preview Server for ROBIN Community Website
  Requires no Node.js, Python, or external dependencies. Runs directly in PowerShell.

.USAGE
  powershell -ExecutionPolicy Bypass -File .\preview-server.ps1
#>

$port = 3000
$root = $PSScriptRoot

$listener = New-Object System.Net.HttpListener
$prefix = "http://localhost:$port/"
$listener.Prefixes.Add($prefix)

try {
    $listener.Start()
    Write-Host "==========================================================" -ForegroundColor Green
    Write-Host " ROBIN Community Local Preview Server: $prefix" -ForegroundColor Cyan
    Write-Host " Root Directory: $root" -ForegroundColor Gray
    Write-Host " Press Ctrl+C in this terminal window to stop." -ForegroundColor Yellow
    Write-Host "==========================================================" -ForegroundColor Green

    # Open default browser
    Start-Process $prefix

    while ($listener.IsListening) {
        $context = $listener.GetContext()
        $request = $context.Request
        $response = $context.Response

        $urlPath = $request.Url.LocalPath.TrimStart('/')
        if ([string]::IsNullOrWhiteSpace($urlPath)) {
            $urlPath = "index.html"
        }

        $localFilePath = Join-Path $root $urlPath

        if (Test-Path $localFilePath -PathType Leaf) {
            $bytes = [System.IO.File]::ReadAllBytes($localFilePath)
            $ext = [System.IO.Path]::GetExtension($localFilePath).ToLower()

            $contentType = switch ($ext) {
                ".html" { "text/html; charset=utf-8" }
                ".css"  { "text/css; charset=utf-8" }
                ".js"   { "application/javascript; charset=utf-8" }
                ".svg"  { "image/svg+xml" }
                ".png"  { "image/png" }
                ".jpg"  { "image/jpeg" }
                ".jpeg" { "image/jpeg" }
                ".json" { "application/json; charset=utf-8" }
                ".xml"  { "application/xml; charset=utf-8" }
                ".txt"  { "text/plain; charset=utf-8" }
                default { "application/octet-stream" }
            }

            $response.ContentType = $contentType
            $response.ContentLength64 = $bytes.Length
            $response.StatusCode = 200
            $response.OutputStream.Write($bytes, 0, $bytes.Length)
        } else {
            $response.StatusCode = 404
            $notFoundPath = Join-Path $root "404.html"
            if (Test-Path $notFoundPath) {
                $bytes = [System.IO.File]::ReadAllBytes($notFoundPath)
                $response.ContentType = "text/html; charset=utf-8"
                $response.ContentLength64 = $bytes.Length
                $response.OutputStream.Write($bytes, 0, $bytes.Length)
            } else {
                $err = [System.Text.Encoding]::UTF8.GetBytes("404 Not Found")
                $response.OutputStream.Write($err, 0, $err.Length)
            }
        }

        $response.Close()
    }
} catch {
    Write-Host "Server stopped: $_" -ForegroundColor Red
} finally {
    $listener.Stop()
}
