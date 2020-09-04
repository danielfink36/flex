$host.privatedata.ProgressBackgroundColor = "DarkGray"
$host.privatedata.ProgressForegroundColor = "Cyan"
$main_logo = "`t`t-----------------------------------------`n" + "`t`t||||||||||||||||||Flex|||||||||||||||||||`n" + "`t`t----------------------------------------- `n"


Write-Host "`n`t`t`tWelcome to the flex project" 
Write-Host ($main_logo)
Start-Sleep -Seconds 1
do {
    Write-Host "`t||||||||| Initiate the System |||||||||||`n "
    Write-Host "`t1.) 'initiate' To start the docker service on your machine to run the flex project."
    Write-Host "`t2.) 'quit' To exit the flex project."
    Write-Host "`t3.) 'info' To head over to the github page to read up on the project."
    Write-Host "`n`t|||||||||||||||||||||||||||||||||||||||||`n"
    $initiate_choice = Read-Host "Enter Command"
} until (($initiate_choice -eq 'initiate') -or ($initiate_choice -eq 'info') -or ($initiate_choice -eq 'quit'))
switch ($initiate_choice) {
    'info' {
        docker version
      }
    'initiate' {
        Write-Host "Building your flex project system"
        write-progress -Activity "Building the flex Frame" -PercentComplete 10
        Start-Sleep -Seconds 1
        write-progress -Activity "Building the flex Frame" -PercentComplete 30
        Start-Sleep -Seconds 1
        write-progress -Activity "Building the flex Frame" -PercentComplete 60
        Start-Sleep -Seconds 1
        docker build -t flex/frame:v0.1 -f .\Frame\frame.dockerfile . | Out-Null
        docker image ls
        write-progress -Activity "Building the flex Frame" -PercentComplete 100 -Completed
        Start-Sleep -Seconds 2
    }
    'quit' {
        Return
    }
}

docker run -it flex/frame:v0.1 /bin/bash


