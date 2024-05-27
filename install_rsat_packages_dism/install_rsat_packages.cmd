REM Usage: install_rsat_packages.cmd <path_to_package_list>
REM Examle: C:\Dev> install_rsat_packages.cmd .\rsat_package_list_dism.txt
REM
REM Package list contains one package per line, no header. Example:
REM Rsat.DHCP.Tools~~~~0.0.1.0
REM Rsat.Dns.Tools~~~~0.0.1.0
REM Rsat.FailoverCluster.Management.Tools~~~~0.0.1.0
REM ...etc 

FOR /f %%a in ('WMIC OS GET LocalDateTime ^| find "."') DO set DTS=%%a
set LOGFILE=%DTS:~0,8%-%DTS:~8,4%.%DTS:~12,2%_install.log

for /f "delims=" %%a in (%1) do DISM /Online LogPath:%LOGFILE% Log-Level:4 /Add-Capability /CapabilityName:%%a