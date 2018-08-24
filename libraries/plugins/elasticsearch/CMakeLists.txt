file(GLOB HEADERS "include/graphene/elasticsearch/*.hpp")

add_library( graphene_elasticsearch
        elasticsearch_plugin.cpp
           )
if(MSVC)
   find_package(CURL REQUIRED)
   include_directories(${CURL_INCLUDE_DIRS}) 
   set_source_files_properties(elasticsearch_plugin.cpp PROPERTIES COMPILE_FLAGS "/bigobj" )
endif(MSVC)
target_link_libraries( graphene_elasticsearch graphene_chain graphene_app curl )
target_include_directories( graphene_elasticsearch
                            PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/include" 
                            PUBLIC "${CURL_INCLUDE_DIR}" )


install( TARGETS
   graphene_elasticsearch

   RUNTIME DESTINATION bin
   LIBRARY DESTINATION lib
   ARCHIVE DESTINATION lib
)
INSTALL( FILES ${HEADERS} DESTINATION "include/graphene/elasticsearch" )

