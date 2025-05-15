$dir = "C:\Path\To\Folder"

$exe = Get-ChildItem -Path $dir -Filter *.exe -File -Recurse # remove recurse if not needed

foreach ($e in $exe) {
	$name = "Block - $($e.Name)"
	$path = $e.FullName

	New-NetFirewallRule `
		-DisplayName $name `
		-Direction Outbound `
		-Program $path `
		-Action Block `
		-Profile Any `
		-Enabled True `
}
