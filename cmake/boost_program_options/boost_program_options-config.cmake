get_filename_component(_boost_root "${CMAKE_CURRENT_LIST_FILE}" PATH)
set(_boost_root "${_boost_root}/../../..")
get_filename_component(_boost_root ${_boost_root} ABSOLUTE)

set(BOOST_PROGRAM_OPTIONS_LIBRARIES
  ${_boost_root}/lib/libboost_program_options-mt-1_55.so
  CACHE INTERNAL "" FORCE
)

set(BOOST_PROGRAM_OPTIONS_INCLUDE_DIRS
  ${_boost_root}/include/boost-1_55
  CACHE INTERNAL "" FORCE
)

export_lib(BOOST_PROGRAM_OPTIONS)
