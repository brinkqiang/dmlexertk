
# 获取最新提交哈希

function(GetGitInfo)
    execute_process(
        COMMAND git rev-parse HEAD
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
        OUTPUT_VARIABLE GIT_COMMIT_HASH
        OUTPUT_STRIP_TRAILING_WHITESPACE
    )

    message(STATUS "Git commit hash: ${GIT_COMMIT_HASH}")

    # 获取当前分支名
    execute_process(
        COMMAND git rev-parse --abbrev-ref HEAD
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
        OUTPUT_VARIABLE GIT_BRANCH_NAME
        OUTPUT_STRIP_TRAILING_WHITESPACE
    )

    message(STATUS "Git branch name: ${GIT_BRANCH_NAME}")

    # 获取最近的标签
    execute_process(
        COMMAND git describe --tags
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
        OUTPUT_VARIABLE GIT_TAG
        OUTPUT_STRIP_TRAILING_WHITESPACE
    )

    message(STATUS "Git tag: ${GIT_TAG}")

    # 定义配置文件路径
    set(GIT_INFO_HEADER "${CMAKE_CURRENT_SOURCE_DIR}/cmake/git_info.h")

    # 生成头文件
    configure_file(
        ${CMAKE_CURRENT_SOURCE_DIR}/cmake/git_info.h.in
        ${GIT_INFO_HEADER}
        @ONLY
    )
endfunction(GetGitInfo)
