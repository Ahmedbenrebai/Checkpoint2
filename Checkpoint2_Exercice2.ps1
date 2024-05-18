#Q.2.1  j'ai réussi à transférer les fichiers du serveur vers le client en utilisant la méthode de partage de dossier dans le réseau, (on a discuté sur Slack) 
#Q.2.3 L'option -Verb RunAs dans la commande Start-Process est utilisée pour exécuter le processus avec des privilèges élevés
#Q.2.4 L'option -WindowStyle Maximized spécifie le style de fenêtre à utiliser lorsque le processus est lancé.
#Q.2.5 : Changé -Skip 2 en -Skip 1.
#Q.2.6 : Ajout de $Description dans $UserInfo.
#Q.2.9  : Import-Module ou Appel direct $LogFilePath
#Q.2.16 :Cette fonction est utilisée pour standardiser les noms d'utilisateur en supprimant les accents et en mettant tout en minuscules. 
#Write-Host "--- Début du script ---"

Function Random-Password ($length = 12)
{
	$punc = 46..46
	$digits = 48..57
	$letters = 65..90 + 97..122
	$password = get-random -count $length -input ($punc + $digits + $letters) |`
    	ForEach -begin { $aa = $null } -process {$aa += [char]$_} -end {$aa}
	Return $password.ToString()
}

Function ManageAccentsAndCapitalLetters
{
	param ([String]$String)
    
	$StringWithoutAccent = $String -replace '[éèêë]', 'e' -replace '[àâä]', 'a' -replace '[îï]', 'i' -replace '[ôö]', 'o' -replace '[ùûü]', 'u'
	$StringWithoutAccentAndCapitalLetters = $StringWithoutAccent.ToLower()
	$StringWithoutAccentAndCapitalLetters
}

$Path = "C:\Scripts"
$CsvFile = "$Path\Users.csv"
$LogFile = "$Path\Log.log"
$Users = Import-Csv -Path $CsvFile -Delimiter ";" -Header "prenom","nom","societe","fonction","service","description","mail","mobile","scriptPath","telephoneNumber" -Encoding UTF8  | Select-Object -Skip 1

Import-Module "C:\Scrits\Functions.psm1"

foreach ($User in $Users)
{
	$Prenom = ManageAccentsAndCapitalLetters -String $User.prenom
	$Nom = ManageAccentsAndCapitalLetters -String $User.Nom
	$Name = "$Prenom.$Nom"
	If (-not(Get-LocalUser -Name "$Prenom.$Nom" -ErrorAction SilentlyContinue))
	{
    	$Pass = Random-Password
    	$Password = (ConvertTo-secureString $Pass -AsPlainText -Force)
    	$Description = "$($user.description) - $($User.fonction)"
    	$UserInfo = @{
        	Name             	= "$Prenom.$Nom"
        	FullName         	= "$Prenom.$Nom"
        	Password         	= $Password
        	AccountNeverExpires  = $true
        	PasswordNeverExpires = $true
        	Description = $Description
    	}

    	New-LocalUser @UserInfo
    	Add-LocalGroupMember -Group "Utilisateur" -Member $Name
    	Write-Host "Le compte $Name a été créé avec le mot de passe" -Foregroundcolor Green
 	}else {
 Write-Host "Le compte $Name existe déjà" -ForegroundColor Red
        Log "Le compte $Name existe déjà"
}

pause
Write-Host "--- Fin du script ---"
Read-Host
