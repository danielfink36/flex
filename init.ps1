$host.privatedata.ProgressBackgroundColor = "DarkGray"
$host.privatedata.ProgressForegroundColor = "Cyan"
$main_logo = "`t`t-----------------------------------------`n" + "`t`t||||||||||||||||||Flex|||||||||||||||||||`n" + "`t`t----------------------------------------- `n"


Write-Host "`n`t`t`tWelcome to the flex project" 
Write-Host ($main_logo)
do {
    Write-Host "`t||||||||| Initiate the System |||||||||||`n "
    Write-Host "`t1.) 'initiate' To start the docker service on your machine to run the flex project."
    Write-Host "`t2.) 'prep' To list out the requirements to run this project."
    Write-Host "`t3.) 'info' To head over to the github page to read up on the project."
    Write-Host "`t4.) 'quit' To exit the flex project."
    Write-Host "`n`t|||||||||||||||||||||||||||||||||||||||||`n"
    $initiate_choice = Read-Host "Enter Command"
} until (($initiate_choice -eq 'initiate') -or ($initiate_choice -eq 'info') -or ($initiate_choice -eq 'prep') -or ($initiate_choice -eq 'quit'))
switch ($initiate_choice) {
    'info' {
        Start-Process https://github.com/danielfink36/flex
    }
    'initiate' {
        Write-Host ($main_logo)
        Write-Host "Building your flex project system"
        write-progress -Activity "Building the flex Frame" -PercentComplete 10
        Start-Sleep -Seconds 1
        write-progress -Activity "Building the flex Frame" -PercentComplete 30
        Start-Sleep -Seconds 1
        write-progress -Activity "Building the flex Frame" -PercentComplete 60
        Start-Sleep -Seconds 1
        docker build -t flex/frame:v0.1 -f .\Frame\frame.dockerfile . | Out-Null
        write-progress -Activity "Launching your flex project" -PercentComplete 100 -Completed
        Start-Sleep -Seconds 2
        Write-Host "Building your flex project system`n"
        Write-Host ($main_logo)
        docker run -it flex/frame:v0.1 /bin/bash
    }
    'prep' {
        Write-Host ($main_logo)
        Write-Host "`t`nThe only thing you need to run this project on your windows machine is docker! The project runs in containers for this reason, to make deployment as few steps as possible!"
        Write-Host "`tIf you do not have docker downloaded and setup, go to this link and follow the guide and then you will be all set to run your flex system!"
        Write-Host "`t`t`t |||||||||| https://docs.docker.com/get-docker/ ||||||||||`n"
    }
    'quit' {
        Return
    }
}




