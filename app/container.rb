register "repos.user_repo", -> {
  PawnstormApi::Repos::UserRepo.new(resolve("persistence"))
}
