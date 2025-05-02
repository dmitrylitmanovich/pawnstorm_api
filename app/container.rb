register "repositories.user_repo", -> {
  PawnstormApi::Repositories::UserRepo.new(resolve("persistence"))
}
