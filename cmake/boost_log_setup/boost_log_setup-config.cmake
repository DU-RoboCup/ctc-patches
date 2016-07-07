get_filename_component(_boost_root "${CMAKE_CURRENT_LIST_FILE}" PATH)
set(_boost_root "${_boost_root}/../../..")
get_filename_component(_boost_root ${_boost_root} ABSOLUTE)

set(BOOST_LOG_SETUP_LIBRARIES
  ${_boost_root}/lib/libboost_log_setup-mt-1_55.so
  CACHE INTERNAL "" FORCE
)

set(BOOST_LOG_SETUP_INCLUDE_DIRS
  ${_boost_root}/include/boost-1_55
  CACHE INTERNAL "" FORCE
)

qi_persistent_set(BOOST_LOG_SETUP_DEPENDS "BOOST_LOG")
export_lib(BOOST_LOG_SETUP)
