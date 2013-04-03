These are the required libraries to compile EQEmuLoginServer on various distros of Linux. Use the package closest to your distro and copy the contained files libEQEmuAuthCrypto.a and libcryptopp.a to the EQEmuLoginServer directory, then make as normal. 

If none of the libraries work for your particular distro I (cavedude) will take requests, so long as it's a current distro.

64bit distro users will need to change the EQEmuLoginServer's makefile so that -march=x86-64 Bare in mind though that EQEmu and 64 bit are not entirely happy together atm, so if you can stick with 32 bit for now then do so.