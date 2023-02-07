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

## Usage Scenario
1. Make repository on your github
2. Write and add a workflow file to ./github/workflows/ . See Example.
3. Trigger the action according to the format you created.
4. Check if it works well on the action tap and your repository.

## After action executed
1. Clone your repository and pull to local directory
2. Create your env file about mysql. See env.sample file.
3. Type npm install, then node_nodules and package-lock.json will created.
4. If you want to start server, type npm start.
4. To make api, add file to src/routes and router to src/index.js. See test code.

## Expected Completed File Structure After Action
```bash
* 📦 [Your Repo]
  ├──  package.json
  ├──  .env.sample
  ├──  src
  │   ├──  config
  │   │   └──  config.js
  │   ├──  routes
  │   │   ├──  test
  │   │   │   ├──  test.ctrl.js
  │   │   │   └──  index.js
  │   │   ├──  db.js
  │   │   └──  index.js
  │   ├──  app.js
  │   └──  server.js
  └──  .gitignore
```

## Default Dependencies
```yaml
body-parser: v1.20.0
dotenv: v16.0.1
express: v4.18.1
mysql2: v2.3.3
nodemon: v2.0.18
```

## File Structure
```bash
* 📦 IREM
  ├──  .github
  │   ├──  workflows
  │   │   └──  test_clone_dispatch.yml
  ├──  src
  │   ├──  make_appserver.sh
  │   ├──  make_config.sh
  │   ├──  make_env_sample.sh
  │   ├──  make_gitignore.sh
  │   ├──  make_package_dot_json.sh
  │   ├──  make_routes.sh
  │   └──  make_src_directory.sh
  ├──  Dockerfile
  ├──  action.yml
  └──  main.sh
```

## License
The scripts and documentation in this project are released under the [MIT License](LICENSE).

## Contributors
- Sungkyunkwan Univ CSE Sunwoo Kim 김선우 (Sunwoo0110) sunkim09@g.skku.edu
- Sungkyunkwan Univ CSE Jihoon Yu 유지훈 (jihooni0914) jihooni0914@gmail.com
