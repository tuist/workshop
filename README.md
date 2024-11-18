# Tuist Workshop

In this workshop, we will explore [Tuist](https://tuist.dev) by creating a project and experimenting with various features.

The workshop is structured around a series of topics that are presented and should be followed sequentially. If, for any reason, you find yourself stuck in one of the topics, you will discover a commit SHA at the end of the topic that you can use to continue with the upcoming topics.

## Assert the successful completion of a topic

To assert the successful completion of a topic,
you can run the following command passing the topic number that you just completed

```bash
# Confirming the completion of step 1
bash <(curl -sSL https://raw.githubusercontent.com/tuist/workshop/main/assert.sh) 1
```

## Requirements

- Xcode 16
- [Tuist](https://docs.tuist.dev/en/guides/quick-start/install-tuist) 4.34.3

## Topics

1. [What is Tuist?](#1-what-is-tuist)

## 1. What is Tuist?

Tuist is a command-line tool that leverages Xcode Project generation to help teams overcome the challenges of scaling up development. Examples of challenges are:

- Git conflicts in Xcode projects.
- Inconsistencies across targets and projects.
- Unmaintainable target graph that creates strong dependencies with a platform team.
- Inefficient Xcode and clean builds.
- Suboptimal CI runs that lead to slow feedback loops.

### How does it work?

You describe your projects and workspaces in **Swift files (manifests)** using a Swift-based DSL.
We drew a lot of inspiration from the Swift Package Manager.
Unlike the Swift Package Manager, which is very focused on package management,
the APIs and models that you'll find in Tuist's DSL resemble Xcode projects and workspaces.

The following is an example of a typical Tuist project's structure:

```
Tuist.swift
Project.swift
```

### Install Tuist

You can install Tuist by running the following command:

#### Using Homebrew

```bash
brew tap tuist/tuist
brew install --formula tuist
```

#### Using Mise
```bash
mise install tuist
```

## 2. Project creation

Tuist provides a command for creating projects,
`tuist init`,
but we are going to create the project manually to familiarize ourselves more deeply with the workflows and building blocks.

First of all, let's create a directory and call it `App`. Create it in this repository's directory:

```bash
mkdir -p App
cd App
```

Then we are going to create the following directories and files:

```bash
touch Project.swift
echo 'import ProjectDescription
let config = Config()' > Tuist.swift
```

> [!IMPORTANT]
> Run the following to check if the step has been completed successfully:
> ```bash
> bash <(curl -sSL https://raw.githubusercontent.com/tuist/workshop/main/test.sh) 2
> ```
