#include "cmake/git_info.h"
#include <iostream>
void printGitInfo()
{
   std::cout << "Commit Hash: " << GIT_COMMIT_HASH << std::endl;
   std::cout << "Branch Name: " << GIT_BRANCH_NAME << std::endl;
   std::cout << "Tag: " << GIT_TAG << std::endl;
}

int main()
{
   printGitInfo();

   return 0;
}