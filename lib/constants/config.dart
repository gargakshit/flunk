final String clientId = "be8be6acbff87009317f";
final String clientSecret = "29a33886e6a50458e0a6841c48af23940b4a7b59";
final String callback = "githubdashboardflunk";

final Uri oauthUri = Uri.https("github.com", "login/oauth/authorize", {
  "client_id": clientId,
  // "redirect_uri": "$callback://",
  "scope":
      "user public_repo repo repo_deployment repo:status read:repo_hook read:org",
});

final Uri tokenUri = Uri.https("github.com", "login/oauth/access_token", {
  "client_id": clientId,
  // "redirect_uri": "$callback://",
  "client_secret": clientSecret,
});
