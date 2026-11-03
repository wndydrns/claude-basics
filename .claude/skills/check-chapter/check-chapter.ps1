param([Parameter(Mandatory=$true)][string]$Path)
if (-not (Test-Path -LiteralPath $Path)) { Write-Output "FAIL: 파일 없음 - $Path"; exit 1 }
$lines = Get-Content -LiteralPath $Path -Encoding UTF8
$problems = @()
$headings = @('## 3줄 요약','## 핵심 개념','## 따라 하기','## 예제와 다음 장')
$last = -1
foreach ($h in $headings) {
  $idx = [array]::IndexOf($lines, $h)
  if ($idx -lt 0) { $problems += "제목 없음: $h" }
  elseif ($idx -lt $last) { $problems += "제목 순서 오류: $h" }
  else { $last = $idx }
}
if ($lines.Count -gt 150) { $problems += "줄 수 초과: $($lines.Count) > 150" }
if (-not ($lines -match '확인한 날짜')) { $problems += "'확인한 날짜' 문구 없음" }
if ($problems.Count -eq 0) { Write-Output "OK ($($lines.Count)줄)" }
else { $problems | ForEach-Object { Write-Output "FAIL: $_" }; exit 1 }
