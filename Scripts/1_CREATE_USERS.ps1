# ----- Edit these Variables for your own Use Case ----- #

# Default password to be set for all created users
$PASSWORD_FOR_USERS = "Pass123!"

# Reads a list of full names from the text file in this same folder
$USER_FIRST_LAST_LIST = Get-Content .\randomly_generated_names.txt

# ------------------------------------------------------ #

# Converts the plain text password into a secure string required by New-ADUser
$password = ConvertTo-SecureString $PASSWORD_FOR_USERS -AsPlainText -Force

# Check if the Organizational Unit _USERS already exists
$ouExists = Get-ADOrganizationalUnit -Filter {Name -eq "_USERS"} -ErrorAction SilentlyContinue

if (-not $ouExists) {
    # Creates a new Organizational Unit (OU) named "_USERS"
    Write-Host "Creating _USERS OU..." -ForegroundColor Yellow
    New-ADOrganizationalUnit -Name _USERS -ProtectedFromAccidentalDeletion $false
} else {
    Write-Host "_USERS OU already exists." -ForegroundColor Yellow
}

# Loops through each name in the list
foreach ($n in $USER_FIRST_LAST_LIST) {
    # Extract first and last name, convert to lowercase
    $first = $n.Split(" ")[0].ToLower()
    $last = $n.Split(" ")[1].ToLower()

    # Generates a username using first initial + last name (e.g., jsmith)
    $username = "$($first.Substring(0,1))$($last)".ToLower()

    # Displays the username being created
    Write-Host "Creating user: $($username)" -BackgroundColor Black -ForegroundColor Cyan
    Write-Host "Username being used: $username" -ForegroundColor Green

    # Creates the user in Active Directory
    New-AdUser -AccountPassword $password `
               -GivenName $first `
               -Surname $last `
               -DisplayName $username `
               -Name $username `
               -EmployeeID $username `
               -PasswordNeverExpires $true `
               -Path "ou=_USERS,$(([ADSI]`"").distinguishedName)" `
               -Enabled $true
}