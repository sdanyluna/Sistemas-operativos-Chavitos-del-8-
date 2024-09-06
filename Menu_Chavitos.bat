@echo off
color 0a
title Menu de Opciones


:: =============================================================================================
:: =============================================================================================


:: Aqui inicia el codigo del menu

:menu
cls
echo ============================================
echo          Bienvenido al Menu Principal
echo ============================================
echo 1. Jugar a la Ruleta Rusa
echo 2. Generador de Contrasenas
echo 3. Suma de Matrices
echo 4. Salir
echo ============================================
set /p opcion="Selecciona una opcion (1-4): "

if "%opcion%"=="1" goto ruleta
if "%opcion%"=="2" goto generador
if "%opcion%"=="3" goto matrices
if "%opcion%"=="4" goto salir

echo Opcion invalida, intenta de nuevo.
pause
goto menu

:: Aqui termina el codigo del menu


:: =============================================================================================
:: =============================================================================================


:: Aqui inica el codigo de la ruleta
:ruleta
setlocal enabledelayedexpansion

:inicio_ruleta
cls
set /p tambor="Introduce el size del tambor: "
set /p balas="Introduce el numero de balas: "

if %balas% gtr %tambor% (
    echo El numero de balas no puede ser mayor que el tamaño del tambor.
    pause
    goto menu
)

set /a balas_colocadas=0
:colocar_balas
if !balas_colocadas! geq %balas% goto fin_colocacion
set /a azar=%random% %% %tambor% + 1
if !tambor[%azar%]! == 1 goto colocar_balas
set tambor[%azar%]=1
set /a balas_colocadas+=1
goto colocar_balas
:fin_colocacion

echo ============================================
echo              Ruleta Rusa
echo ============================================
echo Hay %balas% balas en un tambor de %tambor% posiciones.
echo Elige tu destino...

pause
set /a posicion=%random% %% %tambor% + 1
if !tambor[%posicion%]! == 1 (
    echo BOOM! Has perdido. El disparo fue fatal.
) else (
    echo Te has salvado... por esta vez.
)

set /p continuar="¿Quieres jugar de nuevo? (s/n): "
if /i "%continuar%"=="s" goto inicio_ruleta
goto menu

:: Aqui termina el codigo de la ruleta rusa


:: =============================================================================================
:: =============================================================================================


:: Aqui inicia el codigo del generador de contraseñas

:generador
cls
setlocal enabledelayedexpansion

echo ==================================================================================
set /p _RNDLength="Escriba la longitud deseada de la contrasena (max 8173): "
echo ==================================================================================
set _Alphanumeric=ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789,.!@#$%&*-_=+;:',./?
set _Str=%_Alphanumeric%987654321

:_LenLoop
if not "%_Str:~18%"=="" set _Str=%_Str:~9%& set /A _Len+=9& goto :_LenLoop
set _tmp=%_Str:~9,1%
set /A _Len=_Len+_tmp
set _count=0
set _RndAlphaNum=

:_loop
set /a _count+=1
set _RND=%Random%
set /A _RND=_RND%%%_Len%
set _RndAlphaNum=!_RndAlphaNum!!_Alphanumeric:~%_RND%,1!
if !_count! lss %_RNDLength% goto _loop

echo.
echo ==================================================================================
echo La contrasena es: !_RndAlphaNum!
echo ==================================================================================
pause
goto menu

:: Aqui termina el codigo del generador de contraseñas


:: =============================================================================================
:: =============================================================================================


:: Aqui inicia el codigo de la suma de matrices

:matrices
cls
setlocal enabledelayedexpansion

echo Esta es la suma de 2 matrices 2x2
echo Ingrese los valores para la Matriz A:
set /p A11="A11: "
set /p A12="A12: "
set /p A21="A21: "
set /p A22="A22: "

echo Ingrese los valores para la Matriz B:
set /p B11="B11: "
set /p B12="B12: "
set /p B21="B21: "
set /p B22="B22: "

set /a C11=A11+B11
set /a C12=A12+B12
set /a C21=A21+B21
set /a C22=A22+B22

echo.
echo Matriz A:
echo !A11! !A12!
echo !A21! !A22!

echo +
echo Matriz B:
echo !B11! !B12!
echo !B21! !B22!

echo =
echo Matriz C:
echo !C11! !C12!
echo !C21! !C22!

pause
goto menu

:: Aqui termina el codigo de suma de matrices


:: =============================================================================================

:salir
echo Gracias por usar el programa. Hasta luego.
pause
exit
