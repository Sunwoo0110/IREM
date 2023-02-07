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
### 1. Make repository on your github
![image](https://user-images.githubusercontent.com/81512592/217377254-6276a7c9-0909-40ca-8e96-97d447088895.png)


### 2. Write and add a workflow file to ./github/workflows/ . See Example.
![image](https://user-images.githubusercontent.com/81512592/217377000-6b74d01b-9972-43d1-8cfe-bd6ae8f244e7.png)
![image](https://user-images.githubusercontent.com/81512592/217376894-7e6a8423-6921-4679-88ba-99ee83b8194d.png)
![image](https://user-images.githubusercontent.com/81512592/217376712-b6e5fc29-a691-4bdd-b1db-5c1cbe9cf259.png)

### **3. Add your PAT to GitHub.Secrets** (variable name : GH_TOKEN) 
![image](https://user-images.githubusercontent.com/81512592/217376528-26c88926-8aca-431c-be4e-2127feb31187.png)
![image](https://user-images.githubusercontent.com/81512592/217376456-f735c974-ef3e-4b35-a2fb-beba948a76b1.png)
![image](https://user-images.githubusercontent.com/81512592/217376183-7fddd2db-66aa-4978-a42c-8412f5f6eea8.png)
![image](https://user-images.githubusercontent.com/81512592/217376121-02012365-96c7-4e46-ba59-973153388808.png)
![image](https://user-images.githubusercontent.com/81512592/217375924-c11ad83c-4639-45c6-88b8-c5d8983ecb45.png)
![image](https://user-images.githubusercontent.com/81512592/217376044-24582845-baf4-4267-b3ca-598d70bf52e2.png)
![image](https://user-images.githubusercontent.com/81512592/217375858-397d8503-5863-4f36-aa90-91d3d06e0c14.png)

### 4. Trigger the action according to the format you created.
In this example, we use [workflow_dispatch] trigger.
![image](https://user-images.githubusercontent.com/81512592/217376673-93961aa6-d72d-4d54-a134-bd1c6bd344d5.png)
![image](https://user-images.githubusercontent.com/81512592/217376645-8b5a16d0-f0fa-4453-a093-db73954c60fa.png)
![image](https://user-images.githubusercontent.com/81512592/217378343-c6635cae-44aa-49ca-92d4-e1c1fc9e2789.png)

### 5. Check if it works well on the action tap and your repository.
![image](https://user-images.githubusercontent.com/81512592/217378657-a9798097-b17b-4cc9-8bbe-6186fd3d3f76.png)
![image](https://user-images.githubusercontent.com/81512592/217378713-e0cfff16-62d8-4c13-9370-9243edb10844.png)
![image](https://user-images.githubusercontent.com/81512592/217378765-dd689e14-44bc-4f3f-8d56-c24c52d7d90d.png)


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
