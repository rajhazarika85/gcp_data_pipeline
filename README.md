# gcp_data_pipeline

## Install Terraform
    - `brew tap hashicorp/tap`
    - `brew install hashicorp/tap/terraform`

- `terraform -version`


## Install Google Cloud SDK (gcloud)
- Mac (zsh)

    - If you use Homebrew (recommended):

        `brew install --cask google-cloud-sdk`


    - Then add it to your shell (zsh):

        `echo 'source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"' >> ~/.zshrc`
        `echo 'source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"' >> ~/.zshrc`
        `source ~/.zshrc`


## Authenticate with GCP
Step 1 – Authenticate with GCP
    - Run: `gcloud auth application-default login`
    - A browser window will open.
    - Log in with the Google account that has access to your project.
    - This will save credentials in:
        - `~/.config/gcloud/application_default_credentials.json`

