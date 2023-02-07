# Setup Node.js Express and MySQL

This action provides the following functionality for GitHub Actions users:
- Initializing your repository file structure for Node.js Express and MySQL
- Automatically detecting .env file and setting it accordingly **(Not implemented yet)**

## Basic usage

see [action.yml](action.yml) and [.github/workflows/test_clone_dispatch.yaml](.github/workflows/test_clone_dispatch.yaml).


```yaml
steps:
  - name: Checkout
    uses: actions/checkout@v3
  - name: Setup Repository
    uses: actions/IREM@v1
    with:
      github-repo-url: ${{ inputs.github-repo-url }}
      github-user-id: ${{ inputs.github-user-id }}
      github-user-email: ${{ inputs.github-user-email }}
      github-token: ${{ secrets.GITHUB_TOKEN }}
```

**inputs** (* : required)
- github-repo-url* : Your github repository url where you want to initialize
- github-user-id* : Your github ID
- github-user-email* : Your github Email
- github-token* : Your github Personal Access Token (PAT)

**Please add PAT to GitHub Secrets in the repo**

## Usage process example
예시 보여주기


## License
The scripts and documentation in this project are released under the [MIT License](LICENSE).
