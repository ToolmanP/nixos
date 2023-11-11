{vcs,...}:
{
  programs.git = {
    enable = true;
    userEmail = vcs.git.email;
    userName = vcs.git.name;
  };
}
