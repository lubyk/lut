project ( lut NONE )

cmake_minimum_required ( VERSION 2.8 )

include ( cmake/dist.cmake )
include ( lua )

install(DIRECTORY lut
  DESTINATION ${INSTALL_LMOD}/lut
)

install_data ( README.md LICENSE )

# install_example ( examples/ )
