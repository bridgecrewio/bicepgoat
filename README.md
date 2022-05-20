# BicepGoat - Vulnerable Bicep and ARM Infrastructure

[![Maintained by Bridgecrew.io](https://img.shields.io/badge/maintained%20by-bridgecrew.io-blueviolet)](https://bridgecrew.io/?utm_source=github&utm_medium=organic_oss&utm_campaign=bicepgoat)
[![slack-community](https://img.shields.io/badge/Slack-4A154B?style=plastic&logo=slack&logoColor=white)](https://slack.bridgecrew.io/)

BicepGoat is Bridgecrew's "Vulnerable by Design" Bicep and ARM repository.
![BicepGoat](bicepgoat-logo.png)

BicepGoat is a learning and training project that demonstrates how common configuration errors can find their way into production cloud environments.

## Introduction

BicepGoat was built to enable DevSecOps design and implement a sustainable misconfiguration prevention strategy. It can be used to test a policy-as-code framework like [Bridgecrew](https://bridgecrew.io/?utm_source=github&utm_medium=organic_oss&utm_campaign=bicepgoat) & [Checkov](https://github.com/bridgecrewio/checkov/), inline-linters, pre-commit hooks or other code scanning methods.

BicepGoat follows the tradition of existing *Goat projects that provide a baseline training ground to practice implementing secure development best practices for cloud infrastructure.

## Important notes

**Where to get help:** the [Bridgecrew Community Slack](https://slack.bridgecrew.io/?utm_source=github&utm_medium=organic_oss&utm_campaign=bicepgoat)

Before you proceed please take a note of these warning:
> :warning: BicepGoat creates intentionally vulnerable Azure resources into your account. **DO NOT deploy BicepGoat in a production environment or alongside any sensitive Azure resources.**

## Bridgecrew's IaC herd of goats

* [BicepGoat](https://github.com/bridgecrewio/bicepgoat) - Vulnerable by design Bicep templates
* [CDKGoat](https://github.com/bridgecrewio/cdkgoat) - Vulnerable by design CDK application
* [CfnGoat](https://github.com/bridgecrewio/cfngoat) - Vulnerable by design Cloudformation template
* [TerraGoat](https://github.com/bridgecrewio/terragoat) - Vulnerable by design Terraform stack
* [kustomizegoat](https://github.com/bridgecrewio/kustomizegoat) - Vulnerable by design kustomize deployment

## Contributing

Contribution is welcomed!

We would love to hear about more ideas on how to find vulnerable infrastructure-as-code design patterns.

## Support

[Bridgecrew](https://bridgecrew.io/?utm_source=github&utm_medium=organic_oss&utm_campaign=bicepgoat) builds and maintains BicepGoat to encourage the adoption of policy-as-code.

If you need direct support you can contact us at [info@bridgecrew.io](mailto:info@bridgecrew.io).