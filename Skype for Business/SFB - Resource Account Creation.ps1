<#
.SYNOPSIS
    Creating an Auto-Attendant or Call Queue Resource Account.

.NOTES
You can only assign Cloud call queues toll and toll-free service phone numbers that you got in the Microsoft Teams admin center or transferred from another service provider.
Communications Credits are required for toll-free service numbers.
A call queue can be dialed directly or accessed by a selection on an auto attendant.
A call queue is required to have an associated resource account.
You don't directly associate a phone number to a call queue, instead the phone number is associated to a resource account.
When you assign a phone number to a resource account, you can now use the cost-free Phone System Virtual User license.
Phone System allows phone numbers at the organizational level for use with low-cost auto attendant and call queue services.

Auto Attendant: ce933385-9390-45d1-9512-c8d228074e07
Call Queue: 11cd3e2e-fccb-42ad-ad00-878b93575e07

.LINK
https://docs.microsoft.com/en-us/microsoftteams/manage-resource-accounts
https://docs.microsoft.com/en-us/microsoftteams/create-a-phone-system-call-queue
https://docs.microsoft.com/en-us/microsoftteams/create-a-phone-system-auto-attendant
https://docs.microsoft.com/en-us/powershell/module/skype/new-csonlineapplicationinstance?view=skype-ps
https://docs.microsoft.com/en-us/powershell/module/skype/set-csonlineapplicationinstance?view=skype-ps
#>

<# Connect to Skype for Business Online. #>
$me = "admin@domain.onmicrosoft.com";
Import-Module SkypeOnlineConnector;
$session_sfb = New-CsOnlineSession -UserName $me;
Import-PSSession $session_sfb;


<# Create an auto-attendant resource account? #>
$upn = "aa@domain.com";
$display = "Auto Attendant Resource Account";
$id_aa = "ce933385-9390-45d1-9512-c8d228074e07";
New-CsOnlineApplicationInstance -ApplicationId $id_aa -UserPrincipalName $upn -DisplayName $display;

<# Create a call queue resource account? #>
$upn = "cq@domain.com";
$display = "Call Queue Resource Account";
$id_cq = "11cd3e2e-fccb-42ad-ad00-878b93575e07";
New-CsOnlineApplicationInstance -ApplicationId $id_cq -UserPrincipalName $upn -DisplayName $display;


<# Assign hybrid number to resource account? #>
$number = "+11231231234";
Set-CsOnlineApplicationInstance -UserPrincipalName $upn -OnpremPhoneNumber $number;
