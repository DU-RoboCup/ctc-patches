get_filename_component(_boost_root "${CMAKE_CURRENT_LIST_FILE}" PATH)
set(_boost_root "${_boost_root}/../../..")
get_filename_component(_boost_root ${_boost_root} ABSOLUTE)

set(BOOST_DATE_TIME_LIBRARIES
  ${_boost_root}/lib/libboost_date_time-mt-1_55.so
  CACHE INTERNAL "" FORCE
)

set(BOOST_DATE_TIME_INCLUDE_DIRS
  ${_boost_root}/include/boost-1_55
  CACHE INTERNAL "" FORCE
)

qi_persistent_set(BOOST_DATE_TIME_DEPENDS "BOOST_SYSTEM")
export_lib(BOOST_DATE_TIME)
