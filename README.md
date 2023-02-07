# **IREM** : **I**nitialize **R**epository file structure for Node.js **E**xpress and **M**ySQL

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

## Inputs (* : required)
### `github-repo-url*`
Your github repository url where you want to initialize

### `github-user-id*` 
Your github ID

### `github-user-email*` 
Your github Email

### `github-token*`
Your github Personal Access Token (PAT)

**Please add PAT to GitHub Secrets in the repo**

## Example
```yaml
name: Setup Nodejs Express && MySQL Directory Structure

on:
  workflow_dispatch:
    inputs:
      github-repo-url:
        description: "GitHub Repository URL which you want to Setup"
        required: true
        default: ''
      github-user-id: 
        description: "GitHub User ID"
        required: true
        default: ''
      github-user-email:
        description: "GitHub User Email"
        required: true
        default: ''

jobs:
   git_clone_test:
    runs-on: ubuntu-latest
    name: Git clone test
    steps:
      - name: Checkout
        uses: actions/checkout@v3
      - name: Setup Repository
        uses: actions/IREM@v1.0.1
        with:
          github-repo-url: ${{ inputs.github-repo-url }}
          github-user-id: ${{ inputs.github-user-id }}
          github-user-email: ${{ inputs.github-user-email }}
          github-token: ${{ secrets.GH_TOKEN }}
```

## File Structure


## Usage Scenario
1. Make repository on your github
2. Write and add a workflow file to ./github/workflows/ . See Example.
3. Trigger the action according to the format you created.
4. Check if it works well on the action tap and your repository.


## License
The scripts and documentation in this project are released under the [MIT License](LICENSE).
