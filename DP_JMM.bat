@echo off
mode con lines=22 cols=86
echo>list.txt
echo>list.txt list disk
@echo on
diskpart -s list.txt
@echo off
set /p disco="Entre com o Disco: "
echo:
echo>move.txt
echo>move.txt list disk
echo>>move.txt select disk %disco%
echo>>move.txt clean
echo>>move.txt create partition primary
echo:
echo Escolha o tipo de formatacao:
echo:
echo [1] FAT32
echo [2] NTFS

set /p formatacao="Entre com numero do tipo de formatacao: "

if "%formatacao%" == "1" goto op1
if "%formatacao%" == "2" goto op2

:op1
echo>>move.txt format fs=fat32 quick

:op2
echo>>move.txt format fs=ntfs quick

echo>>move.txt active
echo>>move.txt assign
@echo off
diskpart -s move.txt
echo:
del /f list.txt
del /f move.txt
pause
exit /b