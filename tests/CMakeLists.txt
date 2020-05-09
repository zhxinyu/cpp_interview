include_directories(${CMAKE_CURRENT_BINARY_DIR})

set(CODING_TESTS tests)
file(GLOB TEST_SRC_FILES ${PROJECT_SOURCE_DIR}/tests/*.cpp)

add_executable(${CODING_TESTS} ${TEST_SRC_FILES})
set_target_properties(${CODING_TESTS} PROPERTIES COMPILE_FLAGS "-Wl,--whole-archive ${OPTIMIZATION_OVERRIDE}")
target_link_libraries(${CODING_TESTS}
	${CMAKE_THREAD_LIBS_INIT}
	${Boost_LIBRARIES}
	GTest::GTest GTest::Main
	${COMMON_LIBS})
add_test(coding_tests ${CODING_TESTS})
install(TARGETS ${CODING_TESTS} RUNTIME DESTINATION ${TARGET_TEST_DIR})
