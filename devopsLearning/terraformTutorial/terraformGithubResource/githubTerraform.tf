
resource "github_repository" "myFirstGithubRepoUsingTerraform2" {
  name        = "myFirstGithubRepoUsingTerraform2"
  description = "myFirst Github RepoUsing Terraform2"
  visibility  = "public"
  auto_init   = true
}

# resource "github_repository" "mySecondGithubRepoUsingTerraform" {
#   name        = "mySecondGithubRepoUsingTerraform"
#   description = "mySecond Github RepoUsing Terraform"
#   visibility  = "public"
#   auto_init   = true
# }

output "terraformFirstRepoUrl" {
  value = "myFirstGithubRepoUsingTerraform url: ${github_repository.myFirstGithubRepoUsingTerraform2.ssh_clone_url} mySecondGithubRepoUsingTerraform URL"
}