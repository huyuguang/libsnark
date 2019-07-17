1, Install vcpkg in root of c:  
git clone https://github.com/microsoft/vcpkg  
cd vcpkg  
.\bootstrap-vcpkg.bat  

2, Install depends by vcpkg  
cd vcpkg  
vcpkg install mpir mpir:x64-windows mpir:x86-windows-static mpir:x64-windows-static  
vcpkg install boost boost:x64-windows boost:x86-windows-static boost:x64-windows-static  
vcpkg install cryptopp cryptopp:x64-windows cryptopp:x86-windows-static cryptopp:x64-windows-static  
vcpkg install openssl openssl:x64-windows openssl:x86-windows-static openssl:x64-windows-static  

3, Open libsnark.sln by msvc2019 and build  
Only support msvc2019 now.  

4, install header files:  
cd msvc  
.\install.bat