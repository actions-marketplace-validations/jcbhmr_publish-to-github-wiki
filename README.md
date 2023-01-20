# Publish to GitHub wiki

📖 GitHub Action to sync a folder to the GitHub wiki

<div align="center">

![](https://user-images.githubusercontent.com/61068799/210448771-8926fa1d-eabb-4d92-8fa0-56468c05f3b2.png)

</div>

📂 Keep your dev docs in sync with your code \
🔁 Able to open PRs with docs updates \
🗂️ Use the fancy GitHub wiki reader view

## Installation

![GitHub Actions](https://img.shields.io/static/v1?style=for-the-badge&message=GitHub+Actions&color=2088FF&logo=GitHub+Actions&logoColor=FFFFFF&label=)

Add a GitHub Actions workflow file to your `.github/workflows/` folder similar
to the example shown below.

```yml
name: Publish wiki/ to GitHub wiki
on:
  push:
    branches: [main]
    paths: [wiki/**, .github/workflows/publish-wiki-to-github-wiki.yml]
concurrency:
  group: publish-wiki-to-github-wiki
  cancel-in-progress: true
jobs:
  publish-wiki-to-github-wiki:
    environment:
      name: github-wiki
      url: ${{ steps.publish-to-github-wiki.outputs.page_url }}
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - id: publish-to-github-wiki
        uses: jcbhmr/publish-to-github-wiki@v1
```

<!--
<details>
  <summary>Some more workflow templates that use this Action</summary>

- [publish-wiki-to-github-wiki.yml](https://github.com/jcbhmr/.github/blob/main/workflow-templates/publish-wiki-to-github-wiki.yml)

</details>
-->

⚠️ Make sure that any changes made to the Markdown files in the GitHub Action
are committed (at least locally). This GitHub Action splits the Git history, not
the state of the current directory. Untracked or uncommitted changes will be
ignored.

## Usage

![GitHub](https://img.shields.io/static/v1?style=for-the-badge&message=GitHub&color=181717&logo=GitHub&logoColor=FFFFFF&label=)

After creating your workflow file, now all you need is to put your Markdown
files in a `wiki/` folder (or whatever you set the `path` option to) and commit
them to your default branch to trigger the workflow (or whatever other trigger
you set up).

💡 Each page has an auto-generated title. It is derived from the filename by
replacing every `-` (dash) character with a space. Name your files accordingly.

```
wiki/
├── Home.md                   => Home (default page)
├── How-to-get-started.md     => How to get started
└── What-is-the-m_-prefix?.md => What is the m_ prefix?
```

💡 The `Home.md` file will automatically become the homepage, not `README.md`.
This is specific to GitHub wikis.

### Options

| Option | Description                                                                                                             | Default |
| ------ | ----------------------------------------------------------------------------------------------------------------------- | ------- |
| `path` | Path to the wiki folder with Markdown files in it. Usually this is something like "wiki" or "docs". Defaults to "wiki". | `wiki`  |

### Outputs

| Output     | Description                                        | Example                                                 |
| ---------- | -------------------------------------------------- | ------------------------------------------------------- |
| `page_url` | Deployed wiki URL. Links to GitHub wiki Home page. | `https://github.com/jcbhmr/publish-to-github-wiki/wiki` |

## Development

![Codespaces](https://img.shields.io/static/v1?style=for-the-badge&message=Codespaces&color=181717&logo=GitHub&logoColor=FFFFFF&label=)
![Devcontainers](https://img.shields.io/static/v1?style=for-the-badge&message=Devcontainers&color=2496ED&logo=Docker&logoColor=FFFFFF&label=)

This project consists of a single file. If you're making a small change, you
probably don't need a full dev environment and can just edit the file in the
GitHub web editor or [GitHub.dev].

But, if you really want some of that Bash intellisense, this project comes
with a devcontainer config equipped with a Bash extension pack and some other
GitHub Actions helpers like [`act`] and a few intellisense extensions for
`actions.yml`.

The way this project is tested is directly on this repository. The
<kbd>Wiki</kbd> tab on this repository is completely nonsensical and is there
only to test this action on itself.

[github.dev]: https://github.com/github/dev
[`act`]: https://github.com/nektos/act#readme
