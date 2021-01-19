<#   Cody Kono
     CIT - 299 - My Little Port Scanner
     
     The second portion is what I was able to get prior to the last class meeting.
     
#>



$ports = 80..100
 $ErrorActionPreference = 'silentlycontinue'
 $host_counter = 0
 $ip = Get-Content ip_list_1line.txt
$list = @{}
$log = "my_transcript.log"
if(
   (Get-Content ip_list_1line.txt) -match ",")
{
  #Parse one type of file
    (Get-Content ip_list_1line.txt) | ForEach {$list+= $_ -split ","}

} else {
    #Parse the other type
    (Get-Content ip_list_1line.txt) | ForEach {$list+= $_}

}
   


Get-Content ip_list.txt
 ForEach ($ip in $list) {
            $host_counter++
            $port_counter = 0
            Write-Progress -Id 0 -Activity "Scanning Host" $ip -PercentComplete (($host_counter/$list.Count)*100)
 if(Test-Connection ...){
   ForEach($port in $ports){
            $port_counter++
            Write-Progress -Id 0 -Activity "Scanning Host" $port -PercentComplete (($port_counter/$ports.Count)*100)
            $socket = ...
   if ($socket.Connected){
            Write-host "Port was connected"
      $socket.Close()
} else { 
            Write-host "Was unable to connect" }
}
}
}
 Stop-Transcript



<#  This is the portion of the code that I started with, but decided to 
    swap it up after the class meeting.
     
#> 


<#$port = 80
$portRange = 1..254
$ipAdresses = Get-content ip_list.txt
$ipAdresses1 = Get-content ip_list_1line.txt -split ","
$ErrorActionPreference = 'silentlycontinue'
$(Foreach ($a in $portRange)
{
$ip = "{0}.{1}" -F $ipAdresses,$a
Write-Progress "Scanning Network"$ip -PercentComplete (($a/$portRange.Count)*100)
If(Test-Connection -Buffersize 32 -Count 1 -quiet -ComputerName $ip)
{
    $socket = new-object System.Net.Sockets.TcpClient($ip, $port)
    If($socket.Connected) 
    {
     echo "$ip port $port open"
    $socket.Close() }
    else { echo "$ip port $port not open" }
}
}
)|Out-File C:\Users\codyk


$ipAdresses[1]
$ipAdresses1[1]
$ipAdresses1 -split ","
#>

#.\my_script.ps1 comma_ips.txt -ports (80..100)
 