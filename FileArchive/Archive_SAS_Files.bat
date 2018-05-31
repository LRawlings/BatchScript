@Echo off


Echo.  >>D:\StuTalkData\SAS-Combined-Daily-Files\Archive\log.txt
Echo.===========================================>>D:\StuTalkData\SAS-Combined-Daily-Files\Archive\log.txt
Echo.%Date% %Time%>>D:\StuTalkData\SAS-Combined-Daily-Files\Archive\log.txt

REM Set the date and time format
set d=%date:~-4,4%%date:~-7,2%%date:~0,2%
set d=%d: =_%
set t=%time:~0,2%%time:~3,2%
set t=%t: =0%


REM Copy todays SAS file to archive folder
if exist D:\StuTalkData\SAS-Combined-Daily-Files\SAS_%d%.xml (
    for %%G IN (D:\StuTalkData\SAS-Combined-Daily-Files\SAS_%d%.xml) do copy %%G D:\StuTalkData\SAS-Combined-Daily-Files\Archive\ >>D:\StuTalkData\SAS-Combined-Daily-Files\Archive\log.txt
) else (
    Echo No SAS File with today's date found in folder>>D:\StuTalkData\SAS-Combined-Daily-Files\Archive\log.txt
)

REM Re-name the file just copied to include the time archived
ren D:\StuTalkData\SAS-Combined-Daily-Files\Archive\SAS_%d%.xml SAS_%d%_%t%.xml

REM Check if the re-named file exists in the archive file and write to the log if successful
if exist D:\StuTalkData\SAS-Combined-Daily-Files\Archive\SAS_%d%_%t%.xml (
    Echo Rename to SAS_%d%_%t%.xml Successful>>D:\StuTalkData\SAS-Combined-Daily-Files\Archive\log.txt
) else (
    exit
)