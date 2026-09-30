# Terraform Learning Lab

A hands-on, beginner-friendly Terraform project. Learn the core concepts step by step through small lessons.
Lessons 01-04 run **entirely on your laptop** (no cloud account, no cost). Lesson 05 is an optional AWS exercise.

## Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/install) >= 1.5
- (Lesson 05 only) an AWS account and configured credentials (`aws configure`)

## Lessons

| # | Folder | You will learn |
|---|--------|----------------|
| 01 | `01-basics` | Providers, resources, state, the init/plan/apply workflow |
| 02 | `02-variables-outputs` | Input variables, validation, locals, outputs, templates |
| 03 | `03-loops-conditionals` | `count`, `for_each`, conditionals, `for` expressions |
| 04 | `04-modules` | Writing and calling reusable modules |
| 05 | `05-aws-s3-optional` | Provisioning a real cloud resource (AWS S3) |

## How to run a lesson

```bash
cd 01-basics
terraform init      # download providers
terraform fmt       # format code
terraform validate  # check syntax
terraform plan      # preview changes
terraform apply     # create resources
terraform destroy   # clean up
```

## Exercises to try

1. **01:** Run `terraform apply` twice. What changes? Then `terraform state list`.
2. **01:** Delete the generated file manually and run `terraform plan`. What does Terraform want to do?
3. **02:** Try `terraform apply -var="environment=test"` and read the validation error.
4. **03:** Add a new entry to `servers`. Which resources are created? Set `create_readme=false` and see what is destroyed.
5. **04:** Add a third module call with a different greeting.
6. **05:** Add a `aws_s3_object` that uploads a file to the bucket. Don't forget `terraform destroy`.

## Key commands cheat sheet

| Command | Purpose |
|---------|---------|
| `terraform init` | Initialise the working directory |
| `terraform plan` | Show what will change |
| `terraform apply` | Apply changes |
| `terraform destroy` | Remove everything |
| `terraform state list` | List tracked resources |
| `terraform output` | Show output values |
| `terraform fmt -recursive` | Auto-format code |

## Cost warning

Lessons 01-04 are free. Lesson 05 creates AWS resources: always run `terraform destroy` when finished.

## License

MIT
