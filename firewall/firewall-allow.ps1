$dir = "C:\Path\To\Folder"

$exe = Get-ChildItem -Path $dir -Filter *.exe -File -Recurse # remove recurse if not needed

foreach ($e in $exe) {
	$name = "Allow - $($e.Name)"
	$path = $e.FullName

	New-NetFirewallRule `
		-DisplayName $name `
		-Direction Outbound `
		-Program $path `
		-Action Allow `
		-Profile Any `
		-Enabled True `
}
