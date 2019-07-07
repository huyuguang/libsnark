add_subdirectory(gtest EXCLUDE_FROM_ALL)

include_directories(mcl/include)
add_definitions(-DMCL_DONT_USE_OPENSSL)
add_library(
  mcl
  STATIC

  mcl/src/fp.cpp  
)
#set_property(TARGET mcl PROPERTY POSITION_INDEPENDENT_CODE ON)

install(
  TARGETS
  mcl

  DESTINATION lib
)
 
install(
  DIRECTORY "mcl/include/" DESTINATION "include/depends/mcl/include"
  FILES_MATCHING
  PATTERN "*.hpp"
  PATTERN "*.h"
  PATTERN "logs" EXCLUDE
  PATTERN "tests" EXCLUDE
  PATTERN "tutorials" EXCLUDE
)
 
if(${CURVE} STREQUAL "BN128")
  include_directories(ate-pairing/include)
  include_directories(xbyak)
  add_library(
    zm
    STATIC

    ate-pairing/src/zm.cpp
    ate-pairing/src/zm2.cpp	
  )
#  set_property(TARGET zm PROPERTY POSITION_INDEPENDENT_CODE ON)

  install(
    TARGETS
    zm

    DESTINATION lib
  )

  install(
    DIRECTORY "ate-pairing/include/" DESTINATION "include/depends/ate-pairing/include"
    FILES_MATCHING
    PATTERN "*.hpp"
    PATTERN "*.h"
    PATTERN "logs" EXCLUDE
    PATTERN "tests" EXCLUDE
    PATTERN "tutorials" EXCLUDE
  )
endif()

if("${WITH_SUPERCOP}")
  include_directories(libsnark-supercop/include)

  enable_language(ASM)

  file(GLOB_RECURSE SUPERCOP_SRCS libsnark-supercop/*.c libsnark-supercop/*.s)

  add_library(
    snark_supercop
    STATIC

    ${SUPERCOP_SRCS}	
  )
#  set_property(TARGET snark_supercop PROPERTY POSITION_INDEPENDENT_CODE ON)

  target_link_libraries(
    snark_supercop

    ${CRYPTO_LIBRARIES}
  )
endif()

if(NOT "${USE_LINKED_LIBRARIES}")    
  OPTION(IS_LIBFF_PARENT OFF)
  add_subdirectory(libff)

  OPTION(IS_LIBFQFFT_PARENT OFF)
  add_subdirectory(libfqfft)
endif()

install(
  DIRECTORY "libfqfft/libfqfft/" DESTINATION "include/libfqfft"
  FILES_MATCHING
  PATTERN "*.hpp"
  PATTERN "*.tcc"
  PATTERN "logs" EXCLUDE
  PATTERN "tests" EXCLUDE
  PATTERN "tutorials" EXCLUDE
)