
$rbl = manage-bde -protectors -get c:
$parray += $rbl.split("", [System.StringSplitOptions]::RemoveEmptyEntries)
$parryc = [array]::indexof($parray, "Numerical")
$parrayn2ID = $parray[$parryc + 3]
$parrayn2RC = $parray[$parryc + 5]