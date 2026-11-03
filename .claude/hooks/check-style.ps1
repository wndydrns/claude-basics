# Claude가 chapters/ 안의 장 파일(0N-*.md)을 쓰거나 고친 직후에 실행된다.
# 대시(—, –)나 자기 설명 문장이 있으면 exit 2로 Claude에게 알려 다시 고치게 한다.
[Console]::InputEncoding = [Text.Encoding]::UTF8
[Console]::OutputEncoding = [Text.Encoding]::UTF8
$raw = [Console]::In.ReadToEnd()
if (-not $raw) { exit 0 }
$path = ($raw | ConvertFrom-Json).tool_input.file_path
if (-not $path) { exit 0 }
if ((Split-Path $path -Leaf) -notmatch '^0\d-.*\.md$') { exit 0 }
if ($path -notmatch '[\\/]chapters[\\/]') { exit 0 }
if ($path -match '[\\/](examples|docs)[\\/]') { exit 0 }
if (-not (Test-Path -LiteralPath $path)) { exit 0 }

$text = Get-Content -LiteralPath $path -Raw -Encoding UTF8
$found = @()
if ($text -match "[—–]") { $found += "대시(—, –)" }
if ($text -match "이 가이드에서[^.\n]*다룹니다|여기까지만 다룹니다") { $found += "문서가 자기를 설명하는 문장" }

if ($found.Count -gt 0) {
  [Console]::Error.WriteLine("문체 점검: $(Split-Path $path -Leaf)에 $($found -join ', ')이(가) 있습니다. humanizer 스킬 기준으로 고쳐 주세요.")
  exit 2
}
exit 0
