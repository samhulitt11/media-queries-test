$ScannedNumber = Read-Host -Prompt "Scan the Number"

$Username = ""
$Password = ""
 
$SecurePassword = $Password | ConvertTo-SecureString -AsPlainText -Force
$Credentials = New-Object System.Management.Automation.PSCredential -ArgumentList $Username, $SecurePassword
 
$RcptTo = "6018636068@mms.att.net"
$Subject = "Gmail Test"
$Body = "This is a test message"

Import-Csv -Path C:\Users\samue\Desktop\testingfile.xlsx | 
Select-Object -Property Barcode |
Where-Object -FilterScript {$_.Barcode -eq $ScannedNumber} |
ForEach-Object {
   Send-MailMessage -From $Username -To $RcptTo -Subject $Subject -Body $Body -SmtpServer smtp.gmail.com -Port 587 -UseSsl -Credential $Credentials
} 


<#
if($ScannedNumber -eq "052000124859"){

    Write-Output "The barcode is correct!"
    Write-Output $Username
    Write-Output $Password
    Write-Output $RcptTo

}
else{

    Write-Output "The barcode is incorrect!"

}
#>
