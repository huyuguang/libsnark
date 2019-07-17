mkdir include

rmdir /s/q .\include\libsnark
mkdir .\include\libsnark
del .\include\libsnark\excludes.txt
echo tests >> .\include\libsnark\excludes.txt
echo examples >> .\include\libsnark\excludes.txt
xcopy /S /R /I /Y /EXCLUDE:.\include\libsnark\excludes.txt ..\libsnark\*.tcc .\include\libsnark
xcopy /S /R /I /Y /EXCLUDE:.\include\libsnark\excludes.txt ..\libsnark\*.hpp .\include\libsnark
del .\include\libsnark\excludes.txt

rmdir /s/q .\include\libff
mkdir .\include\libff
del .\include\libff\excludes.txt
echo tests >> .\include\libff\excludes.txt
echo examples >> .\include\libff\excludes.txt
xcopy /S /R /I /Y /EXCLUDE:.\include\libff\excludes.txt ..\depends\libff\libff\*.tcc .\include\libff
xcopy /S /R /I /Y /EXCLUDE:.\include\libff\excludes.txt ..\depends\libff\libff\*.hpp .\include\libff
del .\include\libff\excludes.txt

rmdir /s/q .\include\libfqfft
mkdir .\include\libfqfft
del .\include\libfqfft\excludes.txt
echo tests >> .\include\libfqfft\excludes.txt
echo examples >> .\include\libfqfft\excludes.txt
xcopy /S /R /I /Y /EXCLUDE:.\include\libfqfft\excludes.txt ..\depends\libfqfft\libfqfft\*.tcc .\include\libfqfft
xcopy /S /R /I /Y /EXCLUDE:.\include\libfqfft\excludes.txt ..\depends\libfqfft\libfqfft\*.hpp .\include\libfqfft
del .\include\libfqfft\excludes.txt

mkdir .\include\depends
mkdir .\include\depends\mcl
rmdir /s/q .\include\depends\mcl
mkdir .\include\depends\mcl
mkdir .\include\depends\mcl\include
xcopy /S /R /I /Y ..\depends\mcl\include\* .\include\depends\mcl\include
