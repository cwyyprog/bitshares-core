file(GLOB HEADERS "include/graphene/elasticsearch/*.hpp")

if(MSVC)
  set_source_files_properties(elasticsearch_plugin.cpp PROPERTIES COMPILE_FLAGS "/bigobj" )
  set(CURL_INCLUDE_DIR " C:/Program Files/CURL/include")
  set(CURL_LIBRARY " C:/Program Files/CURL/lib")
  find_package(CURL ${CURL_MIN_VERSION} REQUIRED)
endif(MSVC)


add_library( graphene_elasticsearch
        elasticsearch_plugin.cpp
           )

target_link_libraries( graphene_elasticsearch graphene_chain graphene_app curl )
target_include_directories( graphene_elasticsearch
                            PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/include" )


install( TARGETS
   graphene_elasticsearch

   RUNTIME DESTINATION bin
   LIBRARY DESTINATION lib
   ARCHIVE DESTINATION lib
)
INSTALL( FILES ${HEADERS} DESTINATION "include/graphene/elasticsearch" )

