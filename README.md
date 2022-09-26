## Github Actions

The pipelines are manage in the folder [.github/workflows/](.github/workflows)

### Terraform version 

The pipeline setup terraform in a step that takes the version as a parameter (following [semver ranges](https://www.npmjs.com/package/semver#ranges))

For exemple :
```
      - name: "Setup Terraform"
        uses: "hashicorp/setup-terraform@v1"
        with:
          terraform_version: "~1.1.0"
```
Will always use get the last patch of the 1.1 release.

### Access to private Github repositories

To allow the pipeline to connect to private Github repositories, you must configure the following env variable:

```
CREDENTIALS_FOR_GH_PRIVATE_REPOS=https://[USER]:[TOKEN]@github.com/
```

> USER and TOKEN can be found in the following Gopass entry: `c2c/c2c_mgmtsrv/github-c2c-infra-robot/token`

The workflow must also contain the following step:

```
- uses: de-vri-es/setup-git-credentials@v2
  with:
    credentials: ${{secrets.CREDENTIALS_FOR_GH_PRIVATE_REPOS}}
```
