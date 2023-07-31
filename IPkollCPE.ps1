$iprange = 1..47
Foreach ($ip in $iprange) {
    # Change Ethernet to your interface ID
    netsh interface ip set address "Ethernet" static 192.168.$ip.2 255.255.255.0
    
    Write-Host "Testing 192.168.$ip.1 ..."

    Start-Sleep -s 5

    $cpe = "10.120.$ip.1"
    $status = Test-Connection $cpe -count 1 -Quiet
    if ($status) {
        $cpe + " - found" 
    }  
}