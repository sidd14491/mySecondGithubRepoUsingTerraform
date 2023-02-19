
resource "github_repository" "myFirstGithubRepoUsingTerraform" {
  name        = "myFirstGithubRepoUsingTerraform"
  description = "myFirst Github RepoUsing Terraform"
  visibility  = "public"
  auto_init   = true
}

resource "github_repository" "mySecondGithubRepoUsingTerraform" {
  name        = "mySecondGithubRepoUsingTerraform"
  description = "mySecond Github RepoUsing Terraform"
  visibility  = "public"
  auto_init   = true
}

output "terraformFirstRepoUrl" {
  value = "myFirstGithubRepoUsingTerraform url: ${github_repository.myFirstGithubRepoUsingTerraform.ssh_clone_url} mySecondGithubRepoUsingTerraform URL::${github_repository.mySecondGithubRepoUsingTerraform.ssh_clone_url}"
}